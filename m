Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB2BC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 12:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43AB10E13D;
	Thu, 31 Jul 2025 12:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYwUZTNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861C210E13D
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 12:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753964757; x=1785500757;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=xXE/Hh0+7NBbUtUki0+kF4gNg201JKw0bp2lAux1YJU=;
 b=RYwUZTNyiHs82GfnRG3qwpgdBtNWw2uiuRZl06NEDxzMYw/1u/TXJAjD
 nVr7FF0IDxSTvpLM0K9dCLHqhCbVUnw+/Ls3ZkpY55XZIQqhfSDGIYxeQ
 CwwJx7FkxEzOeVJYovEcaQS0yv/UhGrTU9lFa+NOww8lskC7Nz5rpPSlE
 TTdyMVQTjaOmr4y4shOEmo59HvrGOEShC3lhYbehezQxFaSGmKULSre5K
 qMiXJYGQbQdzYUPB81s4SRMaWf/ybs+E9cSwaS2wwrezeSi4EwZ66Ho3R
 XNC5hXPcT/Y0F5we59ZGGx1LaDY90MJsVy0vyAEQLHvZ1Mf7QVgAbZveo A==;
X-CSE-ConnectionGUID: ap2hvnh9QvWhSVA6ohENBQ==
X-CSE-MsgGUID: kz8+tO2OReCvO/lxxwRq0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56372353"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="56372353"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 05:25:56 -0700
X-CSE-ConnectionGUID: EVJJ9A1jSreB2q0H2iU40w==
X-CSE-MsgGUID: Mz8lYXSfTWyP6dYz8Bi6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="163143681"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 05:25:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 05:25:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 05:25:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.77) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 05:25:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/ororCslLk6sbed9j5YgINVJ4tbmeqGAH1dsHtwYpGeDDerdfa+OrEp63UqL6WbREkmaGrgOVgR85qWX+rT1C3eU9e2LlUeyOMfToxQw0BT0aZh9kfixXJux/72wMfheG53HSlAOXNMgFdBpNwnqUw89Ch+IMo/HdvgPI6gXnd7gyL+bLb4RgPsa+QOAuDFyRHROzaoNOOcdvwSiMnL+C6IkZOqFc1UNsuyYCzaQd2q+qBYrYKG4J9aX4qyKl1j+CamMRlP1mJz57mpK2BNgG7bf8mdV5CGd0IHNxxXBddOXPr53FYoZLs9IgjVQ+Lg7YYEvgNDNJWrwfKNZLP1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bVXx2f8+045STjDOWAEKU81SmGdFFXPCiognJosSo0=;
 b=ZnvZn1kDOi2h14GYic1siTS5ykKkjSfTa0pYlnX0Ed5lPf6L7EK0ZrLhCLRcyMXH+Bq0VNF9GRx1AlTaktH5K+fyKR/bebqCQMHa8C1R6ThcBJxE/6TSLPN0FWq1a0ekcPOvCqn11Z4DNEZ6gLg/ej8siM0r83Rkzg4cbJkR51Z4PRL2heABO0qruD3SkpHAeKeO+vV9E9xcSCoBPOsKUGWjbPc+w1VuM8smdSHwtd1RPHwQ8/lSTdnoiHZ8beHDkw7KXV+L6587CuExEcY2GcksSxhVJc3KrD51bdMwp4wU561DAjN8QnYu0h3FhcKkNdliF9OiskX43p+cMXl7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ5PPF77ABF615C.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::836) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 12:25:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8964.023; Thu, 31 Jul 2025
 12:25:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731111214.1130130-1-jani.nikula@intel.com>
