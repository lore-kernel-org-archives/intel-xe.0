Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668A8CAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 18:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CE510E36B;
	Fri, 26 Sep 2025 18:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcJ+ZFRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902D210E36B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 18:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758912372; x=1790448372;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uHZQfEAcI31JcY/3at9MaU13GQi2PprQ/YEBPzpE3hU=;
 b=XcJ+ZFRaVBX1STaoArpdXPwa7b7jHgxjQ3M014uvZ2+0bNgp4dq50q3R
 NtOD2jp9e752DcN3eg9NrsU8SuyTbD25ErNuccAKEzgB2av3JlhJ4stgY
 ssX9p1GfQSbmeU+9YCg6h/MKyTWJMyiOKcy/99m72T2sSFlr+mbKSKMZo
 BWOo6pKy7Nzl2KxXBAsrjunNjVzhoM5DvfhPD0ove4sr+JQW6Z+c0b+iW
 sqj26WSn5pmDpehKTFzYBY93twBb7/Mde9v54uoRznwU8H+Eic/NggvZr
 RsYwe9sqFJ1NqT/nTaqFENMOj3A2xBZxtBpkJSsyuFUuUz2D2fdxLLcde Q==;
X-CSE-ConnectionGUID: 8mZ07yzURBCshMAohWJtxA==
X-CSE-MsgGUID: i4gcxdSmRKaG++PvpeeYnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72612122"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72612122"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:46:11 -0700
X-CSE-ConnectionGUID: I8UEx/7QT8Wp7eGf/b5lPA==
X-CSE-MsgGUID: fLxWwRITQe+/kS4hkT2G/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="181702390"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:46:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:46:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 11:46:10 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHSYF6PxKxUbUU3MMO+ycFivt+X0VH3TxxC3WrX6ybeF3qSEkmrc6SgvJm0dzyup7pp8760UQWrxTz8LnaCT3kh9E5LUnVgI9cmCJ93ui8jKHf/8dS0OpQUTcAWg9K5TlKe94fOPAxouC2jVXabokGvB3pWbNcv3GQy8HzXGN9BBqrDos4AyouuIlUylbNBCGS/XP4JmiRXegl2/cy1McXmvKXYrkZyOF/SPDqBQx+zK92X/H4X/TzcrjFLDXbBspg9zX8d5w9R0orHDyKAtu5hFWQ6ql3Md2f1HTtYs95+cQTp9LWQufEIn0siaKbfWOx4p8qFG9pVfePXUtZxiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qggf1wf2QKPxsEPTJakoFhsqScJn+ikN3QhWm7tCcK8=;
 b=ngZ7RyTc/cw9wA72frvDUrjuDcmyxi8gd+FmqhARuB57MeGxlMcoXzYJ/yzLDUDHDgETv1Sli7FzRD+i60UkoqlIuIUoVgO2RYokrgaTZEZ8uAJLZZvMjnh+QbCuzOdOJcq3KGrka1oomTvaUcTU6xolEZjxy5vKKLEn97OQa7EvEz91+xUuLQ0Na+T+MSc7L+SxthXod+sN5QBK+lrsM6F1wq54wfPeGfmJAhb/qDbJfsAI2Kz1tX3af4c9Rn7nkhnkL/zeiS/8kjmFA+JbJaWuYT10x//AO4jJRfb71dvaEHOlkz3lLxxCVMM+mnTieWlMO0abV3CVsbwLmMUfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 18:46:07 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 18:46:06 +0000
