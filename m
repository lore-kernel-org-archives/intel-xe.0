Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3FFC87FCB
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 16:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DBB10E104;
	Mon,  4 Aug 2025 16:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="caDndb2q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029A510E104
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754324478; x=1785860478;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PI5tfhpBpNLC4EOhcPPuCaPZgJ4r5ZWW1nsFpDFaw2A=;
 b=caDndb2q9zbhsc6Nf+YUNflj70afIjEdtZpMvhho1i8ZtlwklFjQpsXG
 Yr9n8ddyocghykaEWfBkrz+YRlKPg/2HWVWHcKTYa1BAEIdChakJbvL1j
 iJVLgS+1pv9hB33cIs9+hkG0nFoVPgYg6Etyi5HmKaPARUyvS3eKsoTdn
 iKA+Ind6Lje8Eiiyw3SMDdJZ5YCE22++HPdE4LOmW7NFFe2+MJjuqdIyU
 UJEfLRrjsTLeFxKVEOFGKnr26yojgR2GsYdlgRuSN7DbYNLKg+PiXgZPH
 5Tq5wwlozsGcrqfdFjZVo4l0396q+rRSNoeQR5UtG+LdsO/teYvsCTxKs Q==;
X-CSE-ConnectionGUID: c9lzuMEyQdKfS1H6+zSmQQ==
X-CSE-MsgGUID: bwtQNyBdT5aXxrQq/M+nAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="44187160"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="44187160"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 09:21:18 -0700
X-CSE-ConnectionGUID: IwXX4yEeTMumA5+eZ5RiJw==
X-CSE-MsgGUID: yuZHxcUQRP6edPlgtnnG2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164202073"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 09:21:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 09:21:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 09:21:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 09:21:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMp/XWY3tcbOoE049IkWeJuDqjzytsdpgnMs9CV/bqUIMzZOIW7JT3Y9/wezqhjpe6lZeyApvxZTnVOqnpPbU4v/RYxxAnUuleMshmVNVjRwTHnHYmvm5fuXwR7mefeEJxQy3ADUP2KADSdVC0Vz69Gv6+Zi9WkAJV2+aVgbfPCiQtlLUFqswUPCK4B/MunMoS44hFUA4EVzYl3+L2CLT+7RSptlQwa1gdtRyoXv7WVZWud7tdoAidpOXfrH9GW4tR3B6ycbu33a9UaZur5RDrVQ3m+NpxE4ySxrtcuLsAR+RGlCqvyYC8RMEJYKURrpfXJM0uNoKUaLXpEb86y8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgWr8XFy1d4lECr4Js8O9Hcuf/OTq1ARmbqjuKgu/EE=;
 b=i8FjhyMSgfZtSAoW3CVROoJ2wJwTThAxJXuRgdPuWBgC7NwmW6S1fyYjYV5KkVH7wLi0Grw6j/Il3sncF0PGiNOdVV3a+4Kf9XWElnvJnmJarR1Pz09BELwNKMWBJBk+ZWTj/mbjQVK0vcXR03k+OUaCd8RJtG3IjrHtFd+WWFyQxhXxXI7Mw0JJLJUGH3RK499Rsn+3vYq2eORRPy91Peq4asK81L9bnOtUs+aVhwcPmjIRGPko2j/GZBstQPty0QGMKYDvoyRUmZTmXqnyiyDxyf9AhX/m3svGGMXd/qn8EejXAQKNdUMhhea4CGagSbFK0P1pPmrFIvOS75oIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by SA3PR11MB7463.namprd11.prod.outlook.com (2603:10b6:806:304::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 16:21:00 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::8637:9cfc:1235:8987]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::8637:9cfc:1235:8987%3]) with mapi id 15.20.8989.010; Mon, 4 Aug 2025
 16:21:00 +0000
Date: Mon, 4 Aug 2025 18:20:57 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v3] drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM
 capability]
