Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD75E936EC
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 00:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C55510E3CF;
	Thu,  5 Oct 2023 00:10:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA29D10E3CD
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 00:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696464657; x=1728000657;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Sv8yDCZYiyeCHTKe37SEN8jMsRvYmcOmKdHiNtc8z28=;
 b=ARJa8F9EZmrKJRYsm7vUpTu7VUOGVMmTGoMGAcjNIJLEyqjVLWYSEAqs
 TkaFU27gaCRoteXebWRsoVehF2ULAopOlU8rkmS2Q8OU6Lt6di6fCUYQQ
 WhGFh//JyVNE/HvXTziAYbaUxN556/mmOaQNh9a4nYNflTkOCSQhqChvZ
 Ul2JEoMLy59qQTQH9BrUtZYs2lKCW5P5llZhwlFRZfZ3kJAJ12Yc5fWZr
 53r8BnKzr4Jiqxzfe6s+hPwFIo0jWxfLMuMuQ0Ags0PEYtG+d4Z7IN3vR
 O73n5oXRZbkqOoZPDpL1mSjA2y7/XkiIm5bCnHPPG1cPXVNC/0Lxj3+Qg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1945228"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="1945228"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 17:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="925366794"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="925366794"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 17:10:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 17:10:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 17:10:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 17:10:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYudIz7vtez43LTc8PXWyq6yZb4HGIIN3pu3/RZutgWSWHm9Efvskou0c0yI89C48P4HtyqWLxzPAGJFaLahMMpucbk1q0BZEukANDPLDXwRAcaTYUhdv8qVMbr2GoMYUsERwHJYayLBrIsiQjl/oMl4M+HAaNOW6R98DM6/YlFqFwv9/Hy7zVrFORAQxPsuPlgLJJcxGillP3uz2R4Gh/rBBRJTFBm5FZddIFJ7kwLwXX/PDXXhLllSKjOAc7LUMrDAnvgtMStycggTFdkeieYn89Wn50FzVZrSHmVGSUKA/hBwepRumD+lN1j2a4uwSeXQ9hhntZHclJjlaP04Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbMGx5T/lPbRGPrOBJCRrsoqEIQKt7FkEmouuBg+8LY=;
 b=myYMSLfhDJDz8lESiqfuCqYw0F+GB9U9lMTxXsTwOGjz2Jh0Hk5ctVpLu7TG+nnsib5V6OO0RPWyUDlXRyrBcvey3TsHwQrTOQzcXRkKtjculqZTBIoAMtGM9VwpCpOLzyq03VOWbC/czwCAv52sKVnmQWiF6MOQvxSTjSLkQ0XRUfWWbZQRphYsOTHYafa+XtWqScX5rQepda5oX0iQ+7CsuBDXWY2wj4fkzzZOlRB4NaconYnVE3Ru5P3UzeN2Ouo/QsJp/jrv3ZN7Us6NVPxTB3GdhdUkj5xqaoYsvuiaRmrCODb5mfPKdoG4ht+gTF3DpsljTVoqS65N3vrHhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Thu, 5 Oct
 2023 00:10:48 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 00:10:48 +0000