Message-ID: <332f4f67-91be-480a-a74d-e6731a8736ab@intel.com>
Date: Fri, 26 Sep 2025 20:46:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/xe/tests: Use xe_root_mmio_gt instead of
 xe_device_get_gt
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
 <20250926155948.145934-12-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250926155948.145934-12-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 6155955a-947a-4847-4c3f-08ddfd2cf3c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amlMaE1RS2QrNHNMUXdLbm5yeUJ2M3ZtczZrS3VONEFLVFVBVDBkeUJYb3pR?=
 =?utf-8?B?QVVtZTRUa21rZEwrMXpqd3huQmkyZWUzRGNmNEFqZHFFUUp2MTBoQThQenps?=
 =?utf-8?B?aERCZjNOc3JyRzd1bHZPbUk2RG90bktNOWZYRi9zbXR0V21Sc0k4Wm4xQzR3?=
 =?utf-8?B?Nzh3VEtkNnpWUUZiRGN4OWFRbmVURUJhN2pkbDc2a0JySWZpNk1aWmtsSjhm?=
 =?utf-8?B?WHZ1TlZ2cmQwRFNZTkxVV0ZBUmlNOGJlTTByV0xUVUJockV1d1hacHhuU0Zz?=
 =?utf-8?B?K0JyRVNEVS8xNFJsNUxZUnUrdnJqMXpJbHVxS29PcXZ5ZmkwSFJqN01hRlM3?=
 =?utf-8?B?dnRsbWY5VGZ0ZSt4T3MyR29GTFk1d2xqbmEwTHhMZDUvUDF0TmZvR0F4MEhu?=
 =?utf-8?B?bCtqaFZ0Wm9HYjlLR2NTcFVHeHJWK0V0WDcwUzdvd0tjSklTN2VGRXBzLytR?=
 =?utf-8?B?YWhYOVRxZWxWY0pXSVd5QzBSZWpJRzd2Mmw1M3gzWjNwR3pOcERjRzMzTnAv?=
 =?utf-8?B?c2VSOTJ4b2gydTBTSE45d1EzelZSVUdvVW55U1NrQjFvYUlCZ0F1ZUx4Nmk5?=
 =?utf-8?B?WjNrSS82Y1RvOFlNWExTMzBxOEgrSVB1MW9UVkMvMEk4eXhwdE9oMi9jVG1h?=
 =?utf-8?B?T3g3RmZjb2lkR3N6blRLSlZrVVlndGJUczRzUlM5aUtENGF5TE1BNG90dm1G?=
 =?utf-8?B?dklEYWNVWmVKK3FHZFJORFRtUVlZRWJtcHdmR0lRL2hScEtIMHgzWlFvWDJh?=
 =?utf-8?B?dDhCMUYrYTdIOTUvdkRGVFVuUlh5N09hMm4yNlBlNmZTSlBIeDAzSzdkT2Yw?=
 =?utf-8?B?VGdaZTJZZzRpY2VkQ3lDMHJ0UGh6cVlCN2hGUXBteVhkTkF5THhIdjYrMUhR?=
 =?utf-8?B?MXlIbHg2WVBWaytPeCtxc0RTeVF2Zmh4K2lBckIzWHJTSzBnMXp4Ynl0QjA5?=
 =?utf-8?B?L3ZpbVF3R3pRTnU5SHVqdlNuck1SR1Y2MXpjRTdCNVg4RXJjWHRaMXpjV2VO?=
 =?utf-8?B?S1puNDdxcVg0elNQTktWdTFtcnRYaE9idmcyUkU0RFV3ZE9saWtpZFR3TEN5?=
 =?utf-8?B?eTRvLzEzVytkZVZ3clp2SzdSYStrUDRhcXhKNUx2VFFRVGgyaXV1MVNmQmUy?=
 =?utf-8?B?OWI2VG1IajNWQzg1bUNIRWtYUzJVRTZScFNzVDhOTlRaVExYU09kWGxsemNq?=
 =?utf-8?B?MS91N0M3b1M2Ulg5R1lsamhaMDFBVE1nV1Jacmt4UUM3bkdYbGJDNCtwa2sv?=
 =?utf-8?B?SEJwU3lYRlM1SCtjeC92enVER0g4RkFOaUVnZDNlR3Y3THAwMDdyNzJVYnlh?=
 =?utf-8?B?eDVlcGkrZW02czcvUlFZKzB2MGQ3M0M1N0Y0MHUyRnR5SHMyYWtDUk9QaXdt?=
 =?utf-8?B?dmIzVGk3b2RHWS9xMXhXa1dUK0d1b0VuNHgxU0w2TU1BRlVYM1VzYnBXSStw?=
 =?utf-8?B?bHZuT0JQTTVpVktRNHVhSEZzTk9yMmc0Uk5EMnlzTHY1U3RvVDlwT3Mvcmk1?=
 =?utf-8?B?OE5KNlMyVTZCTzhWSjFic3VkR3Y5OVlYNWdxWkV2YnhUM1Q1c1VDdmQrN1FJ?=
 =?utf-8?B?S0Z1M093WFppRkZuUEZaQlg2dEFDQUEwbUNMUDJWWmpJUXVxVHhSdjFCblBY?=
 =?utf-8?B?MTAvOERVRlJLY3VhbzEvNWhIT0phekNicXJQWFlnRG9kYkhxRG1jcXB2UXdM?=
 =?utf-8?B?ZjFkY3JGODhDZnB0TjA1Znl3clRNM0pHaTdJYzNUZVFGa2FRdHplZXdVdFNn?=
 =?utf-8?B?V2hWTERJQm5IbzJoZ2k0SFI3amFSN3ZyNkhLVi82L0YveVp1NnVDTVU3bHZm?=
 =?utf-8?B?STBDMjkvUkhWa1VLV1UxcUxvZ3M0c2tvWGhlTjlXTEUyeXNDcFFJRlB3Uk93?=
 =?utf-8?B?a1dMUGR6YzRxMllDN2F5a0NqL2tvdFZtUlNINkMyQVM5UkJOOGZwMFRvZ2t3?=
 =?utf-8?Q?2BowCFA0H0tg81AE/8+MJLIrRG2burLV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bS9vSFNLSzkyam1VQm52MThmRTFuMXFabEp2NzRZUHRuZGJxVmxQSEtoWlJC?=
 =?utf-8?B?bWNaWE1HcmdJVTZpUytoek5FUEV3M3ZNdFFNQ3NxRzZwUFNXbndwd2tncjdG?=
 =?utf-8?B?MXBMVWFtZlBFaHJrejhSbm94ZWpmb2dzQW54Wnc3QStyYnBuUHJIR2RJWVZh?=
 =?utf-8?B?Z3BqbnNWVnlSMkRvOWkwMGNnTjc3Nm93aVJBcmlqbS9hYlZPTWlRUm5vVUdr?=
 =?utf-8?B?N3h2M1lxYzVYWmxocllOQ1RzNGVVa2xrL0srRHBiQm0vUWVKUzFWMW9abHJq?=
 =?utf-8?B?ZXB0NUtPeitzTWNONlRlN2ZzSVR0RzF6VEhkTHlnZ3dtZGtOVGVuQWtabndV?=
 =?utf-8?B?V1krS3I4OWcrUmozUDdyS3E0dTkzZDF4aXRtbnZHa0JqdkRNSGsvSHBFL1hu?=
 =?utf-8?B?emUwUU04K1dNSG1YOFlpckhYQkZ3UzEyWm1XdFFxM3RMYndJRmZsZFpLbmpj?=
 =?utf-8?B?c2FHTUJuSk9YZUc4a2JnbGJzNWxPbUJ5Mndkd3dxakgyNnZybTBRbndicmx1?=
 =?utf-8?B?UHh4TXFOeEpiVFBUbDE3dG9Pc1o4Qi9iQXFSMitCRndnWFZ2UTBCd1lLeEVX?=
 =?utf-8?B?eERFK2lPeVdkc0hhVU5XaWtMVDFDcFFHUzEyVHdlSGxGbEhYTjg4M2JjeWx3?=
 =?utf-8?B?ZG0ycnFmV3dud3VpbUxoU0lhc1U3SmkwRXVKQzFaZUNBdkJTSjBZLzBSYW9X?=
 =?utf-8?B?c1BzVG1sbm5ucUJTaDZkekQzWWMrUFpBdVgrNVFDSUN2TWJyYUJqSUpRb1ZC?=
 =?utf-8?B?VWhBaEkvZjU5Q2szcTFSc3lCWXFxcXdwWDZyM3FSYlgvRnVBZCtLMHl0cGFy?=
 =?utf-8?B?NlZLekhEWkJQVU1wZzdxNkJUWDRQOTVZeERNUFVNRGQ2RlBTMkFPZm5ZZDhU?=
 =?utf-8?B?bkFWK0R3U3RlTS9NdXAzVUoxdFp0dkc4ZjRrcmJ1T0J6K05BVEF4T3NzZFEr?=
 =?utf-8?B?dFBLUlFkRXFRUmJBTDZYbXk5V2dRSmpVVDZJOHVoVWY1eHpCTXBZb1l3OEor?=
 =?utf-8?B?MjdLL1JyZlNKSm1BMlJCd2I0UHZuQlRNVWM5YTc5OThzOVJZNE05OTQ5SGg4?=
 =?utf-8?B?UHVqbkxrUWxOckJEU3VTL1ZtTU81SFcrOS9JL01ON3VTTHlBWElqaTViTC9H?=
 =?utf-8?B?MDlldU01bzArUUYvNWplaldzRlRxUnNWZ2l5UkJvQVdyTVduNDFUbVlic3E2?=
 =?utf-8?B?WXpralhoSFBYNkRQQ3JjajdtblVWdjRsZHNUSlp5U2tzbzZPZU1rVjZLeFdL?=
 =?utf-8?B?cCttVWpYdys0NnhsOHg2ZnA3NmVwanFadzlkNG13Rno0VWV6ZE5NTjlGMjNp?=
 =?utf-8?B?N2w0aE5xMFgwbjZYbFFrd1Q0V1g1aEYweEJ0L25rbTArYnRRcGxRbXM3VUN6?=
 =?utf-8?B?cW1qZFBGTHFmeEF3M0pQMUJjSHdVU2Y0TFhJaXpJVWRtcml1QVVSMnZxK0JW?=
 =?utf-8?B?bkxVU0hvWEJHbXFORmRNUkIxTkc4SkNSbFdxOUxYMWp6d3k5WHVsS3lpbXhl?=
 =?utf-8?B?Snp6SUpsSFd3MHZYQjcwMi9pVm1XTGQydmRnMTVEZ0FqMlpsU0s3NDVHS3Yv?=
 =?utf-8?B?c21KdXZ3YVl5SG9WSGdSM3hUTlNMaGR4WkhtQnJ2RlIxb2Rsc2ZZRXlpL2g0?=
 =?utf-8?B?ZUNhd0lCam5xTS9YU0JjMHZ3cjJoLzlvSWRvU3pkS3F0T3J6UGJZKytNeFN1?=
 =?utf-8?B?TDRHV2ZzZ0xxT0NSdG91ZVY4dnlCSERGSEdyZ01aNjZpMFVYZWt2VlhSbmcy?=
 =?utf-8?B?am1tbXNHMmNNVk9PeUhEWDV5bTFwWE1JeVRJUWd1N3gzazltZGIwWERGbVM2?=
 =?utf-8?B?L2ovQkVKTkd1ZFZXNVFBSy9SYTR0YnUyalNQdTMwck40ZEdudjFsTGp0cENT?=
 =?utf-8?B?aUpuWFlmVXBsbStnT1ZRWWJlVzEya3UwOW5NWmJYaUZXZS9qMHBnOVl1VVJk?=
 =?utf-8?B?a1YzR2haR2xvSis0bGcrOVJubi9jODdJNUxpS09XeHBLTTRObkNhZmFrWWJW?=
 =?utf-8?B?Y0pnSURBQ0ozQ0VFM29qaHNWRmlCL05QZTh3UzM4MEgvTVlOK3BlaFc2VzUy?=
 =?utf-8?B?MEFTVi80WFBzSWJUMWxrRDNMWkNuNVVQbnNtREFaZUNhR1pDdmU1M2lObnp3?=
 =?utf-8?B?aWNvRU1Xa29CdVhYOU9SdTF5TlVIN2lDc1dYQ1Q5ZmRiVDBEVVY3WkxmTXZU?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6155955a-947a-4847-4c3f-08ddfd2cf3c5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 18:46:06.8595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8J/g72/9cTMEJyQvQ48bJkyg/1RaO8rXzYk/PvHQO/4WQ6gl5cHctPm9HfWRYDxDcaKCaWgcyL9shHlpyAn7SDAP/OiMMUl7oUtIm/t53Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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



