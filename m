Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B0ACE8D52
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 07:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D6510E29F;
	Thu, 19 Sep 2024 07:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzPnjGa6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC36D10E29F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 07:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726731554; x=1758267554;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hNcwdGmyL+s0NB21jm2655TIoivHPUBGxxwRQvhlxvg=;
 b=nzPnjGa6swLhzL3gPTdVp4Lk9IkfC1/Bznbff9xDz4d5sTBvGSNOK8jT
 hqq3Gz3fuZi4r16is+i6RTpsqm5vYBZol/B0Q7qgpapzGvLqbzpDbUQIf
 go+q2M0i43n4UgzqZ2Sa+jZ54jSLozCXOYalMuoMX5IDkWj1GUxJLIKDS
 +Gn+Sn9U7vq44paxwNTTEtJWjipxhXBP8PRfeNYtQwmI5Ftwa2AMoAVLJ
 tx8Axp4cNBizcuRvBjACxWrHb8dAVn3JJ8m/FkMCriiNTY17DqRuejFT7
 JR9lXp7gq0tyc5yd0QkCbv0qKTDj0m7WS3a2tCE7EqQbaHKk4Y+HYH7jF w==;
X-CSE-ConnectionGUID: 0UVkRaSRS/KOCtd0iN8nSg==
X-CSE-MsgGUID: PMJ9YmEeT7e6XpWhne5/uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29573666"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="29573666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 00:39:14 -0700
X-CSE-ConnectionGUID: fQXenvxfRWqjusohBz/YHQ==
X-CSE-MsgGUID: zFE2qVwKTEuzP5SGg4Bt4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="100659510"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 00:39:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 00:39:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 00:39:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 00:39:13 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 00:39:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W40F+kGI7nN+mqCQjzqUceP6V3b4Pfk1rADyLWfctIU8LfBsitjAZ+xjXx9fN45qHc8lVT0aPxdGyegU4oFM4soN2UiL9ndMpbQuiGo57na1by+qxH9rQXPXkkFBhflaPiYzgDbHgj3D8gZQJ02dwyoXFBIgKcJ25q2yIcPqTrmxpCmUP5OxJr3fINk3hyz2LwwN9+hOJrRXiRWIdokCUjsScN5qU4kk8h7MvUFSsGbrZUqUmubucPAnrcATG14tVpaOi3ZzdK9fuKAmGLlfj7VYS8nWTSzad+TIQlUK6qPepJ1pQifGuZm/Dc0oXdVPUTscfUvloQOi3hB2vcm4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJPhVtWTfoyJyV+zkV7X1IBxO4Dqu7ZNmZknzCAugC8=;
 b=UtAdRaafwmi+wcJ4DfEauOHsmBxKFbi6SQsgJLF7tnKZbrIYO6wfS7KQScuvIup49LXV1sN75XCcFRkpOOZrOWg/aSuRsjzGL2DxmYRGKT1vzdXqt910cc4yZT+MDaHjsxw1wqW8BUnbEexNaUgwoN+qHqa0Rm+LILf6oBP8ubi73g1SxLSsnuRNFYS/bYGOWJa7Z7USmqZwApJ6p2ZjFhhvB+XvIMmXoI/wRp5oWgmp7PKllr4K62XiWp4CHpaEJRJ017ObQwl4nwyOIeZYFVdhQe+kWpkKTNKZw6w1wbBbcry5Iph1EqSjdfpQlGu98GPA0T9EZ2/8l5PbYZCVQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by LV8PR11MB8581.namprd11.prod.outlook.com (2603:10b6:408:1e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 07:39:10 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%7]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 07:39:10 +0000
