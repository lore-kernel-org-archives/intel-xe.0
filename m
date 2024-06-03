Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83A3C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 19:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3485C10E3D4;
	Mon,  3 Jun 2024 19:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="az2dnNm0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2694D10E3D2
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 19:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717443589; x=1748979589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d4O0SFDwJSO+XIZYQf2gHztxoyP5p2HXiFwo4zWh1IY=;
 b=az2dnNm0bq5s/TZ0a+Qrnf2bDBZ4ZVdGEhQqGxuyN8nNXjHETiiVEtva
 7Id6iM6nRDZIWuLXgosHlPsO1spJU4WGRQa5vibuMYG99q3VBDE9OPjNE
 7VA1/opSr13PkqGugFCG/diRQmpkmcyiCN+B3ZTOHD3wNPJcapRsQFUiW
 +MjVF1PWXF6j4zq+FPRc8m6rxAVQm3tvBxKd+PvfUmpt/9FWbsry2Z4z+
 duun1pfBwpt0dB9sxNkrVGVVEeCYyaMfb/ujMt/iwvxvKbKZXNoWUst/l
 qdZMldzyWQhEADfTFMIi69J67M1pvLi2FIhzGJfmFufExdrXPGfOgImxa w==;
X-CSE-ConnectionGUID: GshGXYNvQoSstQQPy1Yp2g==
X-CSE-MsgGUID: YTkzVy8iQwGnzqjfuTLkVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14142352"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="14142352"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:39:48 -0700
X-CSE-ConnectionGUID: BpZ9AzUMSJiInSYd3nCtMw==
X-CSE-MsgGUID: M7TLhFxBRfWRrTc7uGZ83A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="60159782"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 12:39:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 12:39:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 12:39:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 12:39:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7BIi3/X5Bdsb6QVgysXiofMDhb9QT3lJH2QSo+HJjE/F7FLPWKb512UFxJXGyGVKU9AGdxg4W/ZxgO8QqylnxSCfWn5bOTAucJJRMTORe0zhHIEfv2JDpL4qqNFBHWoA+5+bxVPZfzR6LiyE3DKIvym2lZwKGef5WmlE4Hnk9RgN8LhjmN7HUREFqSeRr9zIJvT7tpqO+a14eNW2DpxhTWQB86LWEBy/RqzxHtwGyAWN6SH0amIitflCIvexepO3fOdfo/iG51QAcnZ1bAEJNyDl9ITPs7Rzy6ReyUwACoOpq6lAMkzmuTXaJqdKuqt14sxQPXoaregBY/2snStEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7j00zsIWqqYm9vyhTDJqz8PW0dOussAl2/2COsplvM=;
 b=O1I6yJwR4Qq3EpRfi0sn/rN7LG1Lo+96GkXFWappvXKkY7b7FXP6iSaXIky+cfCYymv/TiwvL+P5dykhuWNbTG635glrIgjZE/pRUfDojmyiyMMHr3qUurpxWBtkEKmE4qPPrISyNr/xTrglh4EHbamTBKV9mQ0KvqEZNoJoz8sxBDIH3cmWUBDm1LystvG5Y2WXfzTuzw9gSTrYYCtGzQc60I8DxICY4C6B0hT96HPVif9AZnzHIgPUAhFbFbrEmsAb2Pw0iL+rfVuKySaz3D8qwDMz52fAvzh32Ul/KMfEeSaiOGhstDg5MyKN9Vtd7HTPxD5eFFDJhd41a8eXCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 19:39:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 19:39:44 +0000
Date: Mon, 3 Jun 2024 14:39:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Always check force_wake_get return code
Message-ID: <jk5k3x7kcxyu2zg6vcefmata7seyfg5zocr3jlk2c4d3v45ixw@pesc5prqes3t>
References: <20240603113005.710746-1-tejas.upadhyay@intel.com>
 <92e54e93-dbb8-4dd8-8257-58dd8c87ff7c@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <92e54e93-dbb8-4dd8-8257-58dd8c87ff7c@intel.com>