Message-ID: <xdrfj24g5nuglrnrnl4twfosd36tgkvs52y4fv5fmkpibtjgby@yfgrjm25fpj7>
References: <20250801163017.23242-1-satyanarayana.k.v.p@intel.com>
 <aJDI21VmY6Unf9Vw@intel.com>
 <9f22cc70-116f-4ba5-a2f5-08dfce89e5c3@intel.com>
 <aJDNq7IzmGBFSytg@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJDNq7IzmGBFSytg@intel.com>
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|SA3PR11MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 124092a6-099d-4db7-8e34-08ddd372e670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWl0WDNraVBhMmRCa20reURjK0wvdlBlMnM1K0R1T3pLTTZkU1kzMlROQ3Bl?=
 =?utf-8?B?M1FDZkIvQ1dXYzRrZzVmdjBhK1A4MHRud1RUR2JIcVZUZ290dGxsUVQyWkpj?=
 =?utf-8?B?enZuTHFMWXJoTmJLa0dnT2RGQjdNTldRMWoxRGJjWURXZXc1aDRmUDJIc09y?=
 =?utf-8?B?M0tnQ21mM2srRitHZ1hMbjk4L0VBdnFhdWZLNk91MW9kaU1tSWVVQ3JheGVV?=
 =?utf-8?B?Q3FEOTBXYzB5aldrbVVCTHpQc3FZdmVVSWpyNVpIUUJDSkxFanE0U1E0SUdL?=
 =?utf-8?B?dGcyRXZFT1lrSVhBMERzdDJoMTZvZDJyQkNOUVUxVHJwM2I5VXMycFFIeGth?=
 =?utf-8?B?bzEvWkNDdUVHMkUvdnBOOGZ1S2NieFlSeXdOcVJUdHVabkRtaE1ocWR4bk5L?=
 =?utf-8?B?RzNGcFpXQUF2L1U4bjBranN5amdIc1JWYUk0cVJmOElsSWpzODJubzliRjlD?=
 =?utf-8?B?dzB3cGtlRWFpK2gwbE1OZ3pWUlk3djJBeXVSemFQOXcxdWRwZXd0eW4xSUxj?=
 =?utf-8?B?aS9JeGJ5UVpKMlN0c29hdkNucE1lT1RtV2dlSWFXVEpZY0tMMEgyaVZlc05P?=
 =?utf-8?B?ckhyQTJIcldWdGlFa3JZRSt2bWJHcGZvK012VWROSnpucVZMTXlta1pkOGs5?=
 =?utf-8?B?U3ExSTdya3prK01abEtIczNJQ295cUNNbGcwbHZ1aUlYcmdqREhVV1VBNHp6?=
 =?utf-8?B?eWdmN3Rac01sZ3BYWlJKakEvbGkvcmNCeXJNM3VhTFVMOUVjbjZJeDJiZ2lN?=
 =?utf-8?B?Rnk2Ukc5RGVyNVhOTkZPYXh3dFVXaUx6NWFQNFg4aHBvTlRPUloyRGxuYXUz?=
 =?utf-8?B?NFFDUmJPVDlPQmNnSC9kTVdwNXIxUkhYSkprL1UzVGc4VXAxMCt4U1IwKzN5?=
 =?utf-8?B?QVB5bWFmSjJodWNjTFQ3Si9BcHBTTUZTcXJqMEtoZlFPNklTVlZCeUlIUE5w?=
 =?utf-8?B?ekNRMy9nRW80OEtsdUlEc1c5RjBUMXZjbFJLQ3RyN3JXeWVVRVJPUmhZNnVZ?=
 =?utf-8?B?Z2l5S3RTYS8wLzk5ampxQU9oVWJZVmJHRFFSZ0RlNU9GT2NRakhIalltenVr?=
 =?utf-8?B?VlFhTU5kdDNTMHJ3RU5Xc0ZtV25Ybld4Mmk4eHlaYXVSc3ZHM0hETGtTOHlN?=
 =?utf-8?B?TEpBcXRFVitxd1FKY3BPU0JIeEZKSWovNThWOXFRS2RqMzEvMjQzdjNkNTZq?=
 =?utf-8?B?VkFjMlA2TXJYbkRPRDRkRGlrMDlJeTR1Z1E0dks1WDV5WFQ0byttbkxTRVFP?=
 =?utf-8?B?eitHTkIvMjhwVDl6VTV6YmZzaFl2WDc5VlZ1QWhpTGNCdElVb2dMWUxnTVkx?=
 =?utf-8?B?M0tJbHJQMmdMUXh2OSt2cHJ4VG5YNlFHa2ozL3ZMbmI3MU1ydTBoMEJ2bDZH?=
 =?utf-8?B?ZldDaS9KN2VKRFZtcVNjdWxUTnNFZTlEY0ZHNG1BYStEYlJPV2Uwa0hRWkVo?=
 =?utf-8?B?TnNxeVl1YjlXK0tCYUUrQy9kRVlSOFNSN0hmaGkrN3kwS2RKTzVYMWM5ZlBj?=
 =?utf-8?B?TkVUVDJHUkVxbTNEKzRVeGNvQkhuTlhRWWFtamdYK3p0bFR2czBqTHB4YmRk?=
 =?utf-8?B?RlhOOUwzL2p1aHdNTjdKaWRJREptWTA5TUFXVWQ1OXdjUG16S1JxVkJjQVpS?=
 =?utf-8?B?TnVZREIzcU11OEloSExEUjV5SkRuQ2FrcG8rdSt0VERsU1d0NmZtMjlESG5L?=
 =?utf-8?B?YXV3L1lkeTlkL0hRTWlkN2E0WDREWTZxaVZLUUhqVEVmTWNycjhZOFdkTUI0?=
 =?utf-8?B?RElaY29NbVUvUUpUcDJYQUk1MFZQUzBXcnVtbE9MaXVqcGh5eHNLeUJ5enhw?=
 =?utf-8?B?bE9senhZc1hValB1aTRqOFJDSGFRTEozb1F3VTFaUDZBTE5SQWYwTFl2c0cr?=
 =?utf-8?B?eGZTZUppWmh6RHNjTFFDNzVZS0FzUldJcXlJRHZNUUhYREE3S1dqemh0eG50?=
 =?utf-8?Q?cO9BHUBG0DU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWFDeXlEN1ZrQ0E0WUZVYXlZQ3l1Z1ptOGtmdHE4UlozcFJjRGVjYkZpbE9E?=
 =?utf-8?B?Rzh2ZGdKL2o1VlRRTmpQaFdCZ0srUjJ1VjAzSEZ5dk93cnhhckVlZS8zbjlF?=
 =?utf-8?B?OXFRQmVSQkRVZmJJeXJDRXFlMFFDTVNNUU9IZnhCQm9UL1NjeFNDb1QzeWNv?=
 =?utf-8?B?SVd5M25RbG1PT3BNWE9KNm95NnU5a0FVN0t6anlQZ2JrY3F4blVDMFk4SnlM?=
 =?utf-8?B?Wmg4UDAzd3pxZkZqUnVIWXovK1pvSjdaK01mZnBVRVByeVoyZTRkWjNSSTBa?=
 =?utf-8?B?c2dJV1pmWmIyZm9PdVVZbGZXZkttOUhnN085YTl1clcvNnIwa25sTmFLTE9V?=
 =?utf-8?B?Uy94MkhZRXVHN0llb1JpWElYKzZmcVRxYnYxalNmMW1lcmdObXJWTllETlB6?=
 =?utf-8?B?eUFPNmZ3UlBOekZId1VnaEJvSzZvdUJkMVI0RUJoYmtVQ1ZmdUQvRDJOVHJs?=
 =?utf-8?B?dkcveXNsRm8vUVVJdkQ3UXZNQzRLOWp0eVdtU0c1alh4ZjBqNE5ZRUV2M0xx?=
 =?utf-8?B?RWZCZklYdlNOS0hpQjNlVXhEOXlDY2MxUUVuNmxUMjNhQkhKTFVNL29IL0Ir?=
 =?utf-8?B?WkYrbFVIOEdVc1VUZWdXaXV2TjZjQ1dpS2NKQ1FXZ0ZxY0kwQ3MvRFlGZUdR?=
 =?utf-8?B?YlB5TmlQbXZ5SFpYRXZPMTRqNVVCcVlFUWU0dzA1ejZoNGJzVUJiMXp6WTI3?=
 =?utf-8?B?MjRTaTNjaWdKTUJoOXgyYUQ0NmVTOVFsd2h0ekhNeDhWV1ZEanppSWd2VkdX?=
 =?utf-8?B?bGdIelFSOGpTTndtZVp1b3llQjhaUGJIVG44YXM2cXhrRzcwQkxnUVE2OHBJ?=
 =?utf-8?B?S3kvWjhYV0xTblIrL2lLL3JTdGlVMVFWTzVJZy9nZXRtM2ExN2IwRFNhc3RV?=
 =?utf-8?B?dmNwVkloem95aDBWSGxpUFZHOGdtNzZGQlRCbEUyYzBTckY2VlZwUFRpdk50?=
 =?utf-8?B?Zkx4RlBIMUFERXYvTVdUZ1R6QUpHakQ5eXI5RnVoUTBzbG1kSmY5a2Q1K0tS?=
 =?utf-8?B?cmNVQng1ZER1eU11dnphMk1tUklCZ0tubHRVMjZucWNQODJ2UWpIVll1TkZK?=
 =?utf-8?B?eEh5VGdTWTlzZ3NrUlk5RWx0OW94eFBHYmNManlhSTU0QjZTYkRJUGttVVBn?=
 =?utf-8?B?dklyaGdDbW9VVTBNUDMxRktTRmpCOHRHUTRYYllILzJSdzMxcVVGN3hwcE1F?=
 =?utf-8?B?V1ZpeHl4bEkxa2tUbVluN2ptenMwYXRWSFMxWFc1SjdRQi9JRkhNeGdqeU1L?=
 =?utf-8?B?YzFUeFRHSGxkcjRibzA1Q2ZTelA0N0NQL3VrMFpldzBaZmFkc3RGTDJ4M1U5?=
 =?utf-8?B?Zm0rUTVseDZ4UmxLeWRVZ3oxcllneFVSTnpYdXpnaENkRXBHRGJuMWFaaXJC?=
 =?utf-8?B?QzQvNlIwM3pyUWcxNmZXa2p3UlZUTXB6bStXQWFxLzFoQm9HK0RqZFBpOTFm?=
 =?utf-8?B?Z25KNkIrSUc0dHJPQk9HQmplYlFJY3pxK3lHVWR4WHdya1lFQnRZTWxBZEpm?=
 =?utf-8?B?SENzTUY0MmRIMzM3cUV2ZGNXR1ZTdWx1SXR4TzdFY1pxQ3FickEyRlhNcmhD?=
 =?utf-8?B?RklCRkVjazdMUUdENk1jZ0hIeXkzeWJhTGI5dytSSlFSSFVPMFlac3FRaVZS?=
 =?utf-8?B?MWJLVk45MTlmaDF3bUZ3bmJYdVVOZEJud0twTzZZN25BR29mU1BNQkpLUURR?=
 =?utf-8?B?WElpNXZhYXVMQ2xxZkUzd2I5eDRhTk5lZ2JneHp5QWF4cEJOVWN4Q0F2cDdr?=
 =?utf-8?B?TFNMTHBnSDYxUS9hTjlGL3hRQzBSak9DbW9SU1NnUzczOHZxcTIxKyt1dFhu?=
 =?utf-8?B?VTZhU1BBSVA5Snd5cFBMVHVNa2t4eGUwRktMYWN1SGFiR1BvRkc1WWgrYkll?=
 =?utf-8?B?aXFzaDFDUUNsaFVIaUp1KzBnekE5UDFaZWZRdmk4TVhwY1A3Y0htWDlMOGJ4?=
 =?utf-8?B?QkMwRWJwZWk4WVVFL2JhSVlublNiZUZhM1dEK3UyeGFBakhvRHRYdnNtZXB0?=
 =?utf-8?B?RWkyR0hibWhHN25lUWdpdm80ZFA3Wm5NTXpSYkxUd2tMdjhuZ2s3YktxTmZt?=
 =?utf-8?B?L2lpcWVMMUd4RlFia2VHc1hTcThwZWczWlRBWFpROEJsVzJsc2Z1R1Q0bVE1?=
 =?utf-8?B?dFdYbXNNUCsyeG9WZDU5bnVOQ2xpKzFnaUlXQXFyZExLZXZMY2p1cHFCN0Zi?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 124092a6-099d-4db7-8e34-08ddd372e670
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 16:21:00.6205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvhI15+1FaremqSt16Ui/L7y210/VN+Cy0K/0wi/rc+iSU+VQBi5j6GfiHNNLkfwvAahua22xx9qXLnuf6Ssd8ONNHFh33sQ7hizpFY0fO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7463
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