Message-ID: <65167663-8d0e-4b6a-94c9-5480fb400761@intel.com>
Date: Thu, 19 Sep 2024 13:09:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, <sai.teja.pottumuttu@intel.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
 <20240918204830.49880-4-gustavo.sousa@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20240918204830.49880-4-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::15) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|LV8PR11MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: f456d68b-f92c-4c84-acf0-08dcd87e2643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3h5QllwNzYyQm5mbStjUVRGYmRsWDZadGI4RUVCUW50TGI0TnJGZlZyQlIw?=
 =?utf-8?B?d29BckNaRE82Q1RXYXZvT005eHVHSXdjaHBjZHh4TzNVYVRkbVBJbFBCQytS?=
 =?utf-8?B?SnNJWE5TVGY4YkRuMkpZWGtDTnFSeElpbW1xYU5CejVNWXZwbzZ1b1Y5UTNL?=
 =?utf-8?B?SCtYdUJDZ0ZleDBxakQrRW95R2syZGF1aCtJZmhVMXh0VjB3NjFCSmFhQ2pR?=
 =?utf-8?B?a2JGMnByNGlmbnBXQVdvSmRSNUlqQlMySWZKSkt4RjIvUEdPV1krdXRrb01H?=
 =?utf-8?B?SnBXRmg5R0xmNnJ3NEtYaTFiYjh0RnZGYVltbWhRRTFzUk00d0NxcjY2Lzli?=
 =?utf-8?B?WXlVc1ROYjRWdU8yL2ZIK1N2bUdUcGMvYkVxR2lhUlpHTXZqRWRUMCtaRGxL?=
 =?utf-8?B?aXRqUFQ0RTJoMk02R2hUZXNEbXNCY1kyMFk2Mm9MSFdaRTZ3ZmNSRkowc3VC?=
 =?utf-8?B?ZHhzQWhweUJPdnp4a0ErYW1BeVF2d3ZMdG1odUFuSHltS1d1eEtJK1gxZVpP?=
 =?utf-8?B?cnZLZjVQa0J1OHdQSTZTOGo2aVhVYVB5YnJ1ZkdJUlVVeldCU3lZVjdRSWt6?=
 =?utf-8?B?WFd3R1ZXUG9kRXF3Vm5zbUNsQzdoaUtwajQ5dDBSMENERk5UMDJLSllvMUh3?=
 =?utf-8?B?NUpFTkFqNWYwS3JmVU0xaWlFYTIzdDREeEVXa3I4VG1Ga1IxUEswa05ScFpn?=
 =?utf-8?B?NVduYjltMVJlWVRKMTRCWDAwdDFmRzZpd2d3QWF1bjRuaXJaY0ZZNmlMb0dM?=
 =?utf-8?B?RXFiNFlxZGNheGtkblhVRHpEeTBZU2MxZFQ4S2NackpMcHJZaTF5YkRPVzcw?=
 =?utf-8?B?cXRRZzhkQjAxKzZ0VmZNNXE0cGVzd3QxVFZhT0xieVRvNFhqd2ZDeUZjZzFV?=
 =?utf-8?B?UEpMRmQ2bEZpQmVYSG8zUDFYZEl6ZVg2REpUYStyUjc4MmtpdytpQlBrQTV5?=
 =?utf-8?B?V0hQc09JWHMrNllMZmhXUE5pNEtLdGdVNEtRSUxkQWNsVlU4ZFFnclBDWngy?=
 =?utf-8?B?SHVrL3dqRGdOcm0xYWM1R21oVUplZWJBMzRkOWo5QUNZd0hyREVwVHRncnps?=
 =?utf-8?B?WmVQa2VyUmRlcEZiQUtMbElJK2VzTFYzUG1pMFBqNFJaSlRwaEk4N2ZuN05H?=
 =?utf-8?B?ck01cHNyVklBZGdHaXZVc0dwOFRxQTdXbVhERXR6bTBDRHRYbTFJQlFzVFhq?=
 =?utf-8?B?dXM1UGs2c1JSbjg4QmZUb1BFWGM1SVlhNSsvWmtJaHhpdVlGaG4reXRaSks2?=
 =?utf-8?B?SnptNys5TWpLQUY1cWFGZWdPai9GdmZiTnFEMDVaYU9CM1FuaXNiVVZic0Fh?=
 =?utf-8?B?ZFhHK25DZjdWeVN0Sm5aTjRxamttMEQ3UEVpZTNoL0J3dG41OGtuQXB0MDdN?=
 =?utf-8?B?WmlmdnFoeVFRRDk3RmJ0bnhYMlI2NUR6eTFYdjZUZnVIZWdFb0YxdDlMdktD?=
 =?utf-8?B?M1crejVIbC8xTGF6Ump5SUp1cWUyRm51ZXdXaUFod1NxVzU1N082VFV5RmFM?=
 =?utf-8?B?Q2QrWGladFpwZ3RMSC9GRTBDRVlOU2NBM0FiRnR2MlpzeGpFOWM0NVdjUS9S?=
 =?utf-8?B?ZXhPa1Nuamo2eVRlNjdPY2VXTnZkQnkvck5lcUh6SDY1T0R4NDQ2ZENRSHFo?=
 =?utf-8?B?MktrMXhYeHJWWlgwbFN2OWZDU0R0TWo0MnNtbUtieUZlSEh5N1JNUnJRaDdH?=
 =?utf-8?B?RlVSWGpidnh6ck5lSjhnM0NuaUt4MzgrcTVFbXRMRmFnaVZQc1ErQ0FWeHdD?=
 =?utf-8?B?NEdUdnNXdU0xKyszbXhPYnk2eTNPODhkbURVanNldDNLeEdHQ2QxU3dFOTh4?=
 =?utf-8?B?cFJ6aVMyOEw0STBkUVBidz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnV2cHNYNHBPc3FQdWtXd2htRFpNcE9ONUF4VjJFWjNHVmVUSEN2Q0Y4NTJz?=
 =?utf-8?B?THlNRVFDK3VYZjhYcURETVZnSXA5aUhRTVN6UDZ5QUtpVFN2dy9EVjkrWlor?=
 =?utf-8?B?ZGhvUlVHRldaemJWMXpXdjZ2RzBKMnVnaFN6a2dWeGhnMmNFOWZabEV6RjVq?=
 =?utf-8?B?UmU2MDQ1dERvMDlLNUhIa2VETkg0VkI1UEpMRmVNdlJibjc2bzk5MlBMN2F1?=
 =?utf-8?B?emFuTXNac2hjVWpjNUZBbTlWdmpvWjFySExCa2hmRjFFWFBGKzdJZ25yQlFU?=
 =?utf-8?B?ZytTOEFkOHI4UG90aERZanljUHd4TmlvbEFvaFVqL2JCQzhjSks1QTFWa3Uw?=
 =?utf-8?B?QjZibTEycldJTndZcnd4TWpqZ083VXd3c1BHQWdVZUlCT1lQaE1venZOWEF2?=
 =?utf-8?B?U1ZQL2w1aVJ6cE1BT2JkNUxDR3kzSmVYR0sxcTF6TmlNTEt5dDFOcTM5YkQ2?=
 =?utf-8?B?VklLUkhVRFVpb1ZDcXhSdlZ0aTVlTDNCSUEwN2Q1dnBIVldLTHBjSFF6clh6?=
 =?utf-8?B?czk4NkZnbTFsVW9xL1V1Z3VsVDBjbFE1YXBrRi91eit5aTlSSDBpc3JFZzBj?=
 =?utf-8?B?Z0ZzVE5Xekh0UEk0amZoU0dzME1RVC9WYWgzZWcrRXVyVFF3RWd1SDNxNWp0?=
 =?utf-8?B?dlR3SU43YWM3N2pnMjc2K1V4ZW00R05yaTdkWHlqcDdXQU5sMFUrcGJ5eUtK?=
 =?utf-8?B?RnNnTi9ldGtRTlFTSDVUeGw3ZGtZOGZRY0wzTWZ0SU9ndmN5QUVaa25wa0RQ?=
 =?utf-8?B?UVVQajJKQXNua3d6dFdpWjlLcU5SSkpSeUJOYit3WjBrZncvTURma2kyNkYr?=
 =?utf-8?B?Q2tsVjN4OVZTWGlOZ0RpT2FyTEErbmd0MndqRXQrbTNsYWk1MFJKQnpMRjJV?=
 =?utf-8?B?S0dzS25DMFpMa3NaUDRjZXBZNy9jS0JEN0ducW5FQndiWWFPcDNUMUJ3a0xa?=
 =?utf-8?B?WWQ4NnorU0lUUjh5NnJuTTZ2QnlPcEpqbHA2MmxSaXNqbCt6VFVuSXJRdUNZ?=
 =?utf-8?B?V3E1V2VVUGV1UEhvMkM4UU14WkRDK2xmajAxTk9Sdk82N00zQk1QMnhJKzY0?=
 =?utf-8?B?QnlZY0V2K0dwNm5jWFZNcG44aXJMNWMzUkplSXkxMHNqTjdmOXNFQWx3aURq?=
 =?utf-8?B?djhoRDFGRzZJM2ZCVUd4TG80VmMxemRYbUFEWDRzMDFsbUdlbHdsOVNJMVV2?=
 =?utf-8?B?K0NyNzVQdDJldzZVUXpXWHo4Z01Hci9KYmIrdklIWVJJRTkzSHF6OHMvN2RL?=
 =?utf-8?B?V05DRUZyakF1cHFWM0V2NHpjUTdrM3JkZTN5TzR0OG5sR3VwKzVSeTVGWDlM?=
 =?utf-8?B?QnF6ek54NWp3cDdaQ2cyNkUyUnUwTjZETDltdXZpYk9zbWplSnVFNkVOWThl?=
 =?utf-8?B?Y3ViWi8zR0ljc0xwTGlOblFrV1pramp1SU1PMk1VQWtEbEQxZ1JPMytBMVFw?=
 =?utf-8?B?SDhtU0ttakx6bVBrNVJnMlpaNnZ2bmlHcFJFZ1F5ZmQ2VVRMU0NFcXM3SlJj?=
 =?utf-8?B?aTEwa2tPU1MxRGU5K3U1bURDdURlS1dJdmgyL0hPK250OGNuTFVyaTVrWmgv?=
 =?utf-8?B?WkdTWHVKcUU3b1BjdlhiSXZUODFaajV5U0tldFpzKzMvbWg2WEJieUxvaEVE?=
 =?utf-8?B?TS9ZRXlyZGg1MkovMXBNamZJd2swVk9KaHlSaVl4djhEYUJzc0o1K0hrbzNW?=
 =?utf-8?B?TTgxOGp5aHVMY0h4cGMwNlJPbWhCVVo4ell2ek41UnNYYW5QZkhjWmpBUU1t?=
 =?utf-8?B?R0duUEtielpHUE81bjkreXpobG1DMWxhS1FYb2I4cmtYMmVuZU9RdURkWHlI?=
 =?utf-8?B?V25kbEJOdDlnQTZUOWxqSjg2UENCM3plM1BrZVVaNXNhRGZMZGovT1FwTVpC?=
 =?utf-8?B?MUxlQStBWFVTbURjbXYxaUdndFJTbG5uaUc2TXBWNGQ3d2hTbnVhWnB0VFJB?=
 =?utf-8?B?Q3VtWGF3VmE3b3JxTGZ2RFZPNm0vV1YvWDAyMXRpNmJjdm1hVExxcGlIcVVZ?=
 =?utf-8?B?Vk5pNTBHdE92NTVBRmZqUTAyanphbDVNclFhSEgxVGZEcU1WOVNHMVFweWEz?=
 =?utf-8?B?c0ZZb3dwMjZBN3JSQUVBSXNnSnI4T2V3RFFEVHA1ajhVT2M0OHFxS3QvZ3I0?=
 =?utf-8?B?SmZPN0crTFdnSnlxS210WlllMENWSytNSDN3bU9DczlHdUxvTjhpRk9hT0lW?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f456d68b-f92c-4c84-acf0-08dcd87e2643
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 07:39:10.2989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuI/3ojDJh+C1hetW4no+AEsXMlssCRSU6ShAKFtsBneCJEsml8OOuIKkK1cfa3Rdiui2D63ShYcBnjVAA+KtV4oI1+PItXnrI7ZLGHAkOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8581
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