On 9/26/2025 5:59 PM, Jonathan Cavitt wrote:
> xe_root_mmio_gt(xe) is equivalent to xe_device_get_gt(xe, 0) in terms of
> return value, but it takes up less line space and is slightly more
> efficient during execution.  Replace instances of the latter with the
> former in the xe test code.

I guess the rationale here is not about efficiency, but rather that
tests just expects root GT0 to be always available as part of the
test setup, so there is no point is using more flexible function that
actually may fail in some cases

otherwise, LGTM

(as in tests we likely wont be able to disable GT0 by configfs ;)

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   | 2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    | 2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> index d266882adc0e..33dbcb262204 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -63,7 +63,7 @@ static int guc_buf_test_init(struct kunit *test)
>  	xe_kunit_helper_xe_device_test_init(test);
>  
>  	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
> -	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
> +	guc = &xe_root_mmio_gt(test->priv)->uc.guc;
>  
>  	KUNIT_ASSERT_EQ(test, 0,
>  			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> index a87a7b4b040a..59a7c2d57fe2 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> @@ -13,7 +13,7 @@ static int guc_dbm_test_init(struct kunit *test)
>  	struct xe_guc_db_mgr *dbm;
>  
>  	xe_kunit_helper_xe_device_test_init(test);
> -	dbm = &xe_device_get_gt(test->priv, 0)->uc.guc.dbm;
> +	dbm = &xe_root_mmio_gt(test->priv)->uc.guc.dbm;
>  
>  	mutex_init(dbm_mutex(dbm));
>  	test->priv = dbm;
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> index 3b213fcae916..d211dfa09538 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> @@ -355,7 +355,7 @@ static void g2g_distribute(struct kunit *test, struct xe_device *xe, struct xe_b
>  	struct xe_gt *root_gt, *gt;
>  	int i;
>  
> -	root_gt = xe_device_get_gt(xe, 0);
> +	root_gt = xe_root_mmio_gt(xe);
>  	root_gt->uc.guc.g2g.bo = bo;
>  	root_gt->uc.guc.g2g.owned = true;
>  	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, root_gt->info.id, bo);
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> index ee30a1939eb0..3c84bcacd0ac 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> @@ -13,7 +13,7 @@ static int guc_id_mgr_test_init(struct kunit *test)
>  	struct xe_guc_id_mgr *idm;
>  
>  	xe_kunit_helper_xe_device_test_init(test);
> -	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
> +	idm = &xe_root_mmio_gt(test->priv)->uc.guc.submission_state.idm;
>  
>  	mutex_init(idm_mutex(idm));
>  	test->priv = idm;
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> index 13701451b923..645c8b6de3db 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> @@ -38,7 +38,7 @@ static int relay_test_init(struct kunit *test)
>  	xe = test->priv;
>  	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
>  
> -	relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
> +	relay = &xe_root_mmio_gt(xe)->uc.guc.relay;
>  	kunit_activate_static_stub(test, relay_get_totalvfs,
>  				   replacement_relay_get_totalvfs);
>  

