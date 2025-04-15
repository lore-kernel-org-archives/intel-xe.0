Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105C5C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 22:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A533B10E17A;
	Tue, 15 Apr 2025 22:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xvl9moJu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED71310E17A
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 22:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744754965; x=1776290965;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=443JCSxh8YJ4Cz6aeln0qfaC3WCZ3OoE7Y7bfVmkvZI=;
 b=Xvl9moJuYEQhIJpkvATNLodCdfTU5dJBNRKhZYA86Z9w8X7tSYiNC8n8
 w8puFwqrjxLxppdjOMtr5/KgyBWmYpPhVcn4Vc2ZJ9Y0B9oMm4MFiEwvo
 382mLUkNEZVV3wURZo/LqkWafilqdiLhOdIJlTyUuc4Ezwau1AenQ4Yik
 kRjn4BuhJrycXmhG7hknCC3/MMBWT3yvXe4ZBKxzE0oplnxhct28MOI7f
 2QSxIB6zf9Ozxu//2qb0e7gtbvc0OhEHYok+1RFbvcMMdgc/jYkgDe6Xm
 86sJv4+RhAtZtaLpbfmdABnNkMRp4wMVEiwQ3/2dEG8590PeA1iMwulVo Q==;
X-CSE-ConnectionGUID: aXKfbrrxS7Og2+kmnnAzlg==
X-CSE-MsgGUID: rR5u5GdbSF+DhHw9jaotOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="68777650"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="68777650"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 15:09:22 -0700
X-CSE-ConnectionGUID: RWfzHIb7TQuyg7i8QXlmXQ==
X-CSE-MsgGUID: uiUqQnlyQYqU/1IvvqcGbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="131152793"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 15:09:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 15:09:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 15:09:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 15:09:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHYe5FFPgpvvvK9UORzvi+fyVdDCtHh99Q9YZWbpgLRFXk8X5yG9V7hEUJZouBfjysvq6YZkoFK0Pd/Q9mrc6INYg0JIJbHkxIldL4m0VVyY9Ywtk50ftRGJIGlyiInyy9V5jCv7O5R8TkDSAGr31xuRsv7vixnvKYX4zcRxttieMf8/DPaJ80UADRTvDNXvwEKSR5mV6sf2pkWAAKnhwYX/PGVT7ONCvlyDueDHeH3iU+ee+5ptnH5hRkmUH1Ee0ddaUl3VHsstt/iLWj+OjpvoEYeLwuHAYI1cHqdlNN++MUU/bTv4ZMEUcWWNVXjU8lUrHbgJPKdMheX3VzpCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8w97NG7I2srTKUfmDSdK9N8jpHMiG3RfnsxoUSJ+fRc=;
 b=qzykN2dmbfYUHq1b59f3vRIZVWFV3JwUd9vEPgiJ2jr0CtfFVq72cbGoTNEbsf580J7DqSMIixM7JWL6OxeUX5ap8VazOCkKbrX+xaCdCAzf4WkyYXvAaiIRUGRkvjsWrc1BfUbsDA+8Rhrg9fakOT1hm+C6dYlwMxdWeGYor3cE/O3N4hx2wpOJ5dpAWakt8gzQAMqqZUE0ktyRdE93+jkb7kzQirW8HhQQyjueU9G1ElhqbJ7urSiNOlAfoNFuScnbS+FRg5XHHJnFoIX7sA25Nrn7K86sVIwE0aFSSqL7v2S9l7T6uqG6Fd+IfaItwPdzacKLXwLwEuwxVE2NDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by DS7PR11MB7906.namprd11.prod.outlook.com (2603:10b6:8:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 22:08:43 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8606.033; Tue, 15 Apr 2025
 22:08:43 +0000
Message-ID: <a2b6c2ab-b4db-40ec-9399-0e31718b9ea3@intel.com>
Date: Wed, 16 Apr 2025 00:08:37 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v9 2/4] drm/xe/vf: Shifting GGTT area post migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250411203626.3272415-1-tomasz.lis@intel.com>
 <20250411203626.3272415-3-tomasz.lis@intel.com>
 <179d9877-f260-49e3-a014-46c071a1c973@intel.com>
