Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A01C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 16:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAF710E4CC;
	Wed, 24 May 2023 16:22:02 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED7B10E4CC
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684945320; x=1716481320;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R5S6fq8hsvd7g/VXY9gAjZMHIDbLQNcwP9OoGF+JPzc=;
 b=jY1lVn2kUjj+dR8xwGUD76jyeadzIJARBuR5BXktkFXINt766+kWJZh7
 k9f2SzmdYJ7tVbO9i0egr5vLX3YCDGc7wui50mnb6qf2jzEtI1o47xQgs
 8Gquksrov5Lu3Qi3DXMXjwqSHG86SkX8eYAIR8FUs6lMJaaZHalYIA2Q3
 myP447Xr6bBl28YeWXoZlxD+/RlXvEvCDb/HD3OU41lMVwJ7DDBfWrk/H
 4m5xEhIz+5ddKhvrCJF3ofTspJW9nNBDUBsS/OgK4tFp84UmpHeF56ion
 tO6i7PURZujO1sqMuRUV6o6k4IdSgfI33hA9EzLlPLpDM3yFxfb/dSnJB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="381862838"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="381862838"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 09:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="698590547"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="698590547"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 24 May 2023 09:21:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 09:21:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 09:21:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 09:21:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RW1B4SQ8rZqB4PL4EDemn0FcKgwNcaTDS3DzBB8UUROfsySJNwwteFNIm5IdgBx38Ib7L9mrLyV5/aVXU2iYNXz8qFhkViIiY55yddBRv1PtPTZ4bsPh9xh554hPnDkuXb83iRBw9I7VgN+zMqxS8ajkmsvl320KLYfy7/++LColqV2Pw7snQrZXGaDBYtnlae5sQP25Wo6NUIIt66if5KrZQ9vbGHFi9JpXxlkyEroK6kbII1YdrP6cTXB5gypZgXAn/Xg2lfH+GRwdQXQ5O4Pv24q/6VEfgKE05+C8c7UuGx7o5YgZuRawtB+LXC35K2F9P4xYPEQdMhxWXqw0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIOpdhp6DTKOLm5TQTUs7eb8p+NnT4lQVAvwVrsd148=;
 b=QXnwYrKO498uWBYmiT9cC+HKoeG4Asifq3oabctdhBCqGk1pCPKWJYQdXknfKWU4LfqEEvcsYuT/wh5uc5j5v4S0UY/PDLF5HDQdVt8CELR7hzfppiwPGwLqGJxE2teJtZi//yIKhHseu8gkYRHp+5AbtuhTQNX4QQuwfl448tv5FkrQE4Jck+Mdr11fDwFJfpP7xEZUgvr/X3g6CMWKf2kMLysRLMBdDtndDk53nypScc9KcSJv+56ukvl+HZ9JsKUrYtwu2vB4ekmhruqDpEGlTreQI7mWk6O7Q4cM3xVFtXQ6zX/2bSUiAuthXvr7uTY5d2XPZ2wweCxWrl/Pjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 16:21:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 16:21:55 +0000
