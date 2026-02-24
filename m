Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA31AE9B25B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 12:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BC510E568;
	Tue, 24 Feb 2026 12:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXJsY/Kj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADCC10E568
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771935477; x=1803471477;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l3uwUQResyuq3CE5u3H8spl8tItPQ+fkc369KwhYjAY=;
 b=dXJsY/KjHXWHkc+3k0inh1uLv8wn2dKANjYPDv1BrBP5By4qXHX0VmwS
 Q6J+y25sdGFU4Fw/FgfvQ3p0OEAlfo9eduHw2YrLERJgYbSuXYEiOAzoQ
 AaahFIwjH+nNvcPoIqesQtSEPMBYckznIgScDU44kAQ/4H83mQuoIv3tb
 6I3vMGUGKOXfHA+sv28HOmNWwALIpmeO+1hEXt44B7cfzIPaxrz7mdevR
 F0YEh3+dSAOpglFjimG49tPiDBv2SgwcgK47cOEPN6shXuXAouhDbAwz6
 Td5YM3n5qq4Y5ZOCTsP0zQG6E7z6v9P0F8fklRjAvBoUx6qtn5skp8Jul w==;
X-CSE-ConnectionGUID: 1D6CJO5yQ0yOl4GjvwCfug==
X-CSE-MsgGUID: dcLfP984RAWMIWVUvX2ifA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72822377"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72822377"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:17:57 -0800
X-CSE-ConnectionGUID: kGMl+9tXSRmJKJan2vyhXw==
X-CSE-MsgGUID: 9JVxrWrzQ22GhrtBNMIKGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="253615547"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:17:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 04:17:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 04:17:56 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.37)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 04:17:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN+qWFb6n0kIMjNxroTeUqdR/3TTb4dxe3IDtho2OB/1ZasGpbXKhc08haEN6FL53RAzPmX6iHmDwHju3jB2wKx1IzSfWbEly/hH+srIcAZtLgboYa1AoJcP7fF6bkqM4Y70B9Ff3KMqCYFOF/coq+pQcluERAzGOOambk6/4HqtEaKqJXPPLKRFePfCj0govPz/Ml0wt86D0ELVAO5iXp71QwKi5aKCrNB0rwGVR+biEh8go24FUT7jDB8xBm/khgba30Jq5X7N3lMAkt484I18M0IoOaVONrkflLB6NY762pOQLXmz0nBlC3Dx3p3seKmM0VUT+GnxP3mcwcgFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sES40sDF0lHsQA0OqsnAtSH4yWtvZjqFd56tMt0Fv4Y=;
 b=y7B46jyj8KX6FaGh682iJHah8nzrp8jhDW3mcfTnkH0oV8nBq86JNoFba8Egyt8RLKwgCmdyefeSi/2UJ8kUR1WN5n/13bpazlgxC0Gl/t+srwmD7XHkuJv9xmEqusshJD2jz5O7LsAg4wHLlBLBHuHZQkXfb6Ax24Bqj3okNAQI2dnXhHNVB8AKxlOZhNiXGO9ijeQKscj42IvVNbSyOle69e+GCFZL1Ar+VJ6Gc12vd4PWmO5+PKhL5ItVA83jcIW/kF/zdPRUDXRg4lq//HAr8RZpNenyOZ8g5ulFsBr/0QHaHPNdwUzRtmTqWzFOSU/vNX4YkPG+DnZALV7/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 by SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 12:17:48 +0000
Received: from CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671]) by CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671%3]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 12:17:48 +0000
Message-ID: <cbae860e-7af2-462f-ba0a-6308929d1a6d@intel.com>
Date: Tue, 24 Feb 2026 17:47:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-17-riana.tauro@intel.com>
 <d0b58cba-c8d5-4c25-865b-47852661d387@intel.com>