On Mon, Aug 04, 2025 at 11:11:39AM -0400, Rodrigo Vivi wrote:
> On Mon, Aug 04, 2025 at 08:30:12PM +0530, K V P, Satyanarayana wrote:
> > 
> > 
> > On 04-08-2025 20:21, Rodrigo Vivi wrote:
> > > On Fri, Aug 01, 2025 at 10:00:17PM +0530, Satyanarayana K V P wrote:
> > > > Enable Runtime Power Management (RPM) for PCI Express devices by utilizing
> > > > their native Power Management (PM) capabilities. The specification (as per
> > > > section 5.10.1 in PCI Express® Base Specification Revision 7.0) mandates
> > > > that Virtual Functions (VFs) without Power Management capability inherit
> > > > their associated Physical Function's (PF) power state.
> > > > 
> > > > As per PCIe spec "If a VF does not implement the PCI Power Management
> > > > Capability, then the VF behaves as if it had been programmed into the
> > > > equivalent power state of its associated PF"
> > > > 
> > > > Since Intel GPU VFs lack PM capability implementations, VFs power behavior
> > > 
> > > If this is a true statement your patch below is wrong.
> > > It should simply be if (IS_VF) return;
> > > 
> > The current GPU VFs are lacking PM capability. But in future, if VFs (new
> > generation GPUs) support PM capability, then VF should be able to manage PM
> > on its own. As per spec, if VF does not implement PCI PM capability, it
> > should follow PF power states. If implemented, VF should manage PM directly.
> > 
> > So, checking for both pm_cap and IS_VF.
> 
> So the commit message should be written in a way to explain that possibility.
> 
> But anyway, please step back for a moment and think about the whole flow
> itself and the reasoning behind pm_cap.
> 
> pci subsystem is the one already checking the pm_caps before doing the
> pci pm transitions. If the check is not there, please go there and add it
> to the pci subsystem.
> 
> From our side, if we need to avoid that VF follows the PF and goes to sleep,
> then the PF needs to get an extra refcount for the whole duration of the VF,
> so PF won't be allowed to sleep then VF will also not sleep.

