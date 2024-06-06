Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F05C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 13:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C7110E1C2;
	Thu,  6 Jun 2024 13:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUtMlVgT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BF210E1C2
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717681809; x=1749217809;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A0XvhkI0v0LRu9TmIOthecxUzsgYs8T9O3dQiI1Nfek=;
 b=RUtMlVgTKdR5jDxr5cSP7jybAMogT7hy8YUljIRquLpyomZ4NEKPvT1W
 NffNRrK4jPUkD6PWHUkBs/Zp8U3O4PuamtgiaHk5cyudcbxakt9K0S/+A
 6w898/If5HJN2Atz7fR4nhG003f7cvRkQ78NjKv02/Q+S6mp52MRlvMHw
 40KJin6FWLgYTmlblM368IfEGoCwcf7YOPCmIohlpp7QWTt4w51Hl+LTC
 qqlwJtO9/vcg3E2bbSEmaiN0yv23NRVHAFOPjVzMBmERUYf0WLs2w8QWX
 WAcJEMQvV0PJdLmk3mACY+4LlquOMI8Ce26VNQTlSbkq9BLUdxecsyV/V Q==;
X-CSE-ConnectionGUID: 4ZjflWZjS4Kp+VdLQ7ua1g==
X-CSE-MsgGUID: Q5N3epe2SceQpe1l+lsiWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18174192"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="18174192"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:50:09 -0700
X-CSE-ConnectionGUID: 3AAj9VUOSGWkm6V6pG7b1g==
X-CSE-MsgGUID: 9Q6NZ/saQve/EHiIERQQIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="37903121"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 06:50:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 06:50:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 06:50:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 06:50:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 06:50:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vtdxg5X6hzjMhzIeAKa/RkmBSjJq5LVazycJkFuGgiTE9f7p3xITOaOlCJN/ekabBj237EB6Fl+6biyacsxcCKVbDTeq0QBlts/svEaIVJf8FXKoSXRfnHLJTeGZlCLAMfX7j158lcbaTQ2az01bG+hH75WKAnaVOZuXfBBgHbtn20ltMDWDGu16+NbjDbvtDdFz7I50Cy0LKuSCkuR8v71N7JkyCpk22xoZ6LTZm1b84tThK0x8rMReGSVuUlo3iHOCfdp7n1gvgwdL5ZMQeTJehdC1lRj8YhJtoGtz4lmft1jIW16PPSzxRiRwBubOldDPlf9YwwhuLUZm5oI+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slgDuCtRHbF7w6fcMr+61hgjSVPHDIOqWKxj+3MyuYc=;
 b=JKT0Q+tHKbbZFcmLcyWkSgAEdS1UTACrTqoAGzrra1VwjgKRaN9zFfYOpJHMWyFiCG/nkH2JTKypOjBZv69mpXOIpzu0JSl1PBfZ4HidCsn6fww/+kskCc5UmlGMt8FAhzjxGNJbzrL0bayPSajiLSA1tqAllXyP0Ourx5sntK2UIHMJszoXFAcePizuFKlSY1Ygm8xuKJHxVnVZczl+Eaf1x+wdIo24BiALmm3GuHed+IC8lI+sZe//oO0Nn1AvC/zkwC6WgKLDQkmppFP0dqC3ZmjKx0NrPWVn4yI2I88FN4HZ7K2BE5JvG61XuQt70AUO/s6bLIjZ7YOg5xJ6Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by SJ2PR11MB8402.namprd11.prod.outlook.com (2603:10b6:a03:545::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Thu, 6 Jun
 2024 13:50:05 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%7]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 13:50:05 +0000