Content-Language: en-US
In-Reply-To: <d0b58cba-c8d5-4c25-865b-47852661d387@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::23) To CY5PR11MB6209.namprd11.prod.outlook.com
 (2603:10b6:930:27::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6209:EE_|SA2PR11MB4858:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a98bac4-57f8-47ec-47ea-08de739eb94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWZPYUVNckRZb1YwYWt6eW92VDZLS0E5cWJsSGRuV0tlY1NNTWs5VEswbGNm?=
 =?utf-8?B?d3hURkR3VFN0eFVGeCsvL21McWJCdVVtRE93d3JRb3NSdjRmdHZlSVk3a0RZ?=
 =?utf-8?B?OEdFTUM0RTJXQjJCTFN1VlVzL1hLWDdsL3c0dUNoV2R2aXVuc2gwU1lscXhw?=
 =?utf-8?B?Unk3ZUU0N0Y1ejBOMTE1OXA3NlUwOXNQSzRTS3dPRzRZbzJRNHpVWStwUkp1?=
 =?utf-8?B?cmtpWnJCWS9QUUJqM1BkQzZRSFNwdVdWdGpqM1Y2ZDh5b2VoMUFJei9KNVlr?=
 =?utf-8?B?bldid1B5bW1JOGNjOW5mRWVHM0JZcGpwdENPd3hlVTJCQ0s2UzRJSy90bXUx?=
 =?utf-8?B?a1VPd1laVFp2QXNCK3E3MkNjUzlsOXVxY3psU0pwNUE0clFCV2VnQlpUTVE2?=
 =?utf-8?B?a2pjK1hheXF5dy9xeE1SVkZnc0lEbkl0SEEyNEpkdVljTEs3L3FIR3BpeFZQ?=
 =?utf-8?B?QytKYTJlbXFjWmhQWjFEWUpCRzlKZ21ZeW40NlFCTDJML0FhZUtCLzBINTdw?=
 =?utf-8?B?c3czbUtuS1o1Vmkvd252YVVSRll1NDI1dXc0SkxHazNlZXdmdXlNYTBPTFEz?=
 =?utf-8?B?cW9WNEY4Z2hHZWVBc0NHWHNIK2pNZys4d3NPNjRaS21iVlZsOW9XalFGL24y?=
 =?utf-8?B?TUhnNVh1VVI0T1FIcUJaOTlKRjBUajB5ejgrVFV4RUhoemZZNktKRDd4RWR6?=
 =?utf-8?B?NEk3R2NlbTZ4VCtFek4waVRTNzltN1AyQkNBVFh2dkpxZVVST3AwZFExa3Jj?=
 =?utf-8?B?N1hIVzI4b2dBMTA2Q0U0UDR2MmJvR3RTZm1EMGdNNURTUXRCZm1SMG5yME1q?=
 =?utf-8?B?aG9uQmNCL1VRb0VOR3UwWkpRejJxY29tQVRHUCtweGVlbVZlb3VHN0xpL1Jo?=
 =?utf-8?B?VlFrVUdCVDBBZXBnRWZ5UVMzbW8yRDJNbkZWY0dJKzBqS1YxTkJVRlhNOGFV?=
 =?utf-8?B?TEZDUVZqS3NSdzU2czRReHBZcExxZG5TS0l0c3FmdFpRZlR2ZzJNaGdpanVO?=
 =?utf-8?B?U284aS9oU0gweEhIdVRXczZoa1R0RC9RcC9Qc1FISTVCODdnTGRzTmVpZjZN?=
 =?utf-8?B?b3BHSXREMitYck15VWRId0VmMHFGM2QxM2xpMmkrdEtvaDdZM2d2RHQ0UUhU?=
 =?utf-8?B?VzZsalprMHJ4NzRreHdnaUpOYnpFUzBITFZRamEweitWazhIQk9vZDF0c1hh?=
 =?utf-8?B?NXkxU21OUjhYTkJQOExrNExzMXhSN3hmN3NxZjMyTzY5Zi9xU0JVajAvN1lO?=
 =?utf-8?B?bVgzWXVLLzBWcURaU09RcTNrWXdxcGIxWGx3UUlSTElQM0ZjV2YvcC9XdnMz?=
 =?utf-8?B?dmdCZUtkeUVnNTRtVGZiYlBJbnptUlo0UERzMThSc2lRSUxSVXRMWnlKcWZ6?=
 =?utf-8?B?UXp2cjcvaVZMbmtYa2pHOXdFdWtQNG9iZkt1bi9qS2lJY2NoWTFmMGRwUngz?=
 =?utf-8?B?Y211NU1QZzUvN0xlcTdWNkI5d3JtM1YraG5pRzc3d1JqWG5HTEphRll2MXo2?=
 =?utf-8?B?YzhZZTFKMi9PQ3h5dlorYmFxbWRUV3BmdlZ2MzVnbHZHVDRnREJIdjl0UDJa?=
 =?utf-8?B?NVpZR3hibGpQQVhBeTZWQjFwSG1ERFdrMHRhRGJVdTZ3MFh1RVV3dWVQWWpl?=
 =?utf-8?B?ZGdmVkg4ZW5iQWpxaU1XMlQ2TnE5cEQ2VEJrYTFqRXZIYXI3ZTdmb0Y5V01l?=
 =?utf-8?B?Q1A1b3NhMHRiVXdEZVlhL2xCS3NSZ2cyTzRLRkF5cTFLNW9oWGdWaVVaK0JF?=
 =?utf-8?B?UG1DNGdRbHlINnprVk5nTndpVnluMi9sOFRESkVSK211eWNxRXFkQ0VsYmQ1?=
 =?utf-8?B?MS9wK0pnWi90NzJVSTFQYktjNjBhd2R0Z2ZYNGd2blFWSUNGVDVHY21Xd1R5?=
 =?utf-8?B?RkxiVW9ETEYvQ0NKdHZiMSt2NFhZWUVVekhzSkc3RUg1dUw3d0dHYjh5OFlI?=
 =?utf-8?B?eGtORDF4Tm12OW5icTZjcThIbm9zMUZjUzFjZE9qZGp6R3E1em1GUUcwZ3Qx?=
 =?utf-8?B?WXVNZEFHenJ2MnNHM2xTSk96U3U2WjVKc0VyaStvM3NoS0tUNnJrdWJsVkli?=
 =?utf-8?B?RjVBWFhTVnF6cGVhSHRoeWowNXlzVCtNWEFoNXBwZFJOa0Zzc3kvSHdXWURu?=
 =?utf-8?Q?puJg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6209.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2tvTnd3bEFpUjlLQnkya2E2NmM3cjBoVUZ0U1pkdmFSMEd0U0dZTXhLLzhU?=
 =?utf-8?B?TDVHbWNTN3VIbzIwR0htV0N5SXl2M05zQXBBbC9IVnBEV1RpVWgwc3U1OHZ0?=
 =?utf-8?B?RGRXMG00Tko0OGJJeDRPdzRDNjNZZ1pjcDJPRERXdWo1NHVnbVpraHN0Tlli?=
 =?utf-8?B?UHk1eVMrQ3VXZlR6clAzVlE3bDBaOTdnU2hGRFNnZHNoVDE0VVNlM2s0RHdI?=
 =?utf-8?B?eCs2Nm5oZm1UajNJYWNCN1V4WnJNSzdEZnZ4Q1pxY1lmMTJYbGZxekh6UnBZ?=
 =?utf-8?B?clJGdEoxclNBU1h3TCtnRjhkYkVmc3IydmRaVzAvZy9zN0NpcmhaTGFBRHp2?=
 =?utf-8?B?Nm5KTDhTQkorYndPV3dNRHhlRkpkclpBOVEyQ0xockd3bWFSTno2bFltSGtk?=
 =?utf-8?B?QTBoWWNjcVE4L2FLWjluRkZ3dnlkcDUxSEk5YzUwOU1YN0hmUlhFRm95cXRw?=
 =?utf-8?B?elpkUytJT0MvNHBRVFZHNGFhS3FHekp2R3lPRHZlV3VIQnRKblNuRCtQNFN6?=
 =?utf-8?B?aE1UaGV0d2pENzlENHFjUDZoTEFkdWRSODZlekZOdm5KcTYwVHhOT0c2d2RS?=
 =?utf-8?B?Rk1MUERIa1cxK2FKbHVpLzlCTkRVbW9TeTVEcDIvQmFwbWlEaEFHRG9NTy9X?=
 =?utf-8?B?WExIQUhCRjdnYmk3UHFMQTZmdnpzQjgwcDFmTlpSaW10dGVWQ3I3d1h3ZW8v?=
 =?utf-8?B?N0ZtSFV2ckY0OVVHZkx2RlIzb2tzN3I1WVBEQXdRTWV4TWZhOVhhUjVoem94?=
 =?utf-8?B?ajN5VlVBNElpODl1QjQrbm53eWtNOXRXdGc0VW4wWjJIZVQxN0tPN1Q5amVM?=
 =?utf-8?B?c0dNZDFXaTlFM0VEekkwY2ROaWdBN0ZpTDFTUXNTVXppZ1JBOEJEN3NnR1kx?=
 =?utf-8?B?N0x2TlVmbUI4SXYyaFFHR2tPK2NQZHZieVdoL0RpYjlnYW0rOTdNTkJxc091?=
 =?utf-8?B?RGFYU1ZGa0dsVFNvaFF1V1JBNWdiZFI5UFVDWWM0V0M2OWExdzVLTE1remQ3?=
 =?utf-8?B?THpZU0Z2b0I3NHJlS0V0VFUxalEvS3NUKzN3MjJ6NmFCTWNqVGYrUHJWOFQz?=
 =?utf-8?B?UnVZYzBQVlltMG5JZmQzZmVHYjRMRGdyd1ZlM3ZGdmp1Mm9xYnEyM1VINFk1?=
 =?utf-8?B?RGJoMXluZXF4b0VBMjliSzd5WUhPT1dsVzBVVHl5b25acElDQTA2UHBBZGRk?=
 =?utf-8?B?akkydy9pZGJJN2l0bldPZVlHZ25Uc2tRbFdGRXJnaTVoQzI3a3FuLzZpVjAy?=
 =?utf-8?B?a1YySjkzUm5TQXJwOUNUZzdWOExaUXJ4dVhXaW5aTFI2c3AwaFNkZ0VkcWx6?=
 =?utf-8?B?VnBlS3dDRGx2aFJYN0Uyc1Q5L3FSNXdpUkJ1TkZQaEdXS3ZjWDBtc3JPZEI1?=
 =?utf-8?B?M1VxNGs2aURVMUZOMVNML1drdEgxVk5DVG9wcUF1NnpWRkJ1WjZuSVNoMjVV?=
 =?utf-8?B?U2tMN0ptZ0JrOU9mbzRQaEl4NlY3MjN3Z1BCNkdESzZTRWdXcnVCRUNURUZE?=
 =?utf-8?B?R0ZUa2xRanhQUDl3TmhFVVRVUlRXcytlcnIzNk0rYmxLRFJiL3lZbHRFQ0sy?=
 =?utf-8?B?czhwWmh2V3hIVHlybjRvUXlJQjBsUFJMeEQxQ2UzbzJESXBlRENzSHAycEdV?=
 =?utf-8?B?TXY2QnBOLysyc0hMU2lJT09FWWdVMjBkaCtpZmM5RGpmSnhsVGsrVzh1bEJK?=
 =?utf-8?B?emZpUDl4QkJBS3o4bFJldURLV2dIY0NDOUJUZ0wveGdsQk9jcUd3ZUU4VXFq?=
 =?utf-8?B?dzFSU3ZJRERPbkJxUzRjWFBpcjFKMFRRRnBpanMyMlRFc004bUg4QSs3UTFi?=
 =?utf-8?B?WW1LcVQvYnFDTXVhanltN1BsR1JWeVp2QWJ4UWlaUlNseTdZcnlyaUduMFdt?=
 =?utf-8?B?QUh5akpIbm9UR3FnU3FRcyswT2g3dGk2ZVJreU54blBZeGpKVUJtanFsNk41?=
 =?utf-8?B?TjB2bXdBMTdnelUvTm83bjg4NkpDcnJYcTB6MjJscXoyc0g5aFBWeGdET2Fs?=
 =?utf-8?B?dnpUV09hYWIwRURJaVB6MlVSYUpRNEZtcXNBazhXdnhSWm1kY29PdThLS1RK?=
 =?utf-8?B?aWdiakx3aTR2dnVSY09mNTdmSjA1V2g4V29sSXlmT2pHWEtJNnh4MXZiV1BR?=
 =?utf-8?B?VXU5SVZyT2FKMGZnUlJIVEdzZEFzUWlnSVYyN1BBSkN4aTNXN2duS0RKWW94?=
 =?utf-8?B?eGJTOXVmNGJOb001MGRzVXJkSE42R1U2RzVNOGtBMVkzN3hacC9LaDc3T1BE?=
 =?utf-8?B?UWQyWnJPSHBEN3doOHlndEUyUXdzZTVTL09UbU0ySmF0eUs2bDNjajU4T3hT?=
 =?utf-8?B?ZGYxZEk2SGlRVnFMV3JSK1JNaHFtNlNVakZYVzJoUnhVeWkrS3dpN09TUTY2?=
 =?utf-8?Q?tdINet2iZfVUZd14=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a98bac4-57f8-47ec-47ea-08de739eb94f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6209.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 12:17:48.5473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiPrFkrqkni4jYEddDwGUjzmK8R/Hxgns+1ktdJUGQ5A/dpwtKCnRIxYQzaUgiPiQiHTtH3QcpfaA+m0CIS1d4ALmeR5zDoONwbNg+5sCLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
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

+ Adding more comments

On 27-01-2026 07:33 pm, Mallesh, Koujalagi wrote:
>
> On 22-01-2026 03:36 pm, Riana Tauro wrote:
>> Uncorrectable Core-Compute errors are classified into Global and Local
>> errors.
>>
>> Global error is an error that affects the entire device requiring a
>> reset. This type of error is not isolated. When an AER is reported and
>> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>>
>> A Local error is confined to a specific component or context like a
>> engine. These errors can be contained and recovered by resetting
>> only the affected part without distrupting the rest of the device.
>>
>> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
>> generated and GuC is notified of the error. The KMD then sets
>> the context as non-runnable and initiates an engine reset.
>> (TODO: GuC <->KMD communication for the error).
>> Since the error is contained and recovered, PCI error handling
>> callback returns PCI_ERS_RESULT_RECOVERED.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 109 +++++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_ras.h |   3 +
>>   2 files changed, 110 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index ace08d8d8d46..2a98cb116dc7 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -2,11 +2,16 @@
>>   /*
>>    * Copyright © 2026 Intel Corporation
>>    */
>> -#include <linux/pci.h>
>> -
>>   #include "xe_assert.h"
>>   #include "xe_device_types.h"
>> +#include "xe_printk.h"
>>   #include "xe_ras.h"
>> +#include "xe_ras_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> +
>> +#define COMPUTE_ERROR_SEVERITY_MASK        GENMASK(26, 25)
>> +#define GLOBAL_UNCORR_ERROR            2
Need  to handle Local uncorrectable error (affect specific component)
>>     /* Severity classification of detected errors */
>>   enum xe_ras_severity {
>> @@ -60,6 +65,106 @@ static inline const char *comp_to_str(struct 
>> xe_device *xe, u32 comp)
>>       return xe_ras_components[comp];
>>   }
>>   +static void log_ras_error(struct xe_device *xe, struct 
>> xe_ras_error_class *error_class)
>> +{
>> +    struct xe_ras_error_common common_info = error_class->common;
>> +    struct xe_ras_error_product product_info = error_class->product;
>> +    u8 tile = product_info.unit.tile;
>> +    u32 instance = product_info.unit.instance;
>> +    u32 cause = product_info.error_cause.cause;
>> +
>> +    xe_err(xe, "[RAS]: Tile%u, Instance %u, %s %s Error detected 
>> Cause: 0x%x",
>> +           tile, instance, severity_to_str(xe, common_info.severity),
>> +           comp_to_str(xe, common_info.component), cause);
>
> Please fix formatting issue (Tile %u, new line at the end of message) 
> and include timestamp in log message.
>
>> +}
>> +
>> +static pci_ers_result_t handle_compute_errors(struct xe_device *xe, 
>> struct xe_ras_error_array *arr)
>> +{
>> +    struct xe_ras_compute_error *error_info = (struct 
>> xe_ras_compute_error *)arr->error_details;
>> +    u8 uncorr_type;
>> +
>> +    uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, 
>> error_info->error_log_header);
>> +    log_ras_error(xe, &arr->error_class);
>> +
>> +    xe_err(xe, "[RAS]: Core Compute Error: timestamp %llu 
>> Uncorrected error type %u\n",
>> +           arr->timestamp, uncorr_type);
>> +
>> +    /* Request a RESET if error is global */
>> +    if (uncorr_type == GLOBAL_UNCORR_ERROR)
>> +        return PCI_ERS_RESULT_NEED_RESET;
>> +
>> +    /* Local errors are recovered using a engine reset */
>> +    return PCI_ERS_RESULT_RECOVERED;
>> +}
>> +
>> +/**
>> + * xe_ras_process_errors - Process and contain hardware errors
>> + * @xe: xe device instance
>> + *
>> + * Get error details from system controller and return recovery
>> + * method. Called only from PCI error handling.
>> + *
>> + * Returns: PCI_ERS_RESULT_RECOVERED if recovered or if no recovery 
>> needed,
>> + * PCI_ERS_RESULT_NEED_RESET otherwise.
>> + */
>> +pci_ers_result_t xe_ras_process_errors(struct xe_device *xe)
>> +{
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_sysctrl_mailbox_app_msg_hdr msg_hdr = {0};
>> +    struct xe_ras_get_error_response response;
>> +    u32 req_hdr;
>> +    size_t rlen;
>> +    int ret;
>> +
>> +    if (!xe->info.has_sysctrl)
>> +        return PCI_ERS_RESULT_NEED_RESET;
>> +
>> +    req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, 
>> XE_SYSCTRL_GROUP_GFSP) |
>> +          FIELD_PREP(APP_HDR_COMMAND_MASK, 
>> XE_SYSCTRL_CMD_GET_SOC_ERROR);
>> +
>> +    msg_hdr.data = req_hdr;
>> +    command.header = msg_hdr;
>> +    command.data_out = &response;
>> +    command.data_out_len = sizeof(response);
>> +
>> +    do {
>> +        memset(&response, 0, sizeof(response));
>> +        rlen = 0;
>> +
>> +        ret = xe_sysctrl_send_command(xe, &command, &rlen);
>> +        if (ret || !rlen) {
>> +            xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
>> +            goto err;
>> +        }
>> +
>> +        if (rlen != sizeof(response)) {
>> +            xe_err(xe, "[RAS]: Sysctrl response does not match 
>> len!!\n");
>> +            goto err;
>> +        }
>> +
Required bound check, since firmware returns more than 3, then there is 
overruns in error_arr[3]
>> +        for (int i = 0; i < response.num_errors; i++) {
>> +            struct xe_ras_error_array arr = response.error_arr[i];
>> +            struct xe_ras_error_class error_class;
>> +            u8 component;
>> +
>> +            error_class = arr.error_class;
>> +            component = error_class.common.component;
>> +
>> +            if (component == XE_RAS_COMPONENT_CORE_COMPUTE) {
>> +                ret = handle_compute_errors(xe, &arr);

Please fix return type as pci_ers_result_t

Thanks

-/Mallesh

>> +                if (ret == PCI_ERS_RESULT_NEED_RESET)
>> +                    goto err;
>> +            }
>
> Need to handle non-compute errors.
>
> Thanks
>
> -/Mallesh
>
>
>> +        }
>> +
>> +    } while (response.additional_errors);
>> +
>> +    return PCI_ERS_RESULT_RECOVERED;
>> +
>> +err:
>> +    return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>>   #ifdef CONFIG_PCIEAER
>>   static void unmask_and_downgrade_internal_error(struct xe_device *xe)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 14cb973603e7..28400613c9a9 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -6,8 +6,11 @@
>>   #ifndef _XE_RAS_H_
>>   #define _XE_RAS_H_
>>   +#include <linux/pci.h>
>> +
>>   struct xe_device;
>>     void xe_ras_init(struct xe_device *xe);
>> +pci_ers_result_t xe_ras_process_errors(struct xe_device *xe);
>>     #endif