Date: Wed, 4 Oct 2023 17:10:42 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Kershner, David" <david.kershner@intel.com>
Message-ID: <ZR3/AiMejJJh1JIq@nvishwa1-DESK>
References: <20231003222145.4090918-1-david.kershner@intel.com>
 <20231003222145.4090918-2-david.kershner@intel.com>
 <ZRyf0DHi/DXWAoHP@nvishwa1-DESK>
 <SJ0PR11MB5866889973B4AD7426E0B7F281CBA@SJ0PR11MB5866.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ0PR11MB5866889973B4AD7426E0B7F281CBA@SJ0PR11MB5866.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:303:b5::21) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: aa43f8b2-0815-4b45-7f1e-08dbc537867d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rojOZ5yRqCqWKwOq/XwM7webx0lldnoCuP9RNBU6jA2TweQGhqJSkP0yYlfMFJcGgF/YjG79FsYSmdc8E0WAksbV6woVTb5riUBNPepZXi7qzQ2BoA610q0VMpSeUOcsXdegxDcervGW69j1zUtiFEh5Fs5URS4QsisluecGAIV36zfbaUeOf++ueQ87bUk7HMAZ5kCHWdQDhvhUx2EZB9FMXQ1Umi8VWP4Y+3WP+Z0O1lceIW5sY0ZHIGtUI/Ge8zajpzt95JpDgF7XmxNDEZDXLIs7nhyelpO7PzQadzfLykw0ZaTwBJEfv5tuaF86qUIEdzq2ZMySLZbOyZ6zKwP5Zf78zf9RBL6LfdmAts7ScJ1WXcgdCbiXbnIIcwMozdIxQZMgOYfHtB1kin2Z9THjKfvMvcVT9BsEssxxEEC89GrxcmIW3c32rjLrdMTe6A0FpAQga1s43VFsQwgHSvFZhEifVxngG0ilKL5Ku+R0JTMAOMRV3t3tMgX4E4/M1BghD6sg3H4iCJBiEkA2eWed7bMzfs0n/6PGJnqEGG+16ZoSYhOIWMDuxekvi2dG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(8676002)(107886003)(6636002)(6512007)(4326008)(44832011)(66556008)(66946007)(8936002)(6862004)(5660300002)(54906003)(478600001)(66476007)(316002)(53546011)(2906002)(6486002)(41300700001)(6506007)(6666004)(26005)(9686003)(83380400001)(82960400001)(86362001)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BqejNCLvWm//HqDDQ0lkN3bXnCUMA+NnppinvHlZgP9ZweGwbVH3m15dD26K?=
 =?us-ascii?Q?SkdXkLynQIBBHjbfZ5U/NAVtxSI/ZG7iiB34kSdBZyugz6Y4dkdpF4v/Yrue?=
 =?us-ascii?Q?V35Mi0SG80epo6Ni3o+k5+td+9wKweCjaKkvsXlP5m7DVE6eHTn8s8p9Z//F?=
 =?us-ascii?Q?sLMHIRkGa1UT3Zbau8BhLMdMuGUVADHy9M4GI26bQHO42y6K4x99a3GjbRMo?=
 =?us-ascii?Q?m/wWaqPX+xcJiekMkdrNP0dpvr9RONoBVNFVm9/HYFABfqq3IoNtMeQXxFv7?=
 =?us-ascii?Q?4uC+i04GGWzq+6iC2Sd4MaJ9xdVVGlTM7onK8ZSVm3ProgMniux3ilvH8ERx?=
 =?us-ascii?Q?cW7i1ZIQxyM6mlR3Fy7qlEZilw34L4Hxq1YFJtJTqSu505oimN5B5T5I3qkZ?=
 =?us-ascii?Q?q/ycXpyU9J3QsPWryTyA2ohYFAmEvAKNEtYZoO5BJJ7P6BLP0yMqEeLFCNdW?=
 =?us-ascii?Q?XzBnqM1vGcRhWdUHvcLVPZWn2WcHfbj047EcDjpZJRa/WPC+zLW+ZDmVAtbj?=
 =?us-ascii?Q?R8MEOLrpvyXWRH3lvfFn5/0dZtAIRe3Eyy6WuEgsqlHsg4yORuZVgxSyA+iK?=
 =?us-ascii?Q?jHkOcM2b8+sYkGYroI2ZDeiLoMQ8VAmEVyx/Gtnqr0nMX8cY0mXzaeNFQT+D?=
 =?us-ascii?Q?0HJSvCyzu4VX5+ldl6nO7Wx1I+Mj/+3khEiCnV3Fo1ljmLOTrI2oQMazj4Jj?=
 =?us-ascii?Q?z49aIAovy4Nrww1kmwsVflYaOdNdFHcmp5ke+S3vaG1C5YJn5RPd6QgOFDGr?=
 =?us-ascii?Q?gkHuiYg60TA/b/TCLUcC8Gafe7Ye511+4bOdQJsYp2xq5kawg3JnySvX5xvL?=
 =?us-ascii?Q?cgB7pf0dwIMcaG0XKSSsZHEZvcQYkyt84hWBhfXeAC55cBpKU4Ol6eykzsdA?=
 =?us-ascii?Q?udeeRtakg1A6IoXs/WIHd8yxhniz9xj8mWcbxXv7gyVmXM2OiRMtn+lTGA3n?=
 =?us-ascii?Q?7MmTa90+QJ94MdvtIOWcpY1+kLKZqg6gU/NQLyMYDWP2svRHBtW7reqa5AQr?=
 =?us-ascii?Q?FPubiRmX5ynz/kXe/8bFtgKd5wEDT79pK8nj/um/JmhIsDZNjV/Mn0Jz6XP1?=
 =?us-ascii?Q?2EB7mQoo+iQFXV3+/nFRgF9NsDvVO0dcEu6X1MvXnGTelwqX+pH0PrS5TyhM?=
 =?us-ascii?Q?UVgz729xGDKfAKFNsCZqunzOtXR+u/ID30HjOE0TRrqQJazmNitFLC53B5HB?=
 =?us-ascii?Q?DzkTczYKnH5M1GquESkGG/yrhFNjZ/6VDFTjTG4JkxJnYayLDLB2tC9Nl8ly?=
 =?us-ascii?Q?Y7xR1EadaDAKuYXbuFgsPd0f+FQy5FHGHU28cBVptrC1Xclv9SodOZxZLsAw?=
 =?us-ascii?Q?5n0fK0/2agmNUNnUDVlwFL7M5gQIGpKLIbI2OCGlmEU7LM5EeTYnq/ATSCsb?=
 =?us-ascii?Q?L+btd6YOze4bpO6mkJS6LX55LRy8ET3b/7xLPYXXBe75+y6w72mH3G3AyPOv?=
 =?us-ascii?Q?UtZ/xl2J/R2PrG/q0lfp5tH+sjgl3KNS8Dd+J9ssDMjlHjFSgacTLQjKEZrQ?=
 =?us-ascii?Q?/T/7dTvoWj45PWz4Kc7Zzjb6Z+H8eUX46N8tWMr7tnwI8+KpTOnvZbD9Mm9n?=
 =?us-ascii?Q?ZKLxbb754n7K6HY1Od3clGMnY7lx6cDsaumfymWkZLGKaxbRt5Phsee0EnXJ?=
 =?us-ascii?Q?mZ0gYfb180PLaq3aLkWPDz4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa43f8b2-0815-4b45-7f1e-08dbc537867d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 00:10:47.5087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYDVJLZ18nW/Bo1Bhb8fNi6200Y5mYGoiBEXw0YOzBNlNAcBcnhIBhgW3FOOHEmC3mYwZlzVlW2peXWrWieE4CZXvZ6Zus394z/PLWRsuKezP64Quvw1EpLsMJF++Det
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/xe/xe_migrate.c: Use DPA offset
 for page table entries.
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
Cc: "Fleck, John" <john.fleck@intel.com>, "Summers,
 Stuart" <stuart.summers@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 06:58:33AM -0700, Kershner, David wrote:
>
>
>> -----Original Message-----
>> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Sent: Tuesday, October 3, 2023 7:12 PM
>> To: Kershner, David <david.kershner@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Ruhl, Michael J <michael.j.ruhl@intel.com>;
>> Fleck, John <john.fleck@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>> Summers, Stuart <stuart.summers@intel.com>
>> Subject: Re: [PATCH v3 1/2] drm/xe/xe_migrate.c: Use DPA offset for page
>> table entries.
>>
>> On Tue, Oct 03, 2023 at 06:21:44PM -0400, David Kershner wrote:
>> >Device Physical Address (DPA) is the starting offset device memory.
>> >
>> >Update xe_migrate identity map base PTE entries to start at dpa_base
>> >instead of 0.
>> >
>> >The VM offset value should be 0 relative instead of DPA relative.
>> >
>>
>> Overall looks good to me. Some minor comments.
>>
>> >Signed-off-by: David Kershner <david.kershner@intel.com>
>> >---
>> > drivers/gpu/drm/xe/tests/xe_migrate.c | 37
>> ++++++++++++++++++++++++---
>> > drivers/gpu/drm/xe/xe_migrate.c       | 22 ++++++++++------
>> > 2 files changed, 47 insertions(+), 12 deletions(-)
>> >
>> >diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> >b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> >index 6906ff9d9c31..75b06f0bd755 100644
>> >--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> >+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> >@@ -99,7 +99,7 @@ static const struct xe_migrate_pt_update_ops
>> sanity_ops = {
>> > 		} } while (0)
>> >
>> > static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>> >-		      struct kunit *test)
>> >+		      struct kunit *test, u32 region)
>> > {
>> > 	struct xe_device *xe = tile_to_xe(m->tile);
>> > 	u64 retval, expected = 0;
>> >@@ -111,7 +111,7 @@ static void test_copy(struct xe_migrate *m, struct
>> xe_bo *bo,
>> > 	struct xe_bo *sysmem = xe_bo_create_locked(xe, m->tile, NULL,
>> > 						   bo->size,
>> > 						   ttm_bo_type_kernel,
>> >-						   XE_BO_CREATE_SYSTEM_BIT
>> |
>> >+						   region |
>> >
>> XE_BO_NEEDS_CPU_ACCESS);
>>
>> In this function, we should now change the bo name from 'sysmem' to
>> 'remote'
>> or something similar.
>>
>> > 	if (IS_ERR(sysmem)) {
>> > 		KUNIT_FAIL(test, "Failed to allocate sysmem bo for %s: %li\n",
>> @@
>> >-187,6 +187,27 @@ static void test_copy(struct xe_migrate *m, struct xe_bo
>> *bo,
>> > 	xe_bo_put(sysmem);
>> > }
>> >
>> >+static void test_copy_sysmem(struct xe_migrate *m, struct xe_bo *bo,
>> >+			     struct kunit *test)
>> >+{
>> >+	test_copy(m, bo, test, XE_BO_CREATE_SYSTEM_BIT); }
>> >+
>> >+static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
>> >+			   struct kunit *test)
>> >+{
>> >+	u32 region;
>> >+
>> >+	if (bo->ttm.resource->mem_type == XE_PL_SYSTEM)
>> >+		return;
>> >+
>> >+	if (bo->ttm.resource->mem_type == XE_PL_VRAM0)
>> >+		region = XE_BO_CREATE_VRAM1_BIT;
>> >+	else
>> >+		region = XE_BO_CREATE_VRAM0_BIT;
>> >+	test_copy(m, bo, test, region);
>> >+}
>> >+
>> > static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
>> > 			   struct kunit *test, bool force_gpu)  { @@ -349,7
>> +370,11 @@
>> >static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>> > 	check(retval, expected, "Command clear small last value", test);
>> >
>> > 	kunit_info(test, "Copying small buffer object to system\n");
>> >-	test_copy(m, tiny, test);
>> >+	test_copy_sysmem(m, tiny, test);
>> >+	if (IS_DGFX(xe) && xe->info.tile_count > 1) {
>> >+		kunit_info(test, "Copying small buffer object to other
>> vram\n");
>> >+		test_copy_vram(m, tiny, test);
>> >+	}
>>
>> Probably we don't need IS_DGFX() check. tile_count check should be good
>> enough?
>>
>
>We're concerned with multi tile internal devices, if this is not an issue, then we can drop the check.
>

I don't see that is an issue currently. Besides, we are not checking IS_DGFX below for 'big' buffer case.

Niranjana

>David Kershner
>> >
>> > 	/* Clear a big bo */
>> > 	kunit_info(test, "Clearing big buffer object\n"); @@ -366,7 +391,11
>> >@@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit
>> *test)
>> > 	check(retval, expected, "Command clear big last value", test);
>> >
>> > 	kunit_info(test, "Copying big buffer object to system\n");
>> >-	test_copy(m, big, test);
>> >+	test_copy_sysmem(m, big, test);
>> >+	if (xe->info.tile_count > 1) {
>> >+		kunit_info(test, "Copying big buffer object to opposite
>> vram\n");
>>
>> s/opposite/other/
>>
>> >+		test_copy_vram(m, big, test);
>> >+	}
>> >
>> > 	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
>> > 	test_pt_update(m, pt, test, false);
>>
>> This test update should be in a separate patch.
>>
>> >diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> >b/drivers/gpu/drm/xe/xe_migrate.c index 15f091a7bba3..42942aeef595
>> >100644
>> >--- a/drivers/gpu/drm/xe/xe_migrate.c
>> >+++ b/drivers/gpu/drm/xe/xe_migrate.c
>> >@@ -114,8 +114,12 @@ static u64 xe_migrate_vm_addr(u64 slot, u32
>> level)
>> > 	return (slot + 1ULL) << xe_pt_shift(level + 1);  }
>> >
>> >-static u64 xe_migrate_vram_ofs(u64 addr)
>> >+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_device *xe)
>> > {
>>
>> The convention is to have 'xe' as first argument, so it is better to follow that.
>>
>> >+	/* Remove the DPA to get a correct offset into identity table for the
>> >+	 * migrate offset
>> >+	 */
>>
>> Comment format followed elsewhere is,
>> /*
>>   * comments line1
>>   * comments line2
>>   */
>>
>> Better to follow that.
>>
>> >+	addr -= xe->mem.vram.dpa_base;
>>
>> Should never happen, but probably a good idea to add an assert that addr >
>> dpa_base? Otherwise, we will endup with hard to debug issues.
>>
>> > 	return addr + (256ULL << xe_pt_shift(2)); }
>> >
>> >@@ -149,7 +153,7 @@ static int xe_migrate_create_cleared_bo(struct
>> >xe_migrate *m, struct xe_vm *vm)
>> >
>> > 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
>> > 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>> >-	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
>> >+	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr, xe);
>> >
>> > 	return 0;
>> > }
>> >@@ -225,12 +229,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
>> *tile, struct xe_migrate *m,
>> > 	} else {
>> > 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>> >
>> >-		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>> >+		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr, xe);
>> >
>> > 		if (xe->info.supports_usm) {
>> > 			batch = tile->primary_gt->usm.bb_pool->bo;
>> > 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>> >-			m->usm_batch_base_ofs =
>> xe_migrate_vram_ofs(batch_addr);
>> >+			m->usm_batch_base_ofs =
>> xe_migrate_vram_ofs(batch_addr, xe);
>> > 		}
>> > 	}
>> >
>> >@@ -268,7 +272,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile,
>> struct xe_migrate *m,
>> > 		 * Use 1GB pages, it shouldn't matter the physical amount of
>> > 		 * vram is less, when we don't access it.
>> > 		 */
>> >-		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos +=
>> SZ_1G, ofs += 8)
>> >+		for (pos = xe->mem.vram.dpa_base;
>> >+		     pos < xe->mem.vram.actual_physical_size + xe-
>> >mem.vram.dpa_base;
>> >+		     pos += SZ_1G, ofs += 8)
>> > 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
>> > 	}
>> >
>> >@@ -443,8 +449,8 @@ static u32 pte_update_size(struct xe_migrate *m,
>> > 		cmds += cmd_size;
>> > 	} else {
>> > 		/* Offset into identity map. */
>> >-		*L0_ofs = xe_migrate_vram_ofs(cur->start +
>> >-					      vram_region_gpu_offset(res));
>> >+		*L0_ofs = xe_migrate_vram_ofs(cur->start +
>> vram_region_gpu_offset(res),
>> >+					      tile_to_xe(m->tile));
>> > 		cmds += cmd_size;
>> > 	}
>> >
>> >@@ -1062,7 +1068,7 @@ static void write_pgtable(struct xe_tile *tile, struct
>> xe_bb *bb, u64 ppgtt_ofs,
>> > 	xe_tile_assert(tile, update->qwords <= 0x1ff);
>> > 	if (!ppgtt_ofs) {
>> > 		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update-
>> >pt_bo, 0,
>> >-							   XE_PAGE_SIZE));
>> >+							   XE_PAGE_SIZE),
>> tile_to_xe(tile));
>> > 	}
>> >
>> > 	do {
>> >--
>> >2.35.1
>> >