X-ClientProxiedBy: MW4PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:303:8d::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 29116b39-5147-4e18-aaa2-08dc8404eb0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e64y2vP4ZxTQaOnJ9F4rupxFNF3aToMPXwZftabOL6Wh18IV7gd7bzgdSPuJ?=
 =?us-ascii?Q?NNH3XXzr5xdfhee1/eRfpgHYUcZ8zZJ/WaRyJcCTqvk3UJpFTGg1nhpwc1C0?=
 =?us-ascii?Q?NF0qdCIcORnwG7BXOdxlxQp3Oop7YJ27tUBGqucksxt+ondNzuxnA1zfpAWF?=
 =?us-ascii?Q?dt8K1w7/gT7WVSbtgxoDlGTq/svY7JpJZEBPmITP9GcgoStPAxVvUMY2cR9e?=
 =?us-ascii?Q?Zs1z63HO4vvqmbUlgaxaZZZ5OR+4lCg+eAu/Hrf8Dbm4aDY8rZL6rMaIAMUc?=
 =?us-ascii?Q?1/vF0UfMaYnirHrunhM4gR4XGG3lHYml2DxtSv1q+yo++BObyXcN+TUymPoZ?=
 =?us-ascii?Q?Usi6IdZFZKWfxfzy6q4QNEQNFgLcRlB55wkwcTKg0G8escSWpJaPpNEnJWmZ?=
 =?us-ascii?Q?s96XLaR4e3F3e2cSNaLhIKDMN2RXuGzFiX5e8aEX2ArVjO7I3Iv0b0JBeMUu?=
 =?us-ascii?Q?l5C6NcWWKYzKgxIlIo9AHNEk6ClbkYh8gyBBC+qpKmu6R3460ekxZ57Vrwd1?=
 =?us-ascii?Q?/2p2V5pt26K3VQ2YML/hEj6jRYZRjmHVrcQrC+oRokzud7/rieuX8jQHR5Cu?=
 =?us-ascii?Q?v6gde37oAD7W9glJhxxJEnjG7ZXYMvzz0Ef3ToKxxpH6fLTjmAG/zmV1FU9H?=
 =?us-ascii?Q?MNuZgfVzltK6daMrwTEFjBOs3ZE85bFkhvRxWXuRWfBtIGdRBjrpCZb9YwXw?=
 =?us-ascii?Q?paDSx9vCeX6z4yFf8EOvkQdERD/dHOQ5YwlqRSYgrr97PxxZQoBtLer2PBkZ?=
 =?us-ascii?Q?+iQDKKcHONQglq4iIrSQwyYbT8qC5/9Jpk6P7SPVFELWzSuexxAh5DJAAh6D?=
 =?us-ascii?Q?Qf7NeOSv8yDT6iPQHxEUkj6e1iItOW2sIh0htAxqQlWji6Lf51zDeMXkbx9J?=
 =?us-ascii?Q?D1mnl8hwNA1ceP17XkTXQ8v19WMBFpMes8B1cq1AH3CvRNrFeiy/EdyGMHGe?=
 =?us-ascii?Q?G5P8bGLNb9mifm9g3F/ucsQpPaZH6LlcRv6Cjzj7R/I6yOL9yW7Uz/3gZ2TP?=
 =?us-ascii?Q?FxdOelYc13WMqGG8v0aA+KOx/ROM07jdUAbJMEHXvjwPgXxTSKErFBWEa7Dr?=
 =?us-ascii?Q?b/GCmWRJDNYe4f/o9YG/iZt11/DMY+XH/I+kyZ+zV/8x3DyOP7cjUKL7UZtM?=
 =?us-ascii?Q?KnTY7zb7uz6M3um3Ofn/dseW3LoU6TQJoqtxqUq9J9lv4k0CrzdpkatSXqVU?=
 =?us-ascii?Q?MueODNUHNQw2jTM8C2Dtlos/dzgvb9S+bPK3fMsmh03OYYZAGbjG/ldoobwd?=
 =?us-ascii?Q?vryZc8qJQ4v/kETZika6t8YDjrHWg1pAulzeCb2l7Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rz5CKXHpxsTGDfdQLRV1eDfMthRmN/ljWsYr9HaRHELHav8QSclx4LQHPmJC?=
 =?us-ascii?Q?cIQ+wULcN4OszIOakU5p7Ju96jmgy5N0oqz39UULxg2NEL16T1MfIrtEbjgw?=
 =?us-ascii?Q?lrLKlx0QHFXdExYkd0Ic7J6dta5Byn3lI0UiEu4MWL3YbK+by8ZbfcWJRaG4?=
 =?us-ascii?Q?vUdEpJI9M2KrwSnZ7cKeUWUZfyu9ibHAQjaOvpEI0ykM2qpYBc0MT0LhVlLM?=
 =?us-ascii?Q?YEuPih6XVU3bo4n0c9UB/nSARrpLDGipDZkoLDlIRRTOVPCUVJduJqiiyMdL?=
 =?us-ascii?Q?01Qdv27ZnyH1M0G5lBNV2yD4GBFLWmmtf28Yi7CXq14tX1jrAkSjUzZLBTBQ?=
 =?us-ascii?Q?NgUS1bM23GzQdT1BOgvULyCyooGUWt4r1WieoAO7VFw4HIewCrxv1QcOAUN9?=
 =?us-ascii?Q?wp8ZluT+g5e7qeBefhZRYcwhRVLl5zHV+4UADe6Gjm0+/l2Eiss6geEhbh0b?=
 =?us-ascii?Q?AvYCnqDb7joftOKcVrn3w4iOtQeZxvdrBLuV5L/WzpsAs3SwqxxWP2VaOu9p?=
 =?us-ascii?Q?M4wN8KVfJwwVJhmG8TzGuQpMz1orkHYC2+Ickr1lq1l5DSw/ZPqGdDDTiTfc?=
 =?us-ascii?Q?tfhkY25olMKBnHuCd6worBeoO2THBnA7Umez1HDnXOljdA8yjruZZye8rFqN?=
 =?us-ascii?Q?io++iK6YOBshQHouySRG2Rvplml/9zQPWuOC63Ey5AOvFWEqBVh8MfzbtNCw?=
 =?us-ascii?Q?sPPBXIhkMC2/3We0z9adL5THrSz/kwTlFtdqiWyQTrDId5zV+KQd0LoCznZe?=
 =?us-ascii?Q?+4Barpc+7NLhNV6PTymmAzZ3e3CWEcvmge2yhu6G3EXW9JLXKmc4/v8+yqj3?=
 =?us-ascii?Q?7Q4sKldi3Z9jMaqrUgsBJNIlQCyPs9A4Ff5+RJbowSeFGrVC7Plf0SAJltk9?=
 =?us-ascii?Q?DJZr5VTzzqNzT+ZKzWarQVC/3zR90rbfvIRx4jSGvfbu7U6xibQiVFh4dSEr?=
 =?us-ascii?Q?7+QEMv/1L+kur/MmGYhkGWrDGn1rqAPBbwxwGozD4aDuJJ3yYP7jZx36u0y1?=
 =?us-ascii?Q?sPKCtvO1yHkNfSxKQFebl3zn2cuSEUdrtFX5qt1KSGOiKZZVRB1ccLn8voLD?=
 =?us-ascii?Q?kMKYKXV1nTN0qpbwkBgMuYb2mAeEfzDnPm/ozEfzYFJ7me7mQrG30vk7t20X?=
 =?us-ascii?Q?b/nfh/1epPL0rOAQG/qKTJENvahrUnWK62LGBEM3xI0aIijJfRgfjzu9pjCl?=
 =?us-ascii?Q?JXxUnsSJyzxouIbx69MCSrSBY0msI+sBA6mSKFTklPwmUdS8LWfzJipKAZ6j?=
 =?us-ascii?Q?lmvxaeiF4MFiFoDsJycHq83A14f0Tqb2JhDBKFSLJ/30fQL31w5wCp1xcxFv?=
 =?us-ascii?Q?sf0bMBWm2POSYnbVmvjl+erHL5aB9tDuex1fOdbs6YAJ9Ehhu9LArE+KAHrB?=
 =?us-ascii?Q?QyLXYImhpudYCxQVo9xvoU0xJsUkXp72nU7PpOajSgSM1KOwB6QTGt19OtWD?=
 =?us-ascii?Q?ZY0ttoxoa3qd3y73tz+RKBsrknc1dJigF00HGPTWfZkJwExCZ4Oy8oK4yeW3?=
 =?us-ascii?Q?YoPUdeQNMV3u5bMzIgVz1E0aBHvY/bDqMbim+hnfLiXaGBnvDvMJFhaZIHRS?=
 =?us-ascii?Q?pjan/foqGa2PnWkeD0KNuMfEpHX50LKQDZRSCgotg0AmZYvvVt66wxUNllhs?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29116b39-5147-4e18-aaa2-08dc8404eb0c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 19:39:44.0440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klLvPayssqBxm55FIA0UTQ9RiRqTljzEB3ZToBVrnw1iOb3ageuTMyffeShVtX0VwQCt16F5XjSYO/JrcwpZV3tgi8UkdjOKPwuLFmHjO5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
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

