Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693F8C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 22:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BAD10E572;
	Tue, 16 Jan 2024 22:05:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C9710E572
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 22:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705442725; x=1736978725;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BFpKXoRuEBm8jmKNfgbRj57z/x8aqZnjI9vpmIrVfqI=;
 b=CrrsS+i/7xucX9qnwy/FbbHOhg7G5k4g0Befu9dqMFbC9pCdzGzzfQd5
 uk6yYTNdj0k+ZGEGiDR5uwu9gxKww+eVvQDX9P35TVRhBT8XQHzw9BuC3
 vjywxtUI+/yGV0eGqzhW1Hi5D3KBzAJ3vL/OMW86ilO/xaKBmihK3u+g3
 2V5XWIwJMGMP7gKfmijp/ACsnaUDKVtoYxUtpozs/6Z4z8KLnmcsrmfHh
 KbXTKnLFXJtm6BVUNPjtTNI3AQ2RGqoakmAueVTW8yzOkpIqs1wBc0Sm2
 k5CGPlIf8XQDgn0dFOzgghWvycQVFxB/W0pwIaapdyRJdYP1/jDrJzxTw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="397157967"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="397157967"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 14:05:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="733741127"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="733741127"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 14:05:23 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 14:05:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 14:05:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 14:05:23 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 14:05:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yb4qq9uw/8kuJFReMQ3arhGaiuWFJ/V8lAezjNNDoIAoxtk1wnpdWX3SsDQFZeQwIIOdfde4nUmGZXoqZj+sooTSyJLFvY17iaH9gAdmIxwYq7p2y5qFHyWAMliJwoAxjeMkBsygEmx/5xDiDQUBLsapbVFm7ypiGVMQUijkoxS8E7g+MDcuAbJqer4XVzfzW/XUoEyq8PKLRYq/IGeAeRkhzod9oEM3ieuwUyRjEK+ZUJBcTZJAKZoiX9I+DqZmyRwKO2g0kYzidEVitFxbr5T1lzcjk2DGfoOK0PwhmFrRpHDsKamp1J7rEXlu0oWyBqjBru/bSiHuVY9xFZKCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koJeI9MvQhXhxAc9itn0WnwxSc/AvUPMuXtHbDtjWf4=;
 b=PwhxLAp2dU3Vq/fXjE7dkWI09difM4zjNz4l8Z0TlEuavN2r0hXSNylLDX9AFkn0QYhAKql95e4lxScz6OYp2q4zNv5c8Rk2+f8Lm1uhhBlOb7pSNkCIoEptIi8HgJ5W7B/ix7Yuhw3QMA8OrYFOmB6elt4WLxR+Kq2MTPn7EFq/xOqWdDnLmkYOqcegnfRj4VV+K88/V++d7m9EATTR3OrAUdHVr8dChUYBDbiN3XBmLi65+VS8iWfBDyPgqVptL9uhFUYtAHAgBFC0xSB/KUHNvRgCFaISRaa42Ue9kIWnNcl+yqYsKulgMA/sk7mdR1ZboK0r/9y3CZyB9z71fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5901.namprd11.prod.outlook.com (2603:10b6:510:143::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Tue, 16 Jan
 2024 22:05:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7181.015; Tue, 16 Jan 2024
 22:05:14 +0000
Date: Tue, 16 Jan 2024 14:05:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe: correct the calculation of remaining size
Message-ID: <20240116220512.GH45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116200424.651661-1-fei.yang@intel.com>
 <20240116200424.651661-2-fei.yang@intel.com>
 <20240116214826.GG45138@mdroper-desk1.amr.corp.intel.com>
 <BL3PR11MB63622A95EE4D70D9B4F47D249A732@BL3PR11MB6362.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL3PR11MB63622A95EE4D70D9B4F47D249A732@BL3PR11MB6362.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d98b8a-a22c-4942-f503-08dc16df37a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j/KX87ajdXPbtMUQZV5WA6dKuF3Y1wp7m3GYYrV5JdPilLIG9C9csFakCQAmyVYCjWXU7a1G19VuVIaDlMQD7oZwjPLFZFPx5KU8xG3oC9uDeK0WxvS6oAk9VC+KBxWDYXqfqlp4MCbc9PQfOdvqlat/fO+WyQIw3UyNT1TIz4WNRyfjfHh78Bug4jnrlc2nNzSZH/3x4VLmB9TtTvc4IvK7gTePW/oLRRYHLCXzsluxQo0KxQecDbGWEKd7OnPFU8lb5Ms0hhXc13wS6o+JFGy2uUh4A6J1Ij+rkOrg/Nzp4+nYVz9ZI/Fqp4MNDe7+g/TkvHEF7yNHJKlTtOPk7Fa+M9srrVTF2TLDWm78XDGsx5LqcAu+TxP4BmYmtl497Q3ikeVhs+kdrKxRtZnrcvncJz1qOuN6JqJLrgvfpHsWWtxd7jbNazGsv/uQTjT7Eenn/cki7pxzeTXUlLPpFmjTtqB0p8ZNHHq/0TcJgxK8SM1idgMvjEtMrbqGw7LsT2lked5+b2cy5Quy8XTHUM+RwAsLGbN0q7fmHvQY5aQaEVW9C4pVuoU00x1Z6vlB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(376002)(396003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(83380400001)(26005)(41300700001)(5660300002)(6486002)(33656002)(86362001)(6506007)(6512007)(6862004)(316002)(66476007)(8936002)(8676002)(478600001)(4326008)(66946007)(6636002)(66556008)(38100700002)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vOw3/Q9QeZ3QIJP6Q4hC1P2KoOCRf5C4bdzgEe4/DvbruIEFy/UNJwd9vO+S?=
 =?us-ascii?Q?SsXt16j+mlohGho3evX5EYR9xG7yx4oXUWR7E8o9Jq3s5kqAt3VlHhruWjUn?=
 =?us-ascii?Q?QzLNZpq8YoCGsahQ+lhWrFj7C6jz+k7t0L0kg2Bub295771qhcYDLzLYS5UK?=
 =?us-ascii?Q?g/JV2KxgGVPfYTsaX9j5TfPeomhaklEFOBSnrlNx44y3D9UqLhV0wRPEmDSu?=
 =?us-ascii?Q?jLxPj02qMSOiqv0ct4VD5vNlVQ6nj7cvffeaCwx3n7jHx6eoqDy0Ha+C2vZo?=
 =?us-ascii?Q?7z1nMjF69RXIDAgImnVPdCDFbNFfh8P3VFZvnKs2guQucPBW02XWYe9XJijI?=
 =?us-ascii?Q?G2V+yuzj+fN3tI9eb6tcW0iWnpOniPByNPCDKTLEjU66AYyLww13/2ApOAVO?=
 =?us-ascii?Q?eYXEBtyK4G9RqH351HTBKxFMNXynpLQnpp7XnVNSr2JqG1Lntrx+32IBvDS0?=
 =?us-ascii?Q?yVpgxlqIi/Xepzdwszj/nDNMQ/bIIKMoKFty4WcdKLKto4/zqsZcd0zhc/93?=
 =?us-ascii?Q?OZb9rRIKC8rZS70cebxT9WTq4eLFLYlWjL9RXtDugmAAMK/mEzd5tmDtJ3GS?=
 =?us-ascii?Q?TnAbvmVy69xLNGQufdEM5I3aD/HmtNORmwEdZjxGD/Sbkm3ySwIs21tPlhqd?=
 =?us-ascii?Q?WSjxw1PZSKCCDUH3mMKTaxk/y9vnP65ba/5azCjHuVelklQeXV+bblQb6qhy?=
 =?us-ascii?Q?gGxcZCwCK5kGO1eRHj0A9XInl2pBh8A2AOmYpJ9MLBuzx5sNV4zK1vSF81n5?=
 =?us-ascii?Q?OcKdJdyHi4gR0F9eeFsZ/OqwnlnlfkOpe1nszSADhj0pyjTv/pEd25PWFX2i?=
 =?us-ascii?Q?SZQJfpvv1MjnDDCFMi6X7d57cx00gvVuEwK/0BnTUbTIIc+sbC/GuqWzEGL7?=
 =?us-ascii?Q?+veCnVzznFgSpw0PrvKfEEmh5IORLBOkO4FWq9v3W/WLHAutCfdPGzOeZlUe?=
 =?us-ascii?Q?Skwiu2moR+Mx/GmuF6O1+kqMtwREuMu3iFBgybG1vVuFnfVMF07u7Zb9T+bj?=
 =?us-ascii?Q?A/80//iszI7FDEbWQ6002se84WdVOjAT3t0K8wKxztBxt0SPWA/zfpEyZ5HA?=
 =?us-ascii?Q?/hRJU6Yi3x4KDwoinxSyxWTrfHRspKjyPTKXouEuTILGI7AfIDySv/bCAXoZ?=
 =?us-ascii?Q?XRTsef1t1yPZZSznqV3FMPoYlm69H1tGaRpEOwUM5l62NCAE6nN7JcfO2WcT?=
 =?us-ascii?Q?Z9BaKNc5knq0LMRl+zo6Ru+VFrl6MBfJwadi4+F1/ZszZFwGHYTwSWSQIhmU?=
 =?us-ascii?Q?skrzWJVeX1oAJ79VbV3L0X8HJ3F1O4yBE4Cb1zEQ8BTMIDq5t/IaGfxU6cDp?=
 =?us-ascii?Q?XHj+QJQRFZqaHbJLD778cl17N9RqbPBt9QMS92/kqf25ihSP8/GFl/P7xg4d?=
 =?us-ascii?Q?DOyPeamp8bSZ8VUAaVZTaxJZsoKWOvBQ7ZSmDYUSSCfVdGYve+4WnyStd8C+?=
 =?us-ascii?Q?Ni9e3B+JiOJXOa6gdrE6atdwJll/meYPJIy9kSAT4F0J+LiQewXwpmQqFF38?=
 =?us-ascii?Q?F58dD5K/AjCszcca/EarrASFk88JdoVnjP9TeWjUwjdnHveW4hwOJF/I9+RX?=
 =?us-ascii?Q?eODykWpMWn+ojxg5J8O8rwynBoF1R8S5W4UWbWivDai7Exk5d11kYumT4kMF?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d98b8a-a22c-4942-f503-08dc16df37a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 22:05:14.8634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIpWzceM3C9NVYNJRq/7NNrExUzF+fd1vw3/pRkTSGnVZHAv/2VfTLCs+LaPvTSHE9MA01YQBbXhZ96CFw530inFKvoFXDHzOEs1+44uCh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5901
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 01:59:22PM -0800, Yang, Fei wrote:
> > On Tue, Jan 16, 2024 at 12:04:24PM -0800, fei.yang@intel.com wrote:
> >> From: Fei Yang <fei.yang@intel.com>
> >>
> >> In function write_pgtable, the calculation of chunk in the do-while
> >> loop is wrong, we should always compare against remaining size instead
> >> of the total size update->qwords.
> >> Also, when performing dword writes, dword length can be any value from
> >> 2 to 3fe, always adding 1 is wrong.
> >
> > Always adding 1 should be correct.  This field holds the number of dwords
> > for the instruction as a whole (encoded in n-2 format as it is for all GPU
> > instructions), not the number of dwords being stored by the command.  The
> > instruction always includes three initial dwords (1 for the instruction header,
> > 2 for the target address).  So if you want to store n dwords, the total
> > instruction length is n+3 which means the encoded field contents are n+1.
> 
> But according to the bspec, what you said only applies to qword writes (bit21 set),
> not dword writes. So, MI_SDI_NUM_QW looks correct, MI_SDI_NUM_DW is not.
> Am I misunderstanding?

The bspec's note about dword mode is saying that the 9:0 *field* value
can be anything from 2 up to max (aka 0x3FE).  It's making the
assumption that the reader knows that the "dword length" field of all
GPU instructions is always encoded in n-2 format.  So the number of
values that this instruction can store in dword mode is actually
1..0x3FD.


Matt

> 
> >
> >Matt
> >
> >>
> >> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 2 +-
> >>  drivers/gpu/drm/xe/xe_migrate.c                  | 2 +-
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >> b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >> index c74ceb550dce..415609b070fb 100644
> >> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >> @@ -36,7 +36,7 @@
> >>  #define MI_STORE_DATA_IMM           __MI_INSTR(0x20)
> >>  #define   MI_SDI_GGTT                       REG_BIT(22)
> >>  #define   MI_SDI_LEN_DW                     GENMASK(9, 0)
> >> -#define   MI_SDI_NUM_DW(x)          REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
> >> +#define   MI_SDI_NUM_DW(x)          REG_FIELD_PREP(MI_SDI_LEN_DW, ((x) > 1) ? (x) : 2)
> >>  #define   MI_SDI_NUM_QW(x)          (REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
> >>                                       REG_BIT(21))
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> >> b/drivers/gpu/drm/xe/xe_migrate.c index 44725f978f3e..d5392cbbdb49
> >> 100644
> >> --- a/drivers/gpu/drm/xe/xe_migrate.c
> >> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> >> @@ -1116,7 +1116,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> >>      do {
> >>              u64 addr = ppgtt_ofs + ofs * 8;
> >>
> >> -            chunk = min(update->qwords, MAX_PTE_PER_SDI);
> >> +            chunk = min(size, MAX_PTE_PER_SDI);
> >>
> >>              /* Ensure populatefn can do memset64 by aligning bb->cs */
> >>              if (!(bb->len & 1))
> >> --
> >> 2.25.1
> >>
> >
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