Content-Language: en-US
In-Reply-To: <179d9877-f260-49e3-a014-46c071a1c973@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|DS7PR11MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: e1aea984-956d-4e90-4b29-08dd7c6a1599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzNYVkVrOGFtdy9MbkJrODlZeEpSYzdzb1QvcXFxQlUxRm9XenU1cUd3Qlho?=
 =?utf-8?B?RG5zNUNFMkZ6aGdCc3hNdnREOUpNeFJvTlpDaFFvNjNCM1Z6S0Iyb0tudzJG?=
 =?utf-8?B?TGRLRWQ5Mitad3Y3T1M4MGxGZnZFd2g4VHpDSUl4c1BON1d1ZUgyc3FiSDB2?=
 =?utf-8?B?a0p5KytBRXZpSDJJbk5BcWlhSGtYVUdSY2g1NVBiaExXaDArazNscW5HV1JK?=
 =?utf-8?B?TC9tNTViaTJZUkgyZmVtT2pZRitGL3AyaURvTjZBTUJFcVpQclYvcGFYMkJq?=
 =?utf-8?B?VGRIMTFiRWwzdXkyeEpaS24wODk5U0xnWjhDL0F0ZzE1U0RQcXl6RFl5RE9k?=
 =?utf-8?B?WE1KQnEvNTZ2dHdGNDFjL2ZpRVJ5eC9pU1ViT3ZqYWNqSHZ6aEFTZmZuL3pT?=
 =?utf-8?B?NG52MkdENmtCV2hrSGNRazJkUTN3dXRId3ljRi93RFdkeVR3NUJORVFlYUQw?=
 =?utf-8?B?QkcwczlEbzRhZndZRlVrQ0FJVUg3QmZEYnZhT1pyeW5KdUNod2hDTXJEajlC?=
 =?utf-8?B?bzYxd3RvSWdKZnZIZisvOEtMVm4wamVlMnZ2ZFZoSENWSS83dUNLd2xDdFpq?=
 =?utf-8?B?NmJKNE1nV3pHWlhPRHRFdUNNQkZkU0t3cW1WdkQrOTB1QlNiamh2cUprcmpE?=
 =?utf-8?B?cmZOYk11MGhpRmYraERscjdsQWx5ZkdwOUduT214YThWcnhQYlVFZHRPSk8v?=
 =?utf-8?B?TExVV3p3NWpyUk5tUk8vZ2l5UnBreXZIck9uQ3ZHMk5jMEp2ZE14TWFJMDBK?=
 =?utf-8?B?TjlEVkF4L0FWVDU4aUpuYURzSzl5ODIzM3I2aWcwekxxWXI5VkRKcVVxY2sx?=
 =?utf-8?B?WC8weTJmZGlWMzN4a1c1eHhuVWJXeUNKSEE0SjZKeUdSalVVbXZMUTBYa3d3?=
 =?utf-8?B?OHlTWlJUdWxydnZyYnNzZDFWN0JxV3g5ZTJSV0ppcEZLUEhRbC9BZk8zN0l1?=
 =?utf-8?B?T3dGK0hRd2lLNmZabWlVNmpwQ24yU1lBY0psaHpuSHdlOUVUWjJpYWJWdEhy?=
 =?utf-8?B?N2xCK1o0ZkdZeUszQllkN3F5Vm05SXFLK1R2akhpMDNZRWM4aXZEUm1nZUI3?=
 =?utf-8?B?R3JFa0NtSGF1L2ErcExERnNaNnJsUk0wMmlMWTE1TGgxRU1obWdhckVUOFhz?=
 =?utf-8?B?MkZPWld2NzMzUElhSXNQaXZodXdUWUJ1V0p6OWR3dVA5dTNzemVpU3FSNGlk?=
 =?utf-8?B?a0h0QmZQOElrTHhYYmgzbjg2cndGS0kzNGMvNlRuQ09HMit4YzhrdXBOaS80?=
 =?utf-8?B?WmZuM05URXJjalA0RHpENzBrOXptVHgzNG4vcCtTOVhxWi96TVg2Y1BXREYy?=
 =?utf-8?B?QTVkRmFraUlvalVLOU13ZDJwcXdrZW43MmRTcHRiRzg5b29CU1djSVlTUjZM?=
 =?utf-8?B?bzZ1TjFVY3pJeVdaV0NpRTNRNmxPZVJGUEFrOXNqWnhiZmV1VDI5bENibE5B?=
 =?utf-8?B?OTFwRkc3R0NldXM3ejBSOWxPVS9id0NqM25ycjlGUktNL294aGxVNmcreEgz?=
 =?utf-8?B?VGcxRFAvWWdEb1lUTFFxS01uK1NTUHRnSVNXdThGUldMTjBnSFpZdytXUVVC?=
 =?utf-8?B?aUFJZXRGRThTMnU3UzBtZnZEbThhK0RZcWZvVWxaSEU0ejJNYytFY09JQnZs?=
 =?utf-8?B?RFB0bTdCbWNGRHlGdWhDMWFYdzNNVTAvWVBieFpKZnFUUzljdGtsS0h1M201?=
 =?utf-8?B?YXdnMkowekgyNTlzaURKd3krSmdVVXhwQ2t0SURJNlF6MzR4UXdBU0ZFUGEy?=
 =?utf-8?B?RFhvM29FZ2RxYmZ6QkVua0tTd2RGVFg0a2FDZXkrbktrSklGV3JRbXBieGE4?=
 =?utf-8?B?OWJGZE14NXhOY3lsRzQ3c3lFU1k2ZFE2M1k1aTZJVnRITzBndG5rUDRCTVU1?=
 =?utf-8?B?eWMzZnplbDdHVEd4TmJzNDExenZyUFdqM3Q4eUgxeGVKNU5Wckh4enpyQzQ5?=
 =?utf-8?Q?YSJENg4mDjE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3NaMDAvSHBydUthN3BLS0NyZHZuTDFzRmFuOC9EaUtRQmNsbkluOFBmVHQ2?=
 =?utf-8?B?b2RCTDB4NXErRmRjZEJ4OEFiUmZ3bXE2eWRZdGd5UWNTQkI1enR5VVRmUUpS?=
 =?utf-8?B?QnVXUWQ4Y1hWVE9XM1RoekY4WVk1V2xDdmxmaU9GM1Myd1ZXczUyS2F6bnNy?=
 =?utf-8?B?Tm1FRjlGbFZKdWVhNWFsQTBzK0EwV0t3MXNPR2JnMHkwVVJURDVSaTJlQzhw?=
 =?utf-8?B?QWVjUWo3ODhsV3FXanFXZW1LVk9UTXNNVkdXelNnamtIOFZxNjBtcU0vM1dh?=
 =?utf-8?B?UVdNd1VRS0QwZkRmOTV5N2NDbWtmaktCdVRpMWE4ejl2Z2pEcGFOemtQbXFS?=
 =?utf-8?B?K3FMa2RzNmRNaWtVSmMvVS9tbS9nU2psUlduWXh2WFBZYWIzSFVpM2lMc3BK?=
 =?utf-8?B?UkVSSG91RHFmL2tqYU9KTHN1RXRRRzVwVDlickRmSHFMUkhER0FzRzFNMW5u?=
 =?utf-8?B?RTIyS1RmWStGSERYaE1XdkRvQWpEeC9WL0xwK0NMamlMMFB0ZG8xYnlZdEsv?=
 =?utf-8?B?bzVtTEt1Q3BuS2hXU0hGNjQ3SFYwZ0g5RVhtVkRUSUMvMjdNZytjNFpxU0Qz?=
 =?utf-8?B?RmhqVU16bFJUQzJ0N1oyd01rdkN4QkJFZkJNbTZ5RHl6STd6Z1ZUU1ZiQ01F?=
 =?utf-8?B?SDZDSmh0UWxoV2FnOFBHSlJSUUhsK2Z0cDczbVdRUnpKUW8zalo2NE11TG1w?=
 =?utf-8?B?MWppclZhVmJpSEw5OFMwcldDNytsS2RURUFKaGxWQlhiS1h4OU5jM3RRc041?=
 =?utf-8?B?M3plckgxc0RKZW1YUnFRMjdQYTNmbUZVak0va3QvNGcrcVhoNHE1Ui84Lzhj?=
 =?utf-8?B?UTBpZk0zUFhZM3NOWFpsVTdIUkJWbTNxcng3b1VWVFdORmo3Q1E4UnR3aGFz?=
 =?utf-8?B?bWtwRit0SVMvZkhYMDAxL2s4RzltNWF2SU9GcmlQQ2dmdW8wWE1PZVFiZ0FK?=
 =?utf-8?B?KytMd0YwdkJXdXhkSnppL1dnOFh3Vm5uU0hGYjhabmpua3VDcG9aL2NOeWNu?=
 =?utf-8?B?amJKVmlFK045ajJBenIrZUg0aTFkcEQ1U2kzSC9CVlFxYzc0a3AwdDd2SGpl?=
 =?utf-8?B?dEFpcHB0ZHg3aGdxdFpnUkJFT2pQckgrRnBVa1hGZ3NQVDhIZ3orWllBQkwy?=
 =?utf-8?B?UWFLR1hWTk8yMnRYTG5vZVJvSkdYRGJTOG4ycnk0WUtsVlFXVWZQZDRPY2pn?=
 =?utf-8?B?Yld4MzFuMStWcTlDZER4d2Z5cjd0S1Z4R2JoeE50Nlp5N1pmU2VDZjBQYVVL?=
 =?utf-8?B?Ykx0dmFiWjhOWm9ET1BERzFpOWlXdzJKZlFXR2tnNTkrRzAwMkdnaHh1eWVX?=
 =?utf-8?B?d1NsODBLRFhZVU45ZURCbURWdkhRNS9KQWVVL2JKMVZ5d3UyMnNFNnZWR09Y?=
 =?utf-8?B?UlpJNDZsT2dVZTFnZDVQeUFxc3JwcHhDS3p6R0RHdHFQd2JNMDEwcGgvL0x1?=
 =?utf-8?B?RTc3Q25TUWZrVUVjYThXVnBCSnBtNCtSbGJDRC85c1lGcVdIVkxHZmtONlNi?=
 =?utf-8?B?NEtDZkFHdGpyOEVNRDlISHFYK3lseVdNeFYxdDNJbUFiNWxKYmtrQ0VoWG9K?=
 =?utf-8?B?WEJCb3d2cEhqblVoZTBTZjM0T011MnN4UFBQcVE2MGwyUnJ3Rll3bllNQnRu?=
 =?utf-8?B?cU9nZklySlRpbVljNFgvMlJRem00Wkdjc2E3aHlveVZOalhKS3IxbWJMWVBR?=
 =?utf-8?B?WjR5WC90Yk1tRENJWnhGTlBEQW9YeGt4b2VQR2Y5UkVyZ3Z0Wk5mTG1VelNQ?=
 =?utf-8?B?eGNSTjJyTVZOOW9aMG1DcEp4U2NVZ3pOR2tjUTJDT3J4YW5wRWorNXdSL2Vx?=
 =?utf-8?B?d092ZmFkYUxocThCNmZlOUU1Rzlrb2RyazB0MGlBbSsvOVFLL3RaTUlBZUZv?=
 =?utf-8?B?MTY3YVhHeTFpemJSdHFpZDh6d1VFVHUwOCtkRkhqNkVMM1VwZ1VsZzc2QlV0?=
 =?utf-8?B?SWU1Rm1ZYUJUc3JUa29pend3Sy94aDB3eUNkaHpNY2l3eXNuMldRd1oxcHlB?=
 =?utf-8?B?b0FIVkRvT25aZEVQQjhsUG5lZ0YwOHZzU3ZWN1F1a3RKUmJXRkdFWGFMLzJE?=
 =?utf-8?B?amlXeFJkQWl1V0c4dzEvOTA3RUM2OElocXdORnhZTXZuMUZ1Mnd5bWpxd2hV?=
 =?utf-8?Q?F02go0wHBEP0No9Uzmv7zgZPd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1aea984-956d-4e90-4b29-08dd7c6a1599
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 22:08:43.0694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbdEJx+WVmpSj3pSlgEXFpXvHWJyN+NN3xOik2SWFMYoMQySUknpPOESeQkgQ7CfHoe7c6DPiUaY6ryrKOkZTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7906
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