Message-ID: <9ec2d27c-9a23-463d-9f30-b90aa0856425@intel.com>
Date: Thu, 6 Jun 2024 19:19:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Ensure caller uses sole domain for
 xe_force_wake_assert_held
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
References: <20240606124133.1353738-1-himal.prasad.ghimiray@intel.com>
 <20240606124133.1353738-2-himal.prasad.ghimiray@intel.com>
 <04a2aea6-9aea-44eb-9619-55bf744df85f@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <04a2aea6-9aea-44eb-9619-55bf744df85f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|SJ2PR11MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5e87a3-e57f-435c-4e0b-08dc862f91f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVMwQWtDRWE4MUNvVFNuREkrVHA0ekVHaUxqbU9jckVndGNYVDJGRFZvNnNR?=
 =?utf-8?B?UEVJbENrSTNrS1NMQ1V2VXh0aEtTbWRYZXBXelFLeEY3Z2dVaW4wVWpFVWsv?=
 =?utf-8?B?MGM4dVFsaUJNQk1FZDVURzlhRDFKcm1EZGdmOXd3MkVrTlphcUlTNitDNjY5?=
 =?utf-8?B?ZlR2d0JLeXIzbWxkZWM3UUl3K3FOYklXVHN4Mm9NK3FiQ3lKZC9ldGk1UlR6?=
 =?utf-8?B?Ym9NMGZJSjMrT1pzS3MyLzhJdjZJR3B3QmFYSGh0Mis0SnYxL2VXMDRIbUxs?=
 =?utf-8?B?WEtkc3U4bitRM05SbnBuZnliTThGZW5jb1ErcjdpUGlIN2RRQUhtWXR4UDl2?=
 =?utf-8?B?YkdkS1JkZ2IwbkE2NTNhZERHQnpSMTlFeUthQkNreVMveUFNVlllbXBjdTZu?=
 =?utf-8?B?RjVSQVF0VUhCQW8zejR1aitaVXQxbmpVSHdxM1FBcGlFQXc1VFBUbmNYTWlm?=
 =?utf-8?B?N0dvTmdnWjMrbTZuWGUyZ3N4MCt4bm1JUkxLSVhCYjg4ZHpwTEE5bWdkUkVI?=
 =?utf-8?B?ZUZhaGxaU1EwRVBlQnV6aEJzR0VTMlhNMHpycDVRZUNEODNEV2VjV1VXa3Yz?=
 =?utf-8?B?ZFJpWlprMjFNR3JqNHFVNjFnSzk2K0tjaFRtNVZYbmJRencrcVBpeDJJeXpw?=
 =?utf-8?B?bUJSQmxUbnVKZWJwSzdJa28rTDNmcThxcExjOVRNWjlndTB5aUZRek0zQTRS?=
 =?utf-8?B?bVlMTk53U3VSMnJXVU93QkxuTlRldXpWQm5LekMrbXZWQjQ4R3A2ZFJKMmQ5?=
 =?utf-8?B?bGNFZWV1S3lxMGdhcEhSTU1CRXF4K0F6S3YrbzFlNFdZdmRJRm44TUozdXYr?=
 =?utf-8?B?RlMvaVZxekVlT2VvbCswNWF0SmFONkVVV1lDZFFBZ0hqMGN6dmhjSFFnUzA1?=
 =?utf-8?B?amNlaTJOSURXVUZra1BZTUh5SWZRL1Q1cWJ2S3ZPblhzc1RLWUhEa2xST2xa?=
 =?utf-8?B?Mis3bUtvMVZaNVovR0RSUVdMeEZlc2dOSkJGa3JrVW0zOCs5TGpoMUxMNHpJ?=
 =?utf-8?B?S1lFb28xeEJQQkwvdjhXR1UwMjRCNC9QcHoyekFMeGJucTJjL3RmZFprdUNi?=
 =?utf-8?B?dmd6VG5rTjg2bGUxNmxxZ080VWh2bU5nOXM1YUZYK2dlSkxQY3JRM3NJdmVp?=
 =?utf-8?B?bUYzWStsTEsrcHZTN1B5WC8zbUt3WGsyM1NFZnhaOHlvTVJVZzFHTFU4TzlV?=
 =?utf-8?B?Y2Jzc3ppOTh3dG9HVjBPZUU5blpGUit0bUlydzFVYUhZemgvcGVxaEowSVF4?=
 =?utf-8?B?RTVUajhNUkxyODhXN003ME5wSTB0QktuTjVTRDlDem1mRVh6OE42MTh3b0Z3?=
 =?utf-8?B?UGwxbUo5dmFSQWUxQ2dlQWJ5RWtWTE16SzlBN2dMNncrZGhPYVJwaTNLMGlv?=
 =?utf-8?B?NmpVTG43UHNpNzFJYjQvVzV0M2dyaVB6NFdWMEk4YnRrYVRsaWJHSXdaaXk5?=
 =?utf-8?B?dFFpTjZDSk9zZjl0bldjZ0sxRHN2UWFlRlFZL050OXp1VmlqbmNjVUQ3dkMv?=
 =?utf-8?B?d2JIeG9rbDVkY3lHS2IzMUg3UXZscWJYR0U4MFVGbmU4eGpTL1JUaVZDaWtk?=
 =?utf-8?B?QmpPc2Z4TW5qUGNKc3BNK1Y0SU43a2Zmdkt3MkZEcjBkUmxFNjZNOU9yK0g1?=
 =?utf-8?B?bTZMNUhUOUJURWVERHh0THNMQi8yZmdnY2lEc3lWdHAySW5sTzgzNWdLZzVt?=
 =?utf-8?B?WENYZnA2cHc2eisrbFJvaFBEdFliWXZNbmFmRXRtcy95Z1RkejMxMk5BUHA3?=
 =?utf-8?Q?Q722VSs0E1J5MXLG8itveoe23m864duAv9EXLNE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yms2MVUyOVkzRHN0c084UExQM3c2NSt4RW40RWlaa3pCdVFDbDY2OStDLzlS?=
 =?utf-8?B?cmYvRFlrMXRaUjl5dXRHZzdwaXhxUzdscXU5djdDN3d3KzJBbjR4MGJwaGk4?=
 =?utf-8?B?TG8vNS9Oem56V21jWElvRG53eFhxSVovcE44NGhvZnRjVG85MFFVQVhWQVJz?=
 =?utf-8?B?dXJ4cEFFemR2b0M2Wi9xaGFZRHpXRkgrVjJUdS9YYVhFNk03Uzc1MUFtQUk3?=
 =?utf-8?B?a2trSXpFSWZHOTZjKzNNcHpZTTlTZXU2alJSa0ZwamdqbWdKdjNqNndhNUxR?=
 =?utf-8?B?TnlJUEJjbEZ6YVhVYVpaVnVDQUFRSEdGQzJnbzk0SnVzU1k0aUhzUXhsd3Zo?=
 =?utf-8?B?VXY1ejV0eU90cFF4a2VaVnZuT1JvYXdBOHlsa1daeFdjc3ZMek1MZmd1Y3la?=
 =?utf-8?B?bWc3THE0U3ZJL1Yxb0k2MjdmMU1WNjI5SXBvWjQ0N3cxTWd1Y3EvOWJsV0xv?=
 =?utf-8?B?UUJTUDY1dTNrY1FQTDVsR1RWclo2ZGh6bmxXUk1sRmdldlpFbHR4dzRhbko0?=
 =?utf-8?B?TkhDUU1KbnZ5L1Y1ekd5WGJ5eUFYTUFiRFJZTEF0cVZlUlcvSGR3YXp0MlZw?=
 =?utf-8?B?d3V5NGNrZzRPRGNhbWtNazhERnlPdUYvaWNwakE0WWZnd2ZoSUNkTk5ZOUVP?=
 =?utf-8?B?Q2ROUTFRM2Fwb2E5L2pseDVkTm9zL0NaZ0t3TWVwQ3VRbVZIVW1WOUhUQlV2?=
 =?utf-8?B?L2VLcEIxRjFVaXRSNU5GTW5xYlo3K3NsRE9hQlpZVjZFWWtqLzI0d1kvTGhY?=
 =?utf-8?B?Y29lQVp5cUZFaWlXVEg1WERpd3Y2bVJEZWZnZ09xZDJYQktObXdMQm93QUdq?=
 =?utf-8?B?RXo4SjNVcGZ1bWErcFhJMHY1SndHRHJLaWF0MmFqSnpXNHliMHVTNGMwaldk?=
 =?utf-8?B?UWRIZlluV0J6dmVCQlF5a01SdXhOc3J0bTBqYU5idXNBbFVzem5ZVXFsQ1dV?=
 =?utf-8?B?UUpRanI4UUhtNkZlSmhsMkE2b2x5Y05sNUFZYTRSZTRrczg4SGEwbU9yU0RE?=
 =?utf-8?B?VU9iMllPWTNJSjdTUE1Zc1FwZWdVUHRjazFhcldLNUs0aEs2MVhDMWlDMVdN?=
 =?utf-8?B?Wk0zTC9rRXRSVGRQbFVIWVFUNkp3ZFpjbm9FNDhVMzc0UEgxTE15azJJWlZ1?=
 =?utf-8?B?RnozL3E1TXdkL3hIQUVKT2p5bmh5bUcwb0oxaGNDQ2RuaE5RNkNERzFnNEVW?=
 =?utf-8?B?YXVNTzBWbFRzM0xpUWdwdTJzZHpKTERKOFRocFNVQWJkcFVNcGJheEtSTks3?=
 =?utf-8?B?bWlZTHZlNzlhTnJzcVAzUHhEcGt4VVU3emh3UDhXYnpyYWtISkIyTUV6b0kz?=
 =?utf-8?B?dm51RFFzZ3FHUE5DWlcwZWpkZE1mem02cXR1N040ZTNHWk1UTldGMG81RFBo?=
 =?utf-8?B?OHMyOEVLckZwWU8zclhXMEZHc1JINng5Z3A1c1c3eTZsSzlKaTBLcGZ3aVQv?=
 =?utf-8?B?OS9jK1RLcFdsaDZIZ21GQTBzd3dFNlhwd1VsWWdwMkVkaFRZN1hHVmxwOTYy?=
 =?utf-8?B?OU5YUzAybzJXRkNqcmEwWTNMOXNVZmduYVlEQ0dsd1E3RU50dHArVW9vVXZh?=
 =?utf-8?B?RWNJR08rZHE5STFUVUxlc242aG9zOWh6dDl5bVZtYWJUTENWbGJLU01HcnZh?=
 =?utf-8?B?Tlp4cGh5anl4R1l5eUp5c2ZhTXBzSGpDWWFaNHIwMjZJNXBtSVNPWnhkWUto?=
 =?utf-8?B?dkJWU2RGSjd1MHdDZXFTK3VXZDFmZkk1T0ViTTcvTXNYejZrQnhUU0k0SDVJ?=
 =?utf-8?B?TGJPNDZKdWwxZDFFSHhyYWhiTFJKb21tVmVvZnVrNlp3RnZJaE4xL0Z6bTdX?=
 =?utf-8?B?VzZjMkJnK2JKWGpES3UwL2FieWFqeEpxYk1qVThUTkprbXhYRmFaYm5zOE15?=
 =?utf-8?B?SG1LTEVSUWlScDFNODVncTBKbjZqR3BTSHVGbVdVc2RRZTJwMHhRWHYzVW9Q?=
 =?utf-8?B?SlJrSGJvLytCY3dHcWs4Ni9HQmY5cEtLbURuckszMzJ1ekRsYnJUUjcxQXJu?=
 =?utf-8?B?RXpMeUFha2V3WmVKWjJUYk5LMXBjaEthaWQyRS9ZZ1Q0Z2gxYUNmeU1xNmJY?=
 =?utf-8?B?akxGZ3ZoZkhRaUVQQW1QZlZ5ZkpzWlU2Rm5CWVZYeU1CenN0SEhKVFJjRjVP?=
 =?utf-8?B?VHFjQXQvT09mRW44dFhZMVhJZEEvdllIeGJqQktLYk56VWFuNGtvSDNSWWFH?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5e87a3-e57f-435c-4e0b-08dc862f91f7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 13:50:05.3820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOYXzomGyBMxkgUL6tTeQ+HXeh8chJBD2o/wTSUDwXMbHKMnd7PZ2Cy0HuVelZR2BFFtr/ZNzy3uV6hcOeSIfMU3smUV/dcE3nbJz4a5jJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8402
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



