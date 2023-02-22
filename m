Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177B7C636D6
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 23:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA81210E416;
	Wed, 22 Feb 2023 23:34:07 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4271E10E470
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 23:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677108845; x=1708644845;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nZq0/DsuLfuXqahCvqDmvlyexbFdYPvReWzx7vNV8Y0=;
 b=fczY6gcl6RqaXuVFCc4HKQt/tn4BEwL6XwA1SsC5NjQPRwLrkfX36R5Z
 KTUToHHcUEYF1KeuwQ11vBMvK4HGYzflAOjyw7yvKe7C8bGOtAevQlusp
 mB4Rh3kDCmo7hQpJLDRqdJ9uLoLeED1q6hFHji4Lf/V6WllZLH1goosKz
 9HpUroHJCeZhlU1szaas68hC7iclzFWcIutACMMlKNU5RZoyDWWjohsPy
 tdHcJe6t/tYN0ycgVAEygOA+HEsyS8d12HvcHF2o4iNoQusJJB+TKC/Y8
 1qzNCNEeaPyQN0tL+YvW9Q9l8q4zx4ldWM8PCfCqArcmhi5vf7On6kS6K A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="316793126"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="316793126"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 15:34:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="1001183192"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="1001183192"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 22 Feb 2023 15:34:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 15:34:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 15:34:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 15:34:02 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 15:34:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0xq0LFpr3+s7ZnX+NXTtjB3B7I8Nc+9EYIESdZJwSBIhy7W8Cj6a/pIM52dd6QMYrDHgnYDBvvv07l0WnLa0g6T2qZZxcDF4WpxyFCE7eqGarW3fWfeIDezolNLz2UPiYiPH6e2JLiIvC4xNGyUt3VvQ7xFggJc+3+Io+rfVls2HWUMyDWXg+m7rNhruVacHGddyokfkZsJMkXqkVAjdAelREoDdrUVpWQLCMfK9UZBcXOpbWe6vipqf4fRj5an4UyxFOyenn4T5BR/6BQVssd+zVpzM2ii7c4qzWi8OgQmzmCpUV5TUodxAlq20RG1Cv15D9MX2fFDfqJkyF7p3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyDp4kppznksCon+ofDQDDtgblIIPoGBvgVGeMovbhk=;
 b=a3REOBxv6ddwFv9IQJEaaanIYdwfBp++h2Xex88QX/zkMckMupyJat8j3xwNer4qK81wgtTIhZtDbB4UaFq4zwqvdfkJsLRMuPF+ONrjVYRDeOzM0tu2iA0Cxv+I8rsp6qKtzM2fPKTanKMs94z/hqBqs0RJ+ILZ07bsHF8WsgzQkryDuoNwKSfxuwVg0COSd7UagqgE6n8ziaLD/r1Dwa3P89e4zUOdIRMKkzJeCKj6qKpi4NsoHgOoXd+OR09QiUd5DT0992T9LybCSvJnx0uw9lsMfg95HwmrExW1hGptu1cFoAWZ935a+WJs6cGxuSrq8p3o+YBulCKJMeNRoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5311.namprd11.prod.outlook.com (2603:10b6:5:392::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 23:33:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 23:33:52 +0000
Date: Wed, 22 Feb 2023 15:33:49 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230222233349.elfq7uho2hba7t37@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
 <20230216231724.2246534-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230216231724.2246534-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:303:16d::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: a32a5c0d-42c5-452e-f3cb-08db152d41cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9RZf2kZ92RCgaXswTVfYY9u6crreKGz4KdgJr6grh9lkSM3vFDqKxdVhKUAb1kYyvQZRP7OqX+WU/1iZgk89mpZHOFTpg8pqqrWSxJAozHlrry8+6L+XmKB+LSyqxfhrqjKtRTpZ9VCv5V2YuUSrXJBNGSirkUXUrtvDksbheco/NLqSZ9y9sPE4BadtB1sSkl3q9Hs0pMpTUH35AL0S9U9kqli4ManFJ4id3zNtbU5XjoKZ/eVpJBJqMal+M1hdfTSEnpbDfkL+hb4f29DrCF/pee3emp6HcXdmHZh+IjuxuGOggZgJocTPB2ZSYwr8S9G5eLdY6rWlVp/WBk+DFxaoCFgfs50ZfGYdvWXKjKRlAdbYle3v0fMtRI8skciXNQ/qBmOGnSig+ifX+gRXbRR/IrKVnA4b0So34/8XwMXLC3grBpzD3wOUsKaBD7bo6cKzzCpGse20dTTjVEA9S2zcQbgB0tVkaaB8Tl4FgFVf/irkR9hhNI/W7EzMxEFrmb8arhRYPqSdRiVc13EjwRM7z2Q8GAmUZ32SkK2pJJREKAvHri6f6dEBJHAzOOcYH5PVW7e/Dcg7k6WcjeD2KkPFa5uAA7YSzBtdSr/J7725/Jjhicx19hxyhpxG0cAQNOR7LAcKmXe3yDLiTUHqg1iv8DGPBOeaqKyvpmwgL84oF073Fi+BlRV542OupF4e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199018)(38100700002)(83380400001)(82960400001)(8936002)(86362001)(2906002)(41300700001)(6862004)(5660300002)(26005)(186003)(316002)(6512007)(6666004)(1076003)(6506007)(4326008)(66946007)(66556008)(6486002)(6636002)(66476007)(478600001)(8676002)(26123001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SEfgfkQnFH1thHo+/4Nw9UQlXWoV6AnXnWQZ5E7mhnanUUuc52WXMS9HtlOn?=
 =?us-ascii?Q?ohlmXXMHPvGIFApkXAT8t1+06Gl+7n4FTvgD9waTrfrTTOy7WbGVQ3O8v8ED?=
 =?us-ascii?Q?EWYJz4daBAXcqvKOSuvKxpcyqpSQycd8V9ItV+65X6pH6MV4X8/ZSPM/W7oa?=
 =?us-ascii?Q?l7Y2pBFQVIBSzhWHTi1FgjpCUo+aOwVuoQ1/mMnfhm4KkaSIZ3KBV5g0NwaS?=
 =?us-ascii?Q?JyXv47ZJjuP8AJ8KzH6ViAhpupAV7UOV25YlqcODBfhV0uxDWZeaOv0S/pUD?=
 =?us-ascii?Q?3EzfhknLF+lDUh8quGH7PYLxU30QRubpLdrVS9qml2epGkXOJouidJohjGEa?=
 =?us-ascii?Q?4olEovebDXpPkGjDI+bSDkmm3/a+SAEfxZhYZw9OX2XWuhc0u8gOQyx9x77A?=
 =?us-ascii?Q?PiNk4qXyoCkCBtqPNLLlkhgPRjOqpUq1YKIZ36P2e6g2D7avVKF4WimRAtXC?=
 =?us-ascii?Q?5ebnVmyyG7Bo/cRVLh0jjMFR3SYkIJBdJem/LFYBddZPRV8Ra8+yAdTVIAhR?=
 =?us-ascii?Q?COv8nmf4hjnx0bDgBRN7Qw+Upl/joqImiOvXVynfc+NQOv1FUMb91t5dGpqk?=
 =?us-ascii?Q?S843e7CbJR3ZJokztdq8Yt2bk3EXjBbb41Nb0KOn8k4MlVyIX3nkD1imr6w1?=
 =?us-ascii?Q?g3aOKoaqX4q6RAwJfzeqkbqeGkHdjeLC4AbK1YukDd2w9WL/Q7aU2BVOsvPK?=
 =?us-ascii?Q?PwfSYJXuNswbHW4T1jPz4FutMr+9CknkHlmamOtzfauae6+Py3bAi/fwrMLJ?=
 =?us-ascii?Q?Xq5X5s2bHyYRCzsHe1eoeZyZKbrOWgXAy+f7T7Zd1WdoFrVTjVj8XIgZNOdo?=
 =?us-ascii?Q?RkWpd3d2q5rk5LXdIZ4ghXWFjzygku0J20PZiwB2SLPN4BOZtp+sfblMC36C?=
 =?us-ascii?Q?OkEr3cp1IdNzDvNN44DB+1YKveEmZ6+kqgDU/FuwKl4EcALkjteiU9m8o++b?=
 =?us-ascii?Q?QO6s+DfRd7bSubKdri2FvsqrgIQuxP/gIZaJ+ZMaKaFB+pE9MHqzdVUFcZYr?=
 =?us-ascii?Q?j/fVbXq64YGZ0WoZjcB9o3GtrSxD+bcgrm7voEF0Y4BL4y7bxaQYhkucMVFW?=
 =?us-ascii?Q?cVQLZVc4xN73ZHE0c6+gk6eephkAIUHVFGoZtwtmzGbQ80WkF9ydwpw8doM5?=
 =?us-ascii?Q?5u0MjJpJZ+4pteUq19iKZhA5CsaZIstT6riVJntomjChacS1bmFMSBlO5PYg?=
 =?us-ascii?Q?quQfJzt03Zjj3gYSQGoCuaR6TEAiIjS6VH43hZ9ExIB9Ou/Ue2teIAk0cGcD?=
 =?us-ascii?Q?PwHNACEQoOJ5vGMgfBCHAt/ndEiRJml7r6imX6ULR7uZAG8YxBQ1B1GBAxRO?=
 =?us-ascii?Q?nHXy+uR3DGNrvQfYFQjLzFf9bdHoeIsSl/z9tsYJIV25L6JY8Qx089kDYfFF?=
 =?us-ascii?Q?WPp/gwZ7ISxVaU35hcIPc6m02WV0rp40+RG/xYnmAKIGxZUOfNBCsBkZYKsz?=
 =?us-ascii?Q?cPpJ+gXEeo93h/l+UKTljEUOL6xuMKRoeRE8FrWcS8C4+atyk0YiyBwo9+ar?=
 =?us-ascii?Q?vADmbqUJGNLs+s+MwNIFsLwQTA0/hlXBVPfayoILoZ44jFdnl6959ijzZim6?=
 =?us-ascii?Q?R8po2KO3RpZuhzzXybuVvzCxh6vN3v+hPWV4csywyyd03nNgirbvZvbROg9H?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a32a5c0d-42c5-452e-f3cb-08db152d41cd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 23:33:52.6814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLnASwvM02bqASQzwNKAyUcSZimgdVCSzyRkQDdnwl/xnzelMS68bX7cG1WusYT1cn7KzMRTOp0uANtntGf7OdEisGMAv6b/fCns84OKAyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5311
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe/mocs: Drop unwanted TGL table
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 03:17:19PM -0800, Matt Roper wrote:
>TGL/RKL/ADLS/ADLP are all supposed to use the same MOCS table, with
>values defined in the bspec.  Any entries listed in the bspec as
>reserved/error/undefined should always be initialized to the most cached
>and least coherent setting possible so that any userspace accidentally
>referencing those undefined entries will only experience an increase in
>coherency if spec updates down the road start defining real values.
>
>The TGL and gen12 tables that exist in the driver today are identical
>except that the TGL includes one additional (incorrect) setting for PAT
>index 1.  This is a holdover from i915 where the platform was enabled
>with an incorrect setting and by the time we noticed, it was too late to
>fix the table without breaking ABI compatibility (and on TGL we did
>indeed have some buggy userspace that was referencing the 'reserved'
>entry 1).  Since the Xe driver starts fresh with a clean slate on ABI,
>there's no need to repeat the mistakes of i915 here.
>
>Bspec: 45101
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_mocs.c | 46 ------------------------------------
> 1 file changed, 46 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index 86b966fffbe5..09adb69d1545 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -247,47 +247,6 @@ struct xe_mocs_info {
> 		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
> 		L3_1_UC)
>
>-static const struct xe_mocs_entry tgl_mocs_desc[] = {
>-	/*
>-	 * NOTE:
>-	 * Reserved and unspecified MOCS indices have been set to (L3 + LCC).
>-	 * These reserved entries should never be used, they may be changed
>-	 * to low performant variants with better coherency in the future if
>-	 * more entries are needed. We are programming index XE_MOCS_PTE(1)
>-	 * only, __init_mocs_table() take care to program unused index with
>-	 * this entry.
>-	 */
>-	MOCS_ENTRY(XE_MOCS_PTE,
>-		   LE_0_PAGETABLE | LE_TC_0_PAGETABLE,
>-		   L3_1_UC),
>-	GEN11_MOCS_ENTRIES,
>-
>-	/* Implicitly enable L1 - HDC:L1 + L3 + LLC */
>-	MOCS_ENTRY(48,
>-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
>-		   L3_3_WB),
>-	/* Implicitly enable L1 - HDC:L1 + L3 */
>-	MOCS_ENTRY(49,
>-		   LE_1_UC | LE_TC_1_LLC,
>-		   L3_3_WB),
>-	/* Implicitly enable L1 - HDC:L1 + LLC */
>-	MOCS_ENTRY(50,
>-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
>-		   L3_1_UC),
>-	/* Implicitly enable L1 - HDC:L1 */
>-	MOCS_ENTRY(51,
>-		   LE_1_UC | LE_TC_1_LLC,
>-		   L3_1_UC),
>-	/* HW Special Case (CCS) */
>-	MOCS_ENTRY(60,
>-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
>-		   L3_1_UC),
>-	/* HW Special Case (Displayable) */
>-	MOCS_ENTRY(61,
>-		   LE_1_UC | LE_TC_1_LLC,
>-		   L3_3_WB),
>-};
>-
> static const struct xe_mocs_entry dg1_mocs_desc[] = {
> 	/* UC */
> 	MOCS_ENTRY(1, 0, L3_1_UC),
>@@ -422,11 +381,6 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 		info->unused_entries_index = 5;
> 		break;
> 	case XE_TIGERLAKE:
>-		info->size  = ARRAY_SIZE(tgl_mocs_desc);
>-		info->table = tgl_mocs_desc;
>-		info->n_entries = GEN9_NUM_MOCS_ENTRIES;
>-		info->uc_index = 3;

there is another difference here: it's not only the index 1 that is
different, but any uninitialized entry.

that unused entries would be programmed to XE_MOCS_PTE (1):
LE_0_PAGETABLE | LE_TC_0_PAGETABLE | L3_1_UC. After this patch
they are programmed to
to index 3: LE_1_UC | LE_TC_1_LLC | L3_1_UC

 From the commit message I was understanding you said it was only 1 entry
with wrong value, which as per above is not the case. Maybe reword the
commit message a little bit?

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>-		break;
> 	case XE_ALDERLAKE_S:
> 	case XE_ALDERLAKE_P:
> 		info->size  = ARRAY_SIZE(gen12_mocs_desc);
>-- 
>2.39.1
>