On Mon, Jun 03, 2024 at 11:56:46AM GMT, Daniele Ceraolo Spurio wrote:
>The commit title seems a bit too generic, given that you're only 
>fixing a single occurrence. maybe switch to something like "check 
>force_wake_get return code in show_run_ticks" ?
>
>On 6/3/2024 4:30 AM, Tejas Upadhyay wrote:
>>A force_wake_get failure means that the HW might not be awake for the
>>access we're doing; this can lead to an immediate error or it can be a
>>more subtle problem.
>>
>>In this case, user has asked information and in case of forcewake
>>failure, it might lead to wrong information, so return in case of
>>error.
>>
>>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_drm_client.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>index 4a19b771e3a0..e050fc6d8dd7 100644
>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>@@ -264,7 +264,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>  		if (!hwe)
>>  			continue;
>>-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>+		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
>>+			return;
>
>Since we're not returning any error code, there doesn't seem to be a 
>direct way to know that a forcewake error happened; we can probably 
>infer it by the lack of messages being printed, but there is another 
>(unlikely) exit point that causes no prints to occur. Should we print 
>an error to dmesg, just to be safe?

see [PATCH v2] drm/xe/client: Check return value of xe_force_wake_get

Lucas De Marchi

>
>Daniele
>
>>  		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>  		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>  		break;
>