On 06-06-2024 18:19, Michal Wajdeczko wrote:
> 
> 
> On 06.06.2024 14:41, Himal Prasad Ghimiray wrote:
>> xe_force_wake_assert_held() is designed to confirm a particular
>> forcewake domain's wakefulness; it doesn't verify the wakefulness of
>> multiple domains. Make sure the caller doesn't input multiple domains as
>> a parameter, this will ensure caller doesn't use xe_force_wake_assert_held
>> with XE_FORCEWAKE_ALL parameter.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index 83cb157da7cc..cee8ff039f83 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -32,6 +32,9 @@ static inline void
>>   xe_force_wake_assert_held(struct xe_force_wake *fw,
>>   			  enum xe_force_wake_domains domain)
>>   {
>> +	/* Ensure caller is not passing multiple domains */
>> +	xe_gt_assert(fw->gt, !(domain & (domain - 1)));
> 
> as all enumerators but XE_FORCEWAKE_ALL are defined as BIT then maybe it
> is sufficient to just use clear to understand:

Hmm. With the understanding the caller will not pass any random int 
value checking XE_FORCEWAKE_ALL should be enough.


> 
> 	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);
> 
>> +
>>   	xe_gt_assert(fw->gt, fw->awake_domains & domain);
>>   }
>>   