On 14.04.2025 11:23, Michal Wajdeczko wrote:
> On 11.04.2025 22:36, Tomasz Lis wrote:
>> We have only one GGTT for all IOV functions, with each VF having assigned
>> a range of addresses for its use. After migration, a VF can receive a
>> different range of addresses than it had initially.
>>
>> This implements shifting GGTT addresses within drm_mm nodes, so that
>> VMAs stay valid after migration. This will make the driver use new
>> addresses when accessing GGTT from the moment the shifting ends.
>>
>> By taking the ggtt->lock for the period of VMA fixups, this change
>> also adds constraint on that mutex. Any locks used during the recovery
>> cannot ever wait for hardware response - because after migration,
>> the hardware will not do anything until fixups are finished.
>>
>> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>>    after querying; improved documentation; switched some warns to asserts;
>>    skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
>> v3: Updated kerneldocs, removed unused funct, properly allocate
>>    balloning nodes if non existent
>> v4: Re-used ballooning functions from VF init, used bool in place of
>>    standard error codes
>> v5: Renamed one function
>> v6: Subject tag change, several kerneldocs updated, some functions
>>    renamed, some moved, added several asserts, shuffled declarations
>>    of variables, revealed more detail in high level functions
>> v7: Fixed typos, added `_locked` suffix to some functs, improved
>>    readability of asserts, removed unneeded conditional
>> v8: Moved one function, removed implementation detail from kerneldoc,
>>    added asserts
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c              |  48 ++++++++++
>>   drivers/gpu/drm/xe/xe_ggtt.h              |   1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 102 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   2 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c          |  22 +++++
>>   6 files changed, 177 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 5a37233f2420..9fc0d57be00a 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -484,6 +484,54 @@ void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
>>   	drm_mm_remove_node(&node->base);
>>   }
>>   
>> +static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
>> +{
>> +	struct xe_tile *tile = ggtt->tile;
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	u64 __maybe_unused wopcm = xe_wopcm_size(xe);
>> +
>> +	xe_tile_assert(tile, start >= wopcm);
>> +	xe_tile_assert(tile, start + size < ggtt->size - wopcm);
>> +}
>> +
>> +/**
>> + * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
>> + * @ggtt: the &xe_ggtt struct instance
>> + * @shift: change to the location of area provisioned for current VF
>> + *
>> + * This function moves all nodes from the GGTT VM, to a temp list. These nodes are expected
>> + * to represent allocations in range formerly assigned to current VF, before the range changed.
>> + * When the GGTT VM is completely clear of any nodes, they are re-added with shifted offsets.
>> + *
>> + * The function has no ability of failing - because it shifts existing nodes, without
>> + * any additional processing. If the nodes were successfully existing at the old address,
>> + * they will do the same at the new one. A fail inside this function would indicate that
>> + * the list of nodes was either already damaged, or that the shift brings the address range
>> + * outside of valid bounds. Both cases justify an assert rather than error code.
>> + */
>> +void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
>> +{
>> +	struct xe_tile *tile __maybe_unused = ggtt->tile;
>> +	struct drm_mm_node *node, *tmpn;
>> +	LIST_HEAD(temp_list_head);
>> +	int err;
>> +
>> +	lockdep_assert_held(&ggtt->lock);
>> +
> nit: my idea was to assert that we have room in the GGTT for that shift
> ahead of doing any movements and if there is no easy way to get that
> from the drm_mm is one call then do it like:
>
> drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
> 	xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
>
> and then follow with pure code that we know it must be ok
ok, can do that. Though this does not look better in any way to me. In 
fact it looks worse, as it introduces another iteration through the 
nodes which optimizations most likely won't be able to cut out. I 
thought we should avoid debug-only iterating.
>> +	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
>> +		drm_mm_remove_node(node);
>> +		list_add(&node->node_list, &temp_list_head);
>> +	}
>> +
>> +	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
>> +		xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
> so without this assert here (as we did it in a separate loop above)
ok
>> +		list_del(&node->node_list);
>> +		node->start += shift;
>> +		err = drm_mm_reserve_node(&ggtt->mm, node);
>> +		xe_tile_assert(tile, !err);
> maybe drop the 'err' assignment and just confirm that:
>
> 	xe_tile_assert(tile, xe_ggtt_node_allocated(node));