References: <20250731111214.1130130-1-jani.nikula@intel.com>
Subject: Re: [PATCH] drm/xe: fix stale comment about unordered_wq usage
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 31 Jul 2025 09:25:33 -0300
Message-ID: <175396473305.2011.17998214674503902640@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0258.namprd04.prod.outlook.com
 (2603:10b6:303:88::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ5PPF77ABF615C:EE_
X-MS-Office365-Filtering-Correlation-Id: 35aff76a-6122-4f12-29f2-08ddd02d5bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SElQUnlUL0tCY2xDSE5SRWh3NlkvM0JkS1Fub1RlTUtPcWs1S3BJb0p1VWxY?=
 =?utf-8?B?QmIyUVZLb1R5Mk83c0FjWnR4czdLK01oQXRxanBMcXVOUENkWUpPR1h4WUJr?=
 =?utf-8?B?ZjYzUjVHaEdhSXlBZy9GNzh0OG5LTUpLMUJUM3JISjkyYk90eDdENTZaZ0pE?=
 =?utf-8?B?Z05leWhzdTIrM0hMQ1BlYVNaNlJoZVp2RmVjWTk0bzVyOVJvRVFmK0dIc0dS?=
 =?utf-8?B?aEUvZnhqZm5jMTJybkVKeFFiYXdqcUR3TlcxVjdXQW8yT09GSmJzTkMrRDRM?=
 =?utf-8?B?Z05GYzlHMlFOeXRIWVV4OEl0ZHpQTmZXTHNNbmt1YUdhZk40NlI1QWcyL2s3?=
 =?utf-8?B?NS8wOVFPeDhsN2Z6MDRRMTJyQXFCSytOOEtxSzN6OGNiUEhpcUhZelNXaGVB?=
 =?utf-8?B?dUphUnd1WWNYVVZZd1ZsdGFMWWZvY3FUbkV6RkI0U011YmRvZVlIeERSOHlh?=
 =?utf-8?B?SDM2eG0vaHN2UCsrandvQkRFQk5vNUtRb04zSlRDMDEvZmJwV0w1RUVEOFM5?=
 =?utf-8?B?TWdkU25xUzVXU3VqSkhONFg5U2JCQzMyWDdRTStXTWlUd2FtMUtJS29GajJl?=
 =?utf-8?B?L0wzWVNhWmtvKzdEZ0dlSFBZVk5UKytQaUJtaFNtWkRoMW51eVg1TnNhSHF5?=
 =?utf-8?B?WlFnMVNPQjIvaktQbTZkakQwWENQT2VQeGJSNjdBazI4ZyszQWlLYlRZWmtW?=
 =?utf-8?B?YnVaU2h2UDhQRVpiOUZuOG8zR1NQUVB2OWJxNkFrV3J1Y01kbnU0Qi9qOXZK?=
 =?utf-8?B?M2ZwcXQ0TjZKcFgyUGVaTW9Oc3ZiUzlFWWtKWEptbGxZeEV3REtsbFJaelZi?=
 =?utf-8?B?ZXRVL3lHalpOQjF3RW1Pd21FWVlSKy9MV2poNUtYSkhFWEcyckZYbDJkeTdC?=
 =?utf-8?B?WmlPd3IwRlZQNUE0QWRvRkdubFRmOGhOYWZWSm83M3hTRnR2N0s0WGZEL3Jk?=
 =?utf-8?B?VCs3QVpmOEVHZFhYMFoxMzZ0WS9pM2M3d0d6TjI2dzlGWTVwYWZBVWRtaGYz?=
 =?utf-8?B?RFNtemN2TmZ2MzUxOGJmWUhwelg4ZXd6Z3Y5RDRSM05OREU3dDNKcWlScEc2?=
 =?utf-8?B?d2I0a2VFSmVaaG84RTRTc0R2UGg5VmxjekwvOWxCcVRxUnVITXN2NE8vMnR3?=
 =?utf-8?B?Qk85cnhyVkMxZzNVZEU5WUdzcWt1aVcycElpN0ZybldnUVVWUVdXMExQd1d0?=
 =?utf-8?B?Mmhmbk9pWWc2Q0taTWJ3RC9yVVl6SGpZSUNIbUdTMFRVWmZ2RFJHMnBvNUh0?=
 =?utf-8?B?bmNtaWlXSVBwWStYUkNOZndTdzUzSEtTTjIyMHY5N3djUkVkQ2xVMEdrd3Rs?=
 =?utf-8?B?NStrTTlKL1BaOFdqa0puWks4S2hkOWN0MTRmUnZqaWhKNStFSVZVbkVmZWFn?=
 =?utf-8?B?M3gzV08vUHdyMktrT3ZwU013NERyNk43MEJhbGxRSmMzN1E3TTludGdiamZm?=
 =?utf-8?B?L2RmdnZ4S1Bycm0vZ0dWSVo1UmowRzdjSDBwckdKNlpWaEgvRGdzL2tMekM5?=
 =?utf-8?B?K2ppcmQyUk1WNGlQQlB3NUQ2NGcweXpqNUdnS1M2VTdIRC9kWHF4ZmZEcW9h?=
 =?utf-8?B?OXFxZXppQWlZYWZ5Qy9aT0tGQmRseEhkZjM0U3BvL1RXZ1ZmVzVsb2Q3WWpX?=
 =?utf-8?B?NVRIZnlDNk1qT2RkVU5LZ1F1WXNQL0NDYlNwLzJWc1lUQStQaG1HMVIxR2VH?=
 =?utf-8?B?aDVIVVFVem0vaER4Y1lZc0w0YWJLZGNKQWp0NFFqRmVoaGhXYUx4Nmo0blFG?=
 =?utf-8?B?SlplRXoza3JRNVVqQ2tUTk5mVUpta3drZ1FGeWVNSklMNS9xc0hYQkVhWTVL?=
 =?utf-8?B?R2tRWWQ4clUwSk1iQmRPRWJCTEdHczlsRGNycGNUaEJybVhIc1BybHJ5UEhv?=
 =?utf-8?B?WCsvb1hHQXE5NmNPSElneGtMSnkweGs1dVdJVmwwSm1sR0RNSytlbzRocFlE?=
 =?utf-8?Q?zRWILgbKdew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWNuOXJtenA4c2s3aHN2OHFoYTU1N1IyejZ2aHlCQURiZm9QZjNjUlJTVUx6?=
 =?utf-8?B?WDdNZDFMS3dkeTJ2RzB0Um9SYmNlL1d2a0NUZVBTR2tNRC9KU3MyVWRTNUxN?=
 =?utf-8?B?cXVKWkhiRU1WWjRkaVNsbzBCUHdvd1l6dW5CQmpvL0NuSW1rV2N6U3hNYnlr?=
 =?utf-8?B?M2N5WU8wY3c3WktrUDB0T2lsb2o2NXE2Ky9yaTBxS2xtRnR5ZmJOdTBLblE4?=
 =?utf-8?B?QU5BaUlib29iZW9jSGRBdHduakl0NnoyNldtaTVZNDhmZkt0WU41Y3UyU2FG?=
 =?utf-8?B?NzhkN0FGcnlFWDh6eDEvTXBEY2ZUemY4UjVvakdEWmRYbzF6ckEyRllsT3JT?=
 =?utf-8?B?cFhmZnIvaDhTSTZCdTlPVzVubWpoaFBrVmJ0NzV4L25reFM1RXVKeGNlSTFo?=
 =?utf-8?B?S2tBTjNSWmYwRlA0VlJVbitPZVluMzhKN2hRUitLTE5tMnlVbmFrbzJxMzZV?=
 =?utf-8?B?Vy90MDd2S0R2VjI1U1djKzdyY043ZllJNDZOVUVCS3pnZTRkQkdLLzBhNWJl?=
 =?utf-8?B?amFWMmhPNDcraDNaVFFqWjlXNXJtekJYaFhBZlliYkoyWU1jaDNYUjJqcThU?=
 =?utf-8?B?VXd0RFF0ZGVHU2JhLzRTQ25HTUR2ZXQ4UWRuWkhYR0p6bmNDZ090dExDdk4z?=
 =?utf-8?B?T09MRDlmbDZBaEFId3J2NWtGdVVmRUZUdVJOank3SjE3N2w5d2hYbUwzMEtI?=
 =?utf-8?B?d2s4eG0rK1oyNUNRQjVjd24zQUx3TGdxT1h1d05VMW5ESUcrSGk1OUtad1RQ?=
 =?utf-8?B?cVo1K25YeDJodDI2T0pLTVVrRzdzRkFPWENYOWUycDhmNVN1cGZrQ2tqMDBB?=
 =?utf-8?B?ZDlzaXh5ZStNdzJaQnRNaWl0T2lxZlpxaHlEdllONUJQUmN1YUZNUGREQ3lw?=
 =?utf-8?B?TW9iZUR3enV3Vzd5VVkrTTlkd0MzYXFnb3N6L2ZCMHhsOG42bXlvdjVPLzNK?=
 =?utf-8?B?cllKS1UwaWFCSmVvTHhlTWlLc0NYTXFlQm5DaHdLWXBQek0remI5R3ZNYXhQ?=
 =?utf-8?B?RWcyZDk0ZWE2WWxkNHp1UGU3UUlLY1BPTktzM0NxVWhlU1VudEg1QTNpUklG?=
 =?utf-8?B?Z01XZFJGSUprdVBCdWtwS0QyRzNvWkxpSDFzZVhzVG5YclNETFdxVXArTFB4?=
 =?utf-8?B?ZTNISXhuRnIxNFNCdVFramNGa2lDVTNEd2VzbG9VcWV2TUFXVGFWQjBwYXIz?=
 =?utf-8?B?NVo3V2w5UkdUZy9CNEdYazcwOTIzb1NDZ1doakswZ3dGeXlXR3FWNU4va0dk?=
 =?utf-8?B?eDdiZVgxSGRZbURuSHA2R1pLUE5HRDVCR2dPczgzbmlFdTlyeUcrYWloVnhy?=
 =?utf-8?B?VXo0WG5wYWFoS1BYMm5USno2WWdWanlxQTk3elhSTFVLZnVXcWl1b0RTbnBk?=
 =?utf-8?B?VDZFTWtpUjlXYkh3emt5RnczWEpjNWJEalNZS2hsR0ozV1lLRHVUZnVBdUNK?=
 =?utf-8?B?VzBWZmt4enlxbHExTVRvOVg0K0EyRXkzcXViN2tORXplRjhlTFpML1VJRXlK?=
 =?utf-8?B?MHJZTFVVOFVCT1o2Q3BLeVg0NDBnTFdVQW1NRTJCRkkrUm9MMFprcWtBVEY5?=
 =?utf-8?B?cmlobnVSV1JvNDZ2M0xpYk50eEUyeFpYVDJiVU5vOVNXMmo3RUN2WFI2TC9L?=
 =?utf-8?B?V0tJaEMxTWdNVWJiOXVSV2NVZE5OOC9PR0YwUk1JR1BWYk1SWUtwMFRrUmtR?=
 =?utf-8?B?WUdJRTkzSDlidHIxNG9iNmtXclhxcHp4cWVTZjd4Tk1rZysrb2RyWWxCUkFu?=
 =?utf-8?B?dTJ5SWdYWGNlYnA4ek93YzZCeFNrY1dzTUw0cFpVUFU3SC84Mm8wdCswR0dj?=
 =?utf-8?B?dGlWUGpMMGJobk5kRG5WN3RkeHNkeWVxc1hSZHhjRng5eDVFdlQwN1lpZktu?=
 =?utf-8?B?b0Q0bXdZMnJwQUVlN05rbERCUG5VbXRWSEQvSzB3dFZtNU9hN1RBRmpCTXpl?=
 =?utf-8?B?K1VXeXN6RUN3UlZTclBtWFdkWHlrQStCL0RaS3dDc0l3VFFESlNTa3hNY3Yv?=
 =?utf-8?B?c0VzMGpOUDI4RlRSREhwOERWWkYzQ2Jla213Y3pKaEtwd3BoWVhGbkNhL3gv?=
 =?utf-8?B?NUE5aVlLUU9EQ3VHQmVpQ1cwdVZoNmJ4MmtpdjNwTmxzWVV2OURNTmVEQ3ht?=
 =?utf-8?B?TUFsVjZ3UUVwQVFPRGdQb3ZPS1NBNjMwQi9SbURvRkpUNEs0K0h2ODc2WFI2?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35aff76a-6122-4f12-29f2-08ddd02d5bce
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 12:25:39.1115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzk7oEwZlqyzO7HjP9ZbPrZthiQzmCoPR9KErRfvyGqaoDvFG0ellT2d+uxMNplcI4iWcnvrOnceADxC8+lYgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF77ABF615C
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Jani Nikula (2025-07-31 08:12:14-03:00)
>Display has switched to its own workqueue, no longer using
>xe->unordered_wq.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_device_types.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_=
device_types.h
>index 38c8329b4d2c..01e8fa0d2f9f 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -427,7 +427,7 @@ struct xe_device {
>         /** @ordered_wq: used to serialize compute mode resume */
>         struct workqueue_struct *ordered_wq;
>=20
>-        /** @unordered_wq: used to serialize unordered work, mostly displ=
ay */
>+        /** @unordered_wq: used to serialize unordered work */
>         struct workqueue_struct *unordered_wq;
>=20
>         /** @destroy_wq: used to serialize user destroy work, like queue =
*/
>--=20
>2.39.5
>