Date: Wed, 24 May 2023 09:21:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christopher Snowhill <kode54@gmail.com>
Message-ID: <zs25qviigmfayynn6rkmngsyez2uetlnq57l3egxmqhsprjgf4@y5gqschtgnyu>
X-Patchwork-Hint: comment
References: <20230524033131.2000480-1-kode54@gmail.com>
 <20230524033131.2000480-2-kode54@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230524033131.2000480-2-kode54@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b17920f-1810-4587-0837-08db5c72fd4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1wrF3up3hdlyCaf5IDz3n6b+RtfXTDnIQtQaN7H0jgTrGhCPlSqQwnrd8vEJxzq/Ffrxo89QDNqLXe2EThaNDr35wpgSPQdZLtmI8Kfs5Har3GVnLetlCJPnIewvUCU1ch4teF8AYcPXXkjIoA5qMtuUWG7nvVCevJVbOGKuACm7+nF2ulMJ8O4W/Kg7vNliIlN62x8GmYs0t4v2hrKkGVMSMRCsztlmHqXMaJ4lQ0Ylo+c6aCUJohapyvAwNupR4Rq/X3i9Cy5o9NTHdqb8bjv3nyeuiXDYFy/iNSyZU2JwhPsJ0VbgwAwn/YmSGTxLlSwaKezZLkQn/cxHKAlCGzofLOUwey+cO/3jlAH6gLlxm3JFfq+Z76NnrEaUh0V+aOFTj6XATnbK7uaEWx1JEWQzu5GQabZjpzqbKUAntZXk0Y1xLB6AavXeX16Ik+fkYouvxT2bBMiQ+MkVW8vc0e1FnEPYcE5Vk+kGahQ/rxPsfCi/S/in8kaxSU46nAmzd81zkN8LWG5hKRa/7PqBwrQu5yRbBFrYRRF9GYLQOsyg8AurNQEOJ9X9Cd+J3KH6zUEMkcDx70PO+dLTw6M2F9hiM+ruVRXw+/y4KY3hj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(9686003)(82960400001)(186003)(6512007)(26005)(6506007)(38100700002)(2906002)(316002)(41300700001)(6486002)(478600001)(86362001)(33716001)(6916009)(4326008)(66946007)(66476007)(66556008)(8936002)(83380400001)(8676002)(5660300002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g8Nwh4+E1iEIO6ZMzxAZqA1FEhjviijgmkOj1qcPxYNksaRXWxGmH3xOXT7W?=
 =?us-ascii?Q?uPuJfhDZFk3chyPcQtNCH8HWMnYBOh/T1TCqysEI0cciwNo0X/5eXNWIKVlL?=
 =?us-ascii?Q?meXIgXDI7CdmLflgvC136twuO03gUpiEF+SqHSfWikC/wIuqEF7afgeH6Gm7?=
 =?us-ascii?Q?7w83UVTE+stxLrFbPCxK6K81sNQkkpNg6i2yQNCPlLG6vYaimfaM0mUiEJjO?=
 =?us-ascii?Q?PJsXd9mFRW5B9UH3Hwmwedek/dNfqnzcyoZy3f6upOWx1X59TmoaApTZ95Fx?=
 =?us-ascii?Q?61Qx41W2nlp/qPZV3uDN8Bc4cq9Q8Ik9he82+FtSpdbMIxY9THPFBrX+TuPY?=
 =?us-ascii?Q?NqbNooyuZxf4skEllEvymAiBjGlln3+CBfY1otdaeIoKvlABkRMrd0Nh5fVe?=
 =?us-ascii?Q?LbhGOJZ3ZgUR8M2Bihq/diBCOuaUlZSgLn9mtcfCwhImZqXsVNAc51wX1enj?=
 =?us-ascii?Q?dMLiH2x0Do2tqAyReU0MTUgwb5M7/Eo/A9a06DpsmVfVUQI3vSVPCUjstLwA?=
 =?us-ascii?Q?me0fLiuJl/mOSqbXDI+wS3VpVg7+9PsbDDCW8VMJekrSXug/jFsNyJUaYgya?=
 =?us-ascii?Q?g9gv0cbUGSFY20JBDVwZlWnOKW+zsp8RQYg6M6168rJdnV9PBOHVhlSXPqYI?=
 =?us-ascii?Q?mooiDbSsvt2vlTGuSRwCa9O3xp3fazjcV4vTTQnotcw2jv0H0w462WiKPK6m?=
 =?us-ascii?Q?3E8EftCrRtBgR6FsRYOZn0snKdEP3CF/0Ly+B0Xv0YSiuHxdlvNFGs0Jw+pf?=
 =?us-ascii?Q?5WsVit7vNrJWLjQ3dFain+PtnM6+AZS5C0r/YHXcoZ+uvzlCrns6Emp2avQu?=
 =?us-ascii?Q?0IXQuultK8t5WsymODJ0DcvM3D6N/bUKg3KXM0AxJD2xKJEwo6z/7s4XvcWa?=
 =?us-ascii?Q?FE0aKSLf0x3A3d+ZYp2oMuo8EfWaUTqHOOWiGcSSs0NJqR6MUoFqwB4toLkv?=
 =?us-ascii?Q?BSgoFwnaWUDq0dAzjpoT6QPBrM5HyyQQ+jy+axufx3Y/dy6KiSe2ZPeIKAKu?=
 =?us-ascii?Q?PKZ8Qiq+4Ky7B5zKBgvicRYyyXQXI0Cdf+dBr9idhvjtQA+Mtn5kCLFlNSbf?=
 =?us-ascii?Q?2MXnnOQf9UhXjj1ZT789MvZ1TahAgS7v4GONE3rujQ9HZUyfGY0IpZj23PrV?=
 =?us-ascii?Q?gfwAKvdAclHUV3H5BirO/y9Dvljgwcj6ou2ytapE2T30ZUS9iwwsDCdW7RBR?=
 =?us-ascii?Q?Hh961vbVNcHTOSqWYdONVOz58ro7hbDWc09CARpX3wJ61+g7lf0BkWUnEXKb?=
 =?us-ascii?Q?4aOfknbwdKEDd5ZKVrwDkPII6y5DdSp3JNITkpjv7LS3N44Q4ApRwhWKbYS3?=
 =?us-ascii?Q?ICwGha7MJS1rySREU4ETgKBwtz/FJKIsi9vEdcsUaf/aLfEj+vdpfCwbOKvP?=
 =?us-ascii?Q?qku9p4wxMu43W15YXfO9CeicuMWWAD99bQF1prD4t/exILPcAyh7fFHOvaKM?=
 =?us-ascii?Q?b/7AbVpLAL1419/dFmnMaDbHOtH+trIY19XYx55sdz/xZUuKpH649Gsi/z/S?=
 =?us-ascii?Q?AWed1kMWfWm/Cl/JDobC5qh41QWBGzgtOulDJCdMby/fLDpDdhLiDm3orayO?=
 =?us-ascii?Q?gpzDjUWXzrY45ATWauDeGSFG+vn3U/F7+Lnx1Z+XINvv7+D21yx+AVQCZZR9?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b17920f-1810-4587-0837-08db5c72fd4e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 16:21:55.5457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WmhKeJzbblcIW7ZUSvXJ97V+YNhsDySuOmptsR769CO+DBMu3qTN/jtUMuIXhLzip+2QUeBRmB5tkT+zp+r6UoYLeiel53cdB9MqxZvtf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add explicit padding to uAPI
 definition
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

On Tue, May 23, 2023 at 08:31:30PM -0700, Christopher Snowhill wrote:
>Pad the uAPI definition so that it would align identically between
>64-bit and 32-bit uarch, so consumers using this header will work
>correctly from 32-bit compat userspace on a 64-bit kernel. Do it
>in a minimally invasive way, so that 64-bit userspace will still
>work with the previous header, and so that no fields suddenly
>change sizes.
>
>Originally inspired by mlankhorst.
>
>Signed-off-by: Christopher Snowhill <kode54@gmail.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


... with the commands below. As a follow up, should we add a way to
verify? And probably do the reordering in lockstep with userspace
changes ahead of merging upstream and committing to the ABI?

Checking:
	$ sed -n 's/^struct \(.*\) {/struct \1 \1;/p' include/uapi/drm/xe_drm.h > /tmp/a.c
	$ gcc -Iinclude/ -I include/uapi/ -include include/uapi/drm/xe_drm.h -g -c -o /tmp/a.o /tmp/a.c
	$ pahole /tmp/a.o > /tmp/a.txt

	$ # ... apply this patch

	$ sed -n 's/^struct \(.*\) {/struct \1 \1;/p' include/uapi/drm/xe_drm.h > /tmp/b.c
	$ gcc -Iinclude/ -I include/uapi/ -include include/uapi/drm/xe_drm.h -g -c -o /tmp/b.o /tmp/b.c
	$ pahole /tmp/b.o > /tmp/b.txt

	$ grep hole /tmp/b.txt
	$ # good, no holes


	$ # double checking the fixes in this patch
	$ git diff --no-index  /tmp/a.txt /tmp/b.txt
	diff --git a/tmp/a.txt b/tmp/b.txt
	index bcc2fd7a97cd..715687ad8c4f 100644
	--- a/tmp/a.txt
	+++ b/tmp/b.txt
	@@ -89,13 +89,10 @@ struct drm_xe_gem_create {
		__u32                      flags;                /*    16     4 */
		__u32                      vm_id;                /*    20     4 */
		__u32                      handle;               /*    24     4 */
	-
	-	/* XXX 4 bytes hole, try to pack */
	-
	+	__u32                      pad;                  /*    28     4 */
		__u64                      reserved[2];          /*    32    16 */
	 
	-	/* size: 48, cachelines: 1, members: 6 */
	-	/* sum members: 44, holes: 1, sum holes: 4 */
	+	/* size: 48, cachelines: 1, members: 7 */
		/* last cacheline: 48 bytes */
	 };
	 struct drm_xe_gem_mmap_offset {
	@@ -120,14 +117,11 @@ struct drm_xe_vm_bind_op_error_capture {
	 struct drm_xe_ext_vm_set_property {
		struct xe_user_extension   base;                 /*     0    16 */
		__u32                      property;             /*    16     4 */
	-
	-	/* XXX 4 bytes hole, try to pack */
	-
	+	__u32                      pad;                  /*    20     4 */
		__u64                      value;                /*    24     8 */
		__u64                      reserved[2];          /*    32    16 */
	 
	-	/* size: 48, cachelines: 1, members: 4 */
	-	/* sum members: 44, holes: 1, sum holes: 4 */
	+	/* size: 48, cachelines: 1, members: 5 */
		/* last cacheline: 48 bytes */
	 };
	 struct drm_xe_vm_create {
	@@ -149,9 +143,7 @@ struct drm_xe_vm_destroy {
	 };
	 struct drm_xe_vm_bind_op {
		__u32                      obj;                  /*     0     4 */
	-
	-	/* XXX 4 bytes hole, try to pack */
	-
	+	__u32                      pad;                  /*     4     4 */
		union {
			__u64              obj_offset;           /*     8     8 */
			__u64              userptr;              /*     8     8 */
	@@ -163,43 +155,34 @@ struct drm_xe_vm_bind_op {
		__u32                      region;               /*    44     4 */
		__u64                      reserved[2];          /*    48    16 */
	 
	-	/* size: 64, cachelines: 1, members: 8 */
	-	/* sum members: 60, holes: 1, sum holes: 4 */
	+	/* size: 64, cachelines: 1, members: 9 */
	 };
	 struct drm_xe_vm_bind {
		__u64                      extensions;           /*     0     8 */
		__u32                      vm_id;                /*     8     4 */
		__u32                      engine_id;            /*    12     4 */
		__u32                      num_binds;            /*    16     4 */
	-
	-	/* XXX 4 bytes hole, try to pack */
	-
	+	__u32                      pad;                  /*    20     4 */
		union {
			struct drm_xe_vm_bind_op bind;           /*    24    64 */
			__u64              vector_of_binds;      /*    24     8 */
		};                                               /*    24    64 */
		/* --- cacheline 1 boundary (64 bytes) was 24 bytes ago --- */
		__u32                      num_syncs;            /*    88     4 */
	-
	-	/* XXX 4 bytes hole, try to pack */
	-
	+	__u32                      pad2;                 /*    92     4 */
		__u64                      syncs;                /*    96     8 */
		__u64                      reserved[2];          /*   104    16 */
	 
	-	/* size: 120, cachelines: 2, members: 8 */
	-	/* sum members: 112, holes: 2, sum holes: 8 */
	+	/* size: 120, cachelines: 2, members: 10 */
		/* last cacheline: 56 bytes */
	 };
	 struct drm_xe_ext_engine_set_property {
		struct xe_user_extension   base;                 /*     0    16 */
		__u32                      property;             /*    16     4 */
	-
	-	/* XXX 4 bytes hole, try to pack */
	-
	+	__u32                      pad;                  /*    20     4 */
		__u64                      value;                /*    24     8 */
	 
	-	/* size: 32, cachelines: 1, members: 3 */
	-	/* sum members: 28, holes: 1, sum holes: 4 */
	+	/* size: 32, cachelines: 1, members: 4 */
		/* last cacheline: 32 bytes */
	 };
	 struct drm_xe_engine_set_property {
	@@ -246,9 +229,7 @@ struct drm_xe_engine_destroy {
	 struct drm_xe_sync {
		__u64                      extensions;           /*     0     8 */
		__u32                      flags;                /*     8     4 */
	-
	-	/* XXX 4 bytes hole, try to pack */
	-
	+	__u32                      pad;                  /*    12     4 */
		union {
			__u32              handle;               /*    16     4 */
			__u64              addr;                 /*    16     8 */
	@@ -256,8 +237,7 @@ struct drm_xe_sync {
		__u64                      timeline_value;       /*    24     8 */
		__u64                      reserved[2];          /*    32    16 */
	 
	-	/* size: 48, cachelines: 1, members: 5 */
	-	/* sum members: 44, holes: 1, sum holes: 4 */
	+	/* size: 48, cachelines: 1, members: 6 */
		/* last cacheline: 48 bytes */
	 };
	 struct drm_xe_exec {
	@@ -267,13 +247,10 @@ struct drm_xe_exec {
		__u64                      syncs;                /*    16     8 */
		__u64                      address;              /*    24     8 */
		__u16                      num_batch_buffer;     /*    32     2 */
	-
	-	/* XXX 6 bytes hole, try to pack */
	-
	+	__u16                      pad[3];               /*    34     6 */
		__u64                      reserved[2];          /*    40    16 */
	 
	-	/* size: 56, cachelines: 1, members: 7 */
	-	/* sum members: 50, holes: 1, sum holes: 6 */
	+	/* size: 56, cachelines: 1, members: 8 */
		/* last cacheline: 56 bytes */
	 };
	 struct drm_xe_mmio {
	@@ -294,9 +271,7 @@ struct drm_xe_wait_user_fence {
		};                                               /*     8     8 */
		__u16                      op;                   /*    16     2 */
		__u16                      flags;                /*    18     2 */
	-
	-	/* XXX 4 bytes hole, try to pack */
	-
	+	__u32                      pad;                  /*    20     4 */
		__u64                      value;                /*    24     8 */
		__u64                      mask;                 /*    32     8 */
		__s64                      timeout;              /*    40     8 */
	@@ -305,25 +280,19 @@ struct drm_xe_wait_user_fence {
		/* --- cacheline 1 boundary (64 bytes) --- */
		__u64                      reserved[2];          /*    64    16 */
	 
	-	/* size: 80, cachelines: 2, members: 10 */
	-	/* sum members: 76, holes: 1, sum holes: 4 */
	+	/* size: 80, cachelines: 2, members: 11 */
		/* last cacheline: 16 bytes */
	 };
	 struct drm_xe_vm_madvise {
		__u64                      extensions;           /*     0     8 */
		__u32                      vm_id;                /*     8     4 */
	-
	-	/* XXX 4 bytes hole, try to pack */
	-
	+	__u32                      pad;                  /*    12     4 */
		__u64                      range;                /*    16     8 */
		__u64                      addr;                 /*    24     8 */
		__u32                      property;             /*    32     4 */
	-
	-	/* XXX 4 bytes hole, try to pack */
	-
	+	__u32                      pad2;                 /*    36     4 */
		__u64                      value;                /*    40     8 */
		__u64                      reserved[2];          /*    48    16 */
	 
	-	/* size: 64, cachelines: 1, members: 7 */
	-	/* sum members: 56, holes: 2, sum holes: 8 */
	+	/* size: 64, cachelines: 1, members: 9 */
	 };
	

Lucas De Marchi

>---
> include/uapi/drm/xe_drm.h | 34 +++++++++++++++++++++++++++++++++-
> 1 file changed, 33 insertions(+), 1 deletion(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index b0b80aae3ee8..d5fc54b5be74 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -91,7 +91,7 @@ struct xe_user_extension {
> 	 */
> 	__u32 name;
> 	/**
>-	 * @flags: MBZ
>+	 * @pad: MBZ
> 	 *
> 	 * All undefined bits must be zero.
> 	 */
>@@ -291,6 +291,9 @@ struct drm_xe_gem_create {
> 	 */
> 	__u32 handle;
>
>+	/** @pad: MBZ */
>+	__u32 pad;
>+
> 	/** @reserved: Reserved */
> 	__u64 reserved[2];
> };
>@@ -335,6 +338,9 @@ struct drm_xe_ext_vm_set_property {
> #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
> 	__u32 property;
>
>+	/** @pad: MBZ */
>+	__u32 pad;
>+
> 	/** @value: property value */
> 	__u64 value;
>
>@@ -379,6 +385,9 @@ struct drm_xe_vm_bind_op {
> 	 */
> 	__u32 obj;
>
>+	/** @pad: MBZ */
>+	__u32 pad;
>+
> 	union {
> 		/**
> 		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
>@@ -469,6 +478,9 @@ struct drm_xe_vm_bind {
> 	/** @num_binds: number of binds in this IOCTL */
> 	__u32 num_binds;
>
>+	/** @pad: MBZ */
>+	__u32 pad;
>+
> 	union {
> 		/** @bind: used if num_binds == 1 */
> 		struct drm_xe_vm_bind_op bind;
>@@ -482,6 +494,9 @@ struct drm_xe_vm_bind {
> 	/** @num_syncs: amount of syncs to wait on */
> 	__u32 num_syncs;
>
>+	/** @pad2: MBZ */
>+	__u32 pad2;
>+
> 	/** @syncs: pointer to struct drm_xe_sync array */
> 	__u64 syncs;
>
>@@ -497,6 +512,9 @@ struct drm_xe_ext_engine_set_property {
> 	/** @property: property to set */
> 	__u32 property;
>
>+	/** @pad: MBZ */
>+	__u32 pad;
>+
> 	/** @value: property value */
> 	__u64 value;
> };
>@@ -612,6 +630,9 @@ struct drm_xe_sync {
> #define DRM_XE_SYNC_USER_FENCE		0x3
> #define DRM_XE_SYNC_SIGNAL		0x10
>
>+	/** @pad: MBZ */
>+	__u32 pad;
>+
> 	union {
> 		__u32 handle;
> 		/**
>@@ -656,6 +677,9 @@ struct drm_xe_exec {
> 	 */
> 	__u16 num_batch_buffer;
>
>+	/** @pad: MBZ */
>+	__u16 pad[3];
>+
> 	/** @reserved: Reserved */
> 	__u64 reserved[2];
> };
>@@ -718,6 +742,8 @@ struct drm_xe_wait_user_fence {
> #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
> #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
> 	__u16 flags;
>+	/** @pad: MBZ */
>+	__u32 pad;
> 	/** @value: compare value */
> 	__u64 value;
> 	/** @mask: comparison mask */
>@@ -750,6 +776,9 @@ struct drm_xe_vm_madvise {
> 	/** @vm_id: The ID VM in which the VMA exists */
> 	__u32 vm_id;
>
>+	/** @pad: MBZ */
>+	__u32 pad;
>+
> 	/** @range: Number of bytes in the VMA */
> 	__u64 range;
>
>@@ -794,6 +823,9 @@ struct drm_xe_vm_madvise {
> 	/** @property: property to set */
> 	__u32 property;
>
>+	/** @pad2: MBZ */
>+	__u32 pad2;
>+
> 	/** @value: property value */
> 	__u64 value;
>
>-- 
>2.40.1
>