PF is already taking the refcount, from PCI perspective, VF device is
never going into low-power state.

Main thing to keep in mind here, is that runtime_pm is decoupled from
PCI subsystem. It's the drivers responsibility to actually trigger PCI
PM transition into low-power state as part of runtime suspend handling.
Usually that's one of the last steps, and before that, the driver needs
to make sure that the state of all the resources is not "lost" after
moving into low-power state, and the driver is able to recover that
state as part of runtime resume.

For VF that doesn't implement pm_caps - that last step, which is moving
into low-power state is a no-op.
In other words - for VF w/o PM caps, with the current driver codebase
we're going through all the driver-specific extra work in suspend/resume
handlers to end up doing nothing in the end.

Perhaps the commit message is not expressing that clearly enough, but
the reasoning behind the patch is simple - if PCI PM transition is a
no-op, don't do any extra work (by not using runtime PM).

Does that sound reasonable?

Thanks,
-Michał

> 
> > 
> > > > must mirror their PF's state. During VF creation, the PF remains active
> > > > from the PCI subsystem perspective. To maintain consistency, explicitly
> > > > disable RPM for VFs missing PM capability to ensure they follow their PF's
> > > > power management status rather than entering low-power states
> > > > independently.
> > > > 
> > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > 
> > > > ---
> > > > V2 -> V3:
> > > > - Fixed review comments (Michal Wajdeczko).
> > > > 
> > > > V1 -> V2:
> > > > - Disable RPM only for VF devices when PM cap is not implemented.
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++++++
> > > >   1 file changed, 14 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index 8aae66660931..019de04fa7bb 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -246,8 +246,18 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
> > > >   static void xe_pm_runtime_init(struct xe_device *xe)
> > > >   {
> > > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > >   	struct device *dev = xe->drm.dev;
> > > > +	/*
> > > > +	 * Disable RPM for VFs if PM cap is not supported.
> > > > +	 * As per PCIe specification, "If a VF does not implement the PCI Power
> > > > +	 * Management Capability, then the VF behaves as if it had been programmed
> > > > +	 * into the equivalent power state of its associated PF"
> > > > +	 */
> > > > +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
> > > > +		return;
> > > > +
> > > >   	/*
> > > >   	 * Disable the system suspend direct complete optimization.
> > > >   	 * We need to ensure that the regular device suspend/resume functions
> > > > @@ -366,8 +376,12 @@ int xe_pm_init(struct xe_device *xe)
> > > >   static void xe_pm_runtime_fini(struct xe_device *xe)
> > > >   {
> > > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > >   	struct device *dev = xe->drm.dev;
> > > > +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
> > > > +		return;
> > > > +
> > > >   	pm_runtime_get_sync(dev);
> > > >   	pm_runtime_forbid(dev);
> > > >   }
> > > > -- 
> > > > 2.43.0
> > > > 
> > 