The proposed solution is again worse than original. Ignoring an error 
return should be avoided. There is no reason to ignore it here.

Also here we are not iterating through xe wrappers of drm_mm nodes. I 
will stick to current implementation.

Like the one before, all this request would do is generate changes. If 
solutions have almost equal weights, maybe it's worth to just stick with 
what the author proposed.

>> +	}
>> +}
>> +
>>   /**
>>    * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>>    * @node: the &xe_ggtt_node to be inserted
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index d468af96b465..4337a279ff3b 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>>   int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
>>   				       u64 start, u64 size);
>>   void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
>> +void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
>>   
>>   int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>>   int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index fa299da08684..a822549169d8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>   	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>>   				start, start + size - 1, size / SZ_1K);
>>   
>> +	config->ggtt_shift = start - (s64)config->ggtt_base;
>>   	config->ggtt_base = start;
>>   	config->ggtt_size = size;
>>   
>> @@ -560,6 +561,24 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>   	return gt->sriov.vf.self_config.lmem_size;
>>   }
>>   
>> +/**
>> + * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
>> + * @gt: the &xe_gt struct instance
>> + *
>> + * This function is for VF use only.
>> + *
>> + * Return: The shift value; could be negative
>> + */
>> +s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>> +
>> +	return config->ggtt_shift;
>> +}
>> +
>>   static int vf_init_ggtt_balloons(struct xe_gt *gt)
>>   {
>>   	struct xe_tile *tile = gt_to_tile(gt);
>> @@ -817,6 +836,89 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +/**
>> + * DOC: GGTT nodes shifting during VF post-migration recovery
>> + *
>> + * The first fixup applied to the VF KMD structures as part of post-migration
>> + * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
>> + * from range previously assigned to this VF, into newly provisioned area.
>> + * The changes include balloons, which are resized accordingly.
>> + *
>> + * The balloon nodes are there to eliminate unavailable ranges from use: one
>> + * reserves the GGTT area below the range for current VF, and another one
>> + * reserves area above.
>> + *
>> + * Below is a GGTT layout of example VF, with a certain address range assigned to
>> + * said VF, and inaccessible areas above and below:
>> + *
>> + *  0                                                                        4GiB
>> + *  |<--------------------------- Total GGTT size ----------------------------->|
>> + *      WOPCM                                                         GUC_TOP
>> + *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
>> + *
>> + *  +---+---------------------------------+----------+----------------------+---+
>> + *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
>> + *  +---+---------------------------------+----------+----------------------+---+
>> + *
>> + * Hardware enforced access rules before migration:
>> + *
>> + *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
>> + *
>> + * GGTT nodes used for tracking allocations:
>> + *
>> + *     |<----------- balloon ------------>|<- nodes->|<----- balloon ------>|
> left side is little misaligned to above WOPCM (it that was the idea)
true, will fix.
>> + *
>> + * After the migration, GGTT area assigned to the VF might have shifted, either
>> + * to lower or to higher address. But we expect the total size and extra areas to
>> + * be identical, as migration can only happen between matching platforms.
>> + * Below is an example of GGTT layout of the VF after migration. Content of the
>> + * GGTT for VF has been moved to a new area, and we receive its address from GuC:
>> + *
>> + *  +---+----------------------+----------+---------------------------------+---+
>> + *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
>> + *  +---+----------------------+----------+---------------------------------+---+
>> + *
>> + * Hardware enforced access rules after migration:
>> + *
>> + *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
>> + *
>> + * So the VF has a new slice of GGTT assigned, and during migration process, the
>> + * memory content was copied to that new area. But the &xe_ggtt nodes are still
>> + * tracking allocations using the old addresses. The nodes within VF owned area
>> + * have to be shifted, and balloon nodes need to be resized to properly mask out
>> + * areas not owned by the VF.
>> + *
>> + * Fixed &xe_ggtt nodes used for tracking allocations:
>> + *
>> + *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
>> + *
>> + * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
>> + * overlap; but our node shifting will fix addresses properly regardless.
>> + */
>> +
>> +/**
>> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
>> + * @gt: the &xe_gt struct instance
>> + * @ggtt_shift: the shift value
> nit: function is about _GGTT_ so maybe we can drop ggtt_ prefix here?
True, since we already did that everywhere else.
>> + *
>> + * Since Global GTT is not virtualized, each VF has an assigned range
>> + * within the global space. This range might have changed during migration,
>> + * which requires all memory addresses pointing to GGTT to be shifted.
>> + */
>> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>> +
>> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
>> +	xe_ggtt_shift_nodes_locked(ggtt, ggtt_shift);
>> +	xe_gt_sriov_vf_balloon_ggtt_locked(gt);
>> +	mutex_unlock(&ggtt->lock);
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
>>    *   or just mark that a GuC is ready for it.
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index d717deb8af91..6e0da81d0359 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -20,6 +20,8 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
>> +s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index a57f13b5afcd..5ccbdf8d08b6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>   	u64 ggtt_base;
>>   	/** @ggtt_size: assigned size of the GGTT region. */
>>   	u64 ggtt_size;
>> +	/** @ggtt_shift: difference in ggtt_base on last migration */
>> +	s64 ggtt_shift;
> btw, do we want to expose this in self_config where we already show GGTT
> base and size? if so then update xe_gt_sriov_vf_print_config()

No, I don't think that's a good idea. It's just a derivative value valid 
only during the recovery.

GGTT base and size from logged lines before and after can be compared to 
get the shift.

-Tomasz

>>   	/** @lmem_size: assigned size of the LMEM. */
>>   	u64 lmem_size;
>>   	/** @num_ctxs: assigned number of GuC submission context IDs. */
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index c1275e64aa9c..e70f1ceabbb3 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_pm.h"
>> @@ -170,6 +171,25 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
>>   	work_pending(&xe->sriov.vf.migration.worker);
>>   }
>>   
>> +static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
>> +{
>> +	bool need_fixups = false;
>> +	struct xe_tile *tile;
>> +	unsigned int id;
>> +
>> +	for_each_tile(tile, xe, id) {
>> +		struct xe_gt *gt = tile->primary_gt;
>> +		s64 shift;
>> +
>> +		shift = xe_gt_sriov_vf_ggtt_shift(gt);
>> +		if (shift) {
>> +			need_fixups = true;
>> +			xe_gt_sriov_vf_fixup_ggtt_nodes(gt, shift);
>> +		}
>> +	}
>> +	return need_fixups;
>> +}
>> +
>>   /*
>>    * Notify all GuCs about resource fixups apply finished.
>>    */
>> @@ -191,6 +211,7 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>>   
>>   static void vf_post_migration_recovery(struct xe_device *xe)
>>   {
>> +	bool need_fixups;
>>   	int err;
>>   
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>> @@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	if (unlikely(err))
>>   		goto fail;
>>   
>> +	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
> otherwise, LGTM
>