On 19-09-2024 02:17, Gustavo Sousa wrote:
> A recommended performance tuning for LNL related to L3 cache flushing
> was recently introduced in Bspec. Implement it.
>
> Bspec: 70821

The correct BSpec should be 72161 I guess.

> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
>   drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
>   2 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 6ec2d2c11d77..ccd18cdd5b50 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -389,6 +389,9 @@
>   #define L3SQCREG3				XE_REG_MCR(0xb108)
>   #define   COMPPWOVERFETCHEN			REG_BIT(28)
>   
> +#define SCRATCH3LBCF				XE_REG_MCR(0xb154)
> +#define   RWFLUSHALLEN				REG_BIT(17)
> +
>   #define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
>   #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>   
> @@ -406,6 +409,8 @@
>   
>   #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
>   
> +#define XE2LPM_SCRATCH3LBCF			XE_REG_MCR(0xb654)

Just a general question, the register might exist on other platforms as 
well right, so,

would it be a good idea to call it SCRATCH3LBCF_MEDIA instead?

> +
>   #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>   
>   #define XE2_TDF_CTRL				XE_REG(0xb418)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index f62622f0be85..4dd77b44ac82 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -80,6 +80,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>   	  XE_RTP_ACTIONS(FIELD_SET(XELPMP_STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
>   				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>   	},
> +	{ XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(SCRATCH3, RWFLUSHALLEN))

The register should be SCRATCH3LBCF

Thank You

- Sai Teja

> +	},
> +	{ XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3LBCF, RWFLUSHALLEN))
> +	},
>   	{}
>   };
>   
