Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533E5C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 17:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F1B10E930;
	Thu,  7 Dec 2023 17:39:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBB810E92F
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701970796; x=1733506796;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=goZuZzXoedB54riPcfN4phWqyN6kQ3cytW1UzmMtdCw=;
 b=DDUj2Wg5Ka7ynDUggh6X4E+MDVlwMnD5D6uHSNrfescK7wzE8jN0xEVN
 MSV1QJh6strbY9ExOIj33tgbC2G4Oa6HlkWSOFeG/r7cUphIMRkLd927q
 PbHPvmQfXp7K9zuP/puaHd98yN2TBMPNqm1K3ZBugAK5BlOhQv4bCzjtd
 FGqtolRTeJgsRIrAfd0qBYrfQSWnOiiNRE2hK6ftkzBRNBxVoiQ1X/L4e
 wibzPhh3XU0OaaBQwGIyjCkZ3X15ZL9kCtopBhqHCSdz5Rt+qpuECGcUt
 QJon9crz1WJqwyruDVetWHy8S2U8zhVWESxTnLRsq7Ecu0clAyJyjELZ+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="398146992"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="398146992"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 09:39:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889821912"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="889821912"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 09:39:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 09:39:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 09:39:55 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 09:39:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5DpA77UDOXaEofKtcZCHn2gkyANtgMchuTLfwMwPRjSUyRNcCXF4XLlTkkVXQiWGPcYfSXpXCL300QPbIvG48P5iB0sfTPfeSXrN30XAeamG5unJnFo1lby5WleYNCMW0ddlyRQGhGsBCdOklvH7a/IVv7pXuWp9Z2C/szmixVtlbMPX1cQfbEFZHP1asiiDfC40r1CjCDiF0AJ1610L2E5GFhr09tlvATwqLvXRdHPs8Yy+PUiBWLS/mYkmZi9CM8VOpHHrwhFiu/MvvfOHcsAGSesItM4Wfs59tPTUKPcxS75pD/5W61I1cjrB05TIqBFwD0H+8HzjSELTZNKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osOjI1dlzc9LftzjrEEBZoWPziGNhpot0PXMCkMv4NU=;
 b=mInydH0HAXNm7J918VyNYmPb3Vp59W3/ixITrbRcFSqH6JxjqCP767Bu23xsbcxihTmqD++s83IF8n4mzoICbXJvEPOgChPbpaw3Van+wpkfPV3dsdRNS+gtqfTnShZhka4S0s+rKuBD5wLCgIdLMrUW+QzluniVvrObA/EnH9kyMJTj9r+dg7WiRJALjgcVVF+kuxhk5HGeLr39v5Cv1X08Vzt8UV4GfMhYztnzCRCz0hgISWgOiMqyRQQGEMHtPO0KWyAXQiSUOAph/ft7dKvE7gZ4cW+6woGhxUi4S6GbVuz3tOXLIB2e1PF2dlfl69/6u+4ZNKaz1qkVcDL1IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5104.namprd11.prod.outlook.com (2603:10b6:a03:2db::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 17:39:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Thu, 7 Dec 2023
 17:39:52 +0000
Date: Thu, 7 Dec 2023 11:39:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Replace the scratch pages with NULL PTEs
Message-ID: <doezob64676qpl72f3vyh7feeu6mct7nfo7hhh5qa3gtt42zsl@ndcroli2jlrc>
References: <20231207154423.35666-1-thomas.hellstrom@linux.intel.com>
 <dktre5juul24vbetvhi67r3n2gnlnjihppf74vddyrobxetxc7@5nha57x4mdwb>
 <301e0414-c632-dd88-b67c-87a3d24544a9@linux.intel.com>
 <la25ljwtfjk5aj72t77i6b7pdntaiu6ei7wlmafmrcxhkkso3x@kwc4v6xz5pbf>
 <654f7142-4c40-391d-503a-9e07d743a4ab@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <654f7142-4c40-391d-503a-9e07d743a4ab@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0003.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 80001865-d72b-4786-5ad5-08dbf74b84b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z8TjW4mO/4hk1Sd0WPe90nC4tRIFNxVKoLlsFGmSXPfDyfT8tj5/heQVtiHipfwb5TLprJfExDuU2K1QW8r+Uupv9j8UidmJ6+hH4FFLL2FtcMjd7ljWW5ztsNAf9MdtYwgf3LkmVZUR6m2ZCGNJHBjWpWQG1x6pucGB4mEXr2RSS4CmSqX8KB2dzDDA+OzXT9Ae0xeIWEbFOlYYF/p9xDj+9TxQHIwPQwOi6kOa65xMuW7CNfwgBHrCsAwnKyIHd5S62f+85bxV2on42iljUvJVIVyuR76qV1zlGRujfobnc8b0PPyWkZfvChH3QIPbNWs2RXXpkVZ27HGQN8RdNGpcQa3DCUvU4PJC8kodHxM5JohQ9rbvqjfUlsnGnVHQqbkfO1XM0h92bwtNNlj5qpi3TAla6h6+y009dFSbg0vPqk/cNVT2SuaY6yth+elx3wsusSXaM/vKLfodaGOHRZHu41MOINAQ20VqsfiMO6gcBYa33Lej3z078EMEGTIoJ+iNxb5UHvXpN0IDk7b149zfXhPTouE4eNlBDRV6ZOCK9Ke7k9YYKo0mQsdyIF1t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6506007)(26005)(38100700002)(66574015)(41300700001)(82960400001)(6512007)(9686003)(83380400001)(316002)(6916009)(66946007)(66556008)(66476007)(6486002)(478600001)(86362001)(5660300002)(2906002)(30864003)(4326008)(8936002)(8676002)(33716001)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?T0qfI+KRo2/RQDwgLGpCK4LBOjeZ+vOeGAQIqCnjtdXJqRxgFBKPwgvgfV?=
 =?iso-8859-1?Q?8Mw9uStbaKrJTrjybQNI8lRYeuh8506JBtvtIS6ozcjwWt8ype6LUUecc8?=
 =?iso-8859-1?Q?cJLp3ZnS6l5mh5MIyumZQl44PQBYslAm87Vrogwt+1fhudL8zDYpAyoNAT?=
 =?iso-8859-1?Q?q9zYgnaRPEpanQvgMqsVogdbEqtpK08B58wXPYcA8wDtFM0Hwh0DrdnH3O?=
 =?iso-8859-1?Q?A5NnSwRUW12VmKd+sbW0/89Tyv7wtW/B+YhAJHbIglI9cxYk5eC0KmlwHx?=
 =?iso-8859-1?Q?LBjwYeJuucgp14OUk1QlmbfVXyD1bK3aivdz48EKdfpyBNUqhPFBQ+R/Cx?=
 =?iso-8859-1?Q?6RYWdtWStWBWYR/dka9/QOeDRul3IijdwK6sMtapeSb02eO5WzwcNVc5Cj?=
 =?iso-8859-1?Q?Dpkg/ra8Snwbr44J8kaYSQqxiyNr5Zwfh05GhC/bmz92lh1Xu7KMAMWlVJ?=
 =?iso-8859-1?Q?zpCbUwyGYDTIqFPqsHF7Df99TuVL4NUTad3Gx4wmUrm0yS85OVEXn4g9yB?=
 =?iso-8859-1?Q?WnHtBhX29IeVIadnnY+3h+tt3zwQj1/1Mq+pEGP9yLSZuOAfBbHniAPywC?=
 =?iso-8859-1?Q?uypPAuSKoz9vHHBKErPq+3YU20MWD6p6F+JiPsswI+Gi70wrkR5QOPaPKZ?=
 =?iso-8859-1?Q?ypXdVFJ6fYE0vPAZvCmMDDxMYVukeleVF7jS8ycAtXaR3qfJQqw1RMIq5p?=
 =?iso-8859-1?Q?U6+UPGra9UFTYLJ60fSPOJpJeeOb+SZYKzM8WRuYJJWZE7f3z56Bda78ox?=
 =?iso-8859-1?Q?kmMHT3rli32kXf9eBoFgJCzW0YMps+Ob/aGRZ43+sAgP5fXkxBZ5YXeGWk?=
 =?iso-8859-1?Q?57HBLWqvDaQZZ0ZSNHaG9AJ9ydm5Ai72Xb5s4ufq0/3AoMAGjglQWipU4B?=
 =?iso-8859-1?Q?jmPgxvs/gkz+IBLv7J91F1DQACwyLuMErDERMnA3LApy7UKuS4jek6iV09?=
 =?iso-8859-1?Q?qTj7aszE3+JZWnikGs2wqp6XQIQ0cHVXi81IF2q9nKz9A8F7SIzDMwZd5p?=
 =?iso-8859-1?Q?GbUvJ5kninI/Jfx/Ad7S9DtOywxdDlTrAV50886toC6WY8Pno95FJf3mJW?=
 =?iso-8859-1?Q?+Z+kiBBFRcQCQgP3onx5gKF4/+UQ+QaJ9i0KIXjTBhi0z1rM7TIaJjCdQc?=
 =?iso-8859-1?Q?IQkMKnUuS0UD5AetzgTGkUJqMwYQh0cPIMtf62cpvkJRfyuruHdh6V4xlt?=
 =?iso-8859-1?Q?B+kJa6hBxSDM5XKQaDc6a8xJ2BbjpiYgTmPlDI7CO6Bqfg+pjCo0gNsz3b?=
 =?iso-8859-1?Q?YpgB6k9udzwTnUpdT2yi1qFJIviTPgQZiJ0zOUuhqoL+yZK6j9dv6Q7GAC?=
 =?iso-8859-1?Q?KXj0B5xaNgY74ty9vPz1npmlUupd6zlREIzetMXS948yKmQvp6sK+LpKx6?=
 =?iso-8859-1?Q?Gb1FeWDFRgJGBxyVvXRtzk7RucB9alYVXQfxUy5ll6X2CULKQB275Xi6RO?=
 =?iso-8859-1?Q?rIyoJpG2H/2AN9wrSVpZIyFESva7GNxuF52mszRAztySrvBRJIzHB0PH/9?=
 =?iso-8859-1?Q?id63rfG5lF8/X5xLOYVTrjnVv5y+K08yG9r5wZPiuFVl+FHWLlOxLj8vpV?=
 =?iso-8859-1?Q?I8eVhz779DI9lmAWHOUj4weqNKKjlE4qn31ta6X+qy+MY1/amzpkbCiXBX?=
 =?iso-8859-1?Q?FPyXjixQHDta9jygnxpU5ZmPqRDfjeMHtdydZxRsTB8d/BU1/XeLRLtw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80001865-d72b-4786-5ad5-08dbf74b84b8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 17:39:52.6139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idkBugExqxLwY0vGcNi5oFKc88Ud2V+KUCMVULpLqfHqvPRkKAwdDN+7ka0kFmKlXaMeuuEvVtzfG8PJmSvsxXOQdfip0kjNFhmvCqE9EdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5104
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

On Thu, Dec 07, 2023 at 06:10:56PM +0100, Thomas Hellström wrote:
>
>On 12/7/23 17:42, Lucas De Marchi wrote:
>>On Thu, Dec 07, 2023 at 05:25:01PM +0100, Thomas Hellström wrote:
>>>+ intel-xe cc.
>>>
>>>
>>>On 12/7/23 17:17, Lucas De Marchi wrote:
>>>>On Thu, Dec 07, 2023 at 04:44:23PM +0100, Thomas Hellström wrote:
>>>>>Replace the scratch pages with NULL PTEs that return 0 when 
>>>>>reading and
>>>>>do nothing when writing.
>>>>
>>>>but don't we want to keep scratch so we can check when things go wrong
>>>>and writes go where they shouldn't?
>>>
>>>The argument against that was that apps that incorrectly writes to 
>>>scratch and then reads back the same value wouldn't notice that it 
>>>did something wrong, and the case you mention would to some extent 
>>>be captured by not having a scratch page at all and check for 
>>>pagefaults?
>>
>>maybe... But if we have a null pte where we had scratch mapped, aren't we
>>actually masking the pagefault? What about platforms where we don't have
>>pagefault? Relying on pagefault alone I think would actually be: use a
>>null pte to account for HW prefetch where applicable, but don't use it
>>elsewhere, and only if we support pagefault on that platform. But I
>>may be misunderstanding to what degree this patch is replacing scratch
>>since I see you kept xe_vm_has_scratch().
>
>With the current uAPI we're by default setting unmapped PTEs to 0, but 
>UMD can at VM creation request scratch PTEs instead, they are then 
>resolving to a single RW page.

ok, I missed that this was opt-in and default behavior is not to map
anything else

>
>What this patch does (if it weren't buggy) is to change the latter to 
>point to the NULL PTEs that read 0 and writes nothing, mainly for the 
>purpose of (buggy?) 3D workloads that expect reading 0 if they access 
>an unmapped area....
>
>But with the default (no scrach) behaviour any  HW prefetch outside a 
>mapped area would cause, I figure, at least an unrecoverable GPU 
>pagefault or IOMMU pagefault, so I figure UMDs are typically expected 
>to over-allocate to account for that?

yeah... afaik they are overallocating to account for prefetch. At leat
we do that in igt and I know mesa had to change that for xe2 too.. But I'm
not really happy with that since it keeps changing per engine type and
per platform. Maybe we should just add a null pte at the end of a
mapping to account for that?

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com> on the direction
you are going here.

thanks
Lucas De Marchi

>
>/Thomas
>
>
>>
>>Lucas De Marchi
>>
>>
>>>
>>>I admit I haven't been following the discussions around scratch 
>>>pages long enough to know the historical uses for it. Cc'ing 
>>>Joonas for further discussion.
>>>
>>>/Thomas
>>>
>>>
>>>>
>>>>Lucas De Marchi
>>>>
>>>>>
>>>>>Cc: Brian Welty <brian.welty@intel.com>
>>>>>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>---
>>>>>drivers/gpu/drm/xe/xe_pt.c       | 68 ++++----------------------------
>>>>>drivers/gpu/drm/xe/xe_pt.h       |  3 --
>>>>>drivers/gpu/drm/xe/xe_vm.c       | 45 +--------------------
>>>>>drivers/gpu/drm/xe/xe_vm.h       |  5 +++
>>>>>drivers/gpu/drm/xe/xe_vm_types.h |  2 -
>>>>>5 files changed, 14 insertions(+), 109 deletions(-)
>>>>>
>>>>>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>>>index 35bd7940a571..ce2846d56b04 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_pt.c
>>>>>+++ b/drivers/gpu/drm/xe/xe_pt.c
>>>>>@@ -50,17 +50,14 @@ static struct xe_pt *xe_pt_entry(struct 
>>>>>xe_pt_dir *pt_dir, unsigned int index)
>>>>>static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>>>>>                 unsigned int level)
>>>>>{
>>>>>-    u16 pat_index = tile_to_xe(tile)->pat.idx[XE_CACHE_WB];
>>>>>-    u8 id = tile->id;
>>>>>+    struct xe_device *xe = tile_to_xe(tile);
>>>>>+    u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>>>>>
>>>>>-    if (!vm->scratch_bo[id])
>>>>>+    if (!xe_vm_has_scratch(vm))
>>>>>        return 0;
>>>>>
>>>>>-    if (level > 0)
>>>>>-        return 
>>>>>vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
>>>>>-                         0, pat_index);
>>>>>-
>>>>>-    return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, 
>>>>>pat_index, 0);
>>>>>+    return vm->pt_ops->pte_encode_addr(xe, 0, pat_index, 
>>>>>level, IS_DGFX(xe),
>>>>>+                       0) | XE_PTE_NULL;
>>>>>}
>>>>>
>>>>>/**
>>>>>@@ -135,7 +132,7 @@ void xe_pt_populate_empty(struct xe_tile 
>>>>>*tile, struct xe_vm *vm,
>>>>>    u64 empty;
>>>>>    int i;
>>>>>
>>>>>-    if (!vm->scratch_bo[tile->id]) {
>>>>>+    if (!xe_vm_has_scratch(vm)) {
>>>>>        /*
>>>>>         * FIXME: Some memory is allocated already allocated to zero?
>>>>>         * Find out which memory that is and avoid this memset...
>>>>>@@ -194,57 +191,6 @@ void xe_pt_destroy(struct xe_pt *pt, u32 
>>>>>flags, struct llist_head *deferred)
>>>>>    kfree(pt);
>>>>>}
>>>>>
>>>>>-/**
>>>>>- * xe_pt_create_scratch() - Setup a scratch memory pagetable 
>>>>>tree for the
>>>>>- * given tile and vm.
>>>>>- * @xe: xe device.
>>>>>- * @tile: tile to set up for.
>>>>>- * @vm: vm to set up for.
>>>>>- *
>>>>>- * Sets up a pagetable tree with one page-table per level and 
>>>>>a single
>>>>>- * leaf bo. All pagetable entries point to the single page-table or,
>>>>>- * for L0, the single bo one level below.
>>>>>- *
>>>>>- * Return: 0 on success, negative error code on error.
>>>>>- */
>>>>>-int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>>>>>-             struct xe_vm *vm)
>>>>>-{
>>>>>-    u8 id = tile->id;
>>>>>-    unsigned int flags;
>>>>>-    int i;
>>>>>-
>>>>>-    /*
>>>>>-     * So we don't need to worry about 64K TLB hints when 
>>>>>dealing with
>>>>>-     * scratch entires, rather keep the scratch page in 
>>>>>system memory on
>>>>>-     * platforms where 64K pages are needed for VRAM.
>>>>>-     */
>>>>>-    flags = XE_BO_CREATE_PINNED_BIT;
>>>>>-    if (vm->flags & XE_VM_FLAG_64K)
>>>>>-        flags |= XE_BO_CREATE_SYSTEM_BIT;
>>>>>-    else
>>>>>-        flags |= XE_BO_CREATE_VRAM_IF_DGFX(tile);
>>>>>-
>>>>>-    vm->scratch_bo[id] = xe_bo_create_pin_map(xe, tile, vm, SZ_4K,
>>>>>-                          ttm_bo_type_kernel,
>>>>>-                          flags);
>>>>>-    if (IS_ERR(vm->scratch_bo[id]))
>>>>>-        return PTR_ERR(vm->scratch_bo[id]);
>>>>>-
>>>>>-    xe_map_memset(vm->xe, &vm->scratch_bo[id]->vmap, 0, 0,
>>>>>-              vm->scratch_bo[id]->size);
>>>>>-
>>>>>-    for (i = 0; i < vm->pt_root[id]->level; i++) {
>>>>>-        vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
>>>>>-        if (IS_ERR(vm->scratch_pt[id][i]))
>>>>>-            return PTR_ERR(vm->scratch_pt[id][i]);
>>>>>-
>>>>>-        xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
>>>>>-    }
>>>>>-
>>>>>-    return 0;
>>>>>-}
>>>>>-
>>>>>/**
>>>>> * DOC: Pagetable building
>>>>> *
>>>>>@@ -1286,7 +1232,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, 
>>>>>struct xe_vma *vma, struct xe_exec_queue
>>>>>     * it needs to be done here.
>>>>>     */
>>>>>    if ((rebind && !xe_vm_in_lr_mode(vm) && 
>>>>>!vm->batch_invalidate_tlb) ||
>>>>>-        (!rebind && vm->scratch_bo[tile->id] && 
>>>>>xe_vm_in_preempt_fence_mode(vm))) {
>>>>>+        (!rebind && xe_vm_has_scratch(vm) && 
>>>>>xe_vm_in_preempt_fence_mode(vm))) {
>>>>>        ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>>>>>        if (!ifence)
>>>>>            return ERR_PTR(-ENOMEM);
>>>>>diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
>>>>>index d5460e58dbbf..6f7359ac55bd 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_pt.h
>>>>>+++ b/drivers/gpu/drm/xe/xe_pt.h
>>>>>@@ -26,9 +26,6 @@ unsigned int xe_pt_shift(unsigned int level);
>>>>>struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>>>>>               unsigned int level);
>>>>>
>>>>>-int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>>>>>-             struct xe_vm *vm);
>>>>>-
>>>>>void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
>>>>>              struct xe_pt *pt);
>>>>>
>>>>>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>>>index e09050f16f07..868b9a2a5d02 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_vm.c
>>>>>+++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>>@@ -1332,7 +1332,7 @@ static void vm_destroy_work_func(struct 
>>>>>work_struct *w);
>>>>>struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>>>>{
>>>>>    struct xe_vm *vm;
>>>>>-    int err, i = 0, number_tiles = 0;
>>>>>+    int err, number_tiles = 0;
>>>>>    struct xe_tile *tile;
>>>>>    u8 id;
>>>>>
>>>>>@@ -1397,17 +1397,8 @@ struct xe_vm *xe_vm_create(struct 
>>>>>xe_device *xe, u32 flags)
>>>>>        }
>>>>>    }
>>>>>
>>>>>-    if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
>>>>>-        for_each_tile(tile, xe, id) {
>>>>>-            if (!vm->pt_root[id])
>>>>>-                continue;
>>>>>-
>>>>>-            err = xe_pt_create_scratch(xe, tile, vm);
>>>>>-            if (err)
>>>>>-                goto err_scratch_pt;
>>>>>-        }
>>>>>+    if (xe_vm_has_scratch(vm))
>>>>>        vm->batch_invalidate_tlb = true;
>>>>>-    }
>>>>>
>>>>>    if (flags & XE_VM_FLAG_LR_MODE) {
>>>>>        INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
>>>>>@@ -1415,7 +1406,6 @@ struct xe_vm *xe_vm_create(struct 
>>>>>xe_device *xe, u32 flags)
>>>>>        vm->batch_invalidate_tlb = false;
>>>>>    }
>>>>>
>>>>>-    /* Fill pt_root after allocating scratch tables */
>>>>>    for_each_tile(tile, xe, id) {
>>>>>        if (!vm->pt_root[id])
>>>>>            continue;
>>>>>@@ -1465,19 +1455,6 @@ struct xe_vm *xe_vm_create(struct 
>>>>>xe_device *xe, u32 flags)
>>>>>
>>>>>    return vm;
>>>>>
>>>>>-err_scratch_pt:
>>>>>-    for_each_tile(tile, xe, id) {
>>>>>-        if (!vm->pt_root[id])
>>>>>-            continue;
>>>>>-
>>>>>-        i = vm->pt_root[id]->level;
>>>>>-        while (i)
>>>>>-            if (vm->scratch_pt[id][--i])
>>>>>-                xe_pt_destroy(vm->scratch_pt[id][i],
>>>>>-                          vm->flags, NULL);
>>>>>-        xe_bo_unpin(vm->scratch_bo[id]);
>>>>>-        xe_bo_put(vm->scratch_bo[id]);
>>>>>-    }
>>>>>err_destroy_root:
>>>>>    for_each_tile(tile, xe, id) {
>>>>>        if (vm->pt_root[id])
>>>>>@@ -1556,24 +1533,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>>>>>        vma->gpuva.flags |= XE_VMA_DESTROYED;
>>>>>    }
>>>>>
>>>>>-    /*
>>>>>-     * All vm operations will add shared fences to resv.
>>>>>-     * The only exception is eviction for a shared object,
>>>>>-     * but even so, the unbind when evicted would still
>>>>>-     * install a fence to resv. Hence it's safe to
>>>>>-     * destroy the pagetables immediately.
>>>>>-     */
>>>>>-    for_each_tile(tile, xe, id) {
>>>>>-        if (vm->scratch_bo[id]) {
>>>>>-            u32 i;
>>>>>-
>>>>>-            xe_bo_unpin(vm->scratch_bo[id]);
>>>>>-            xe_bo_put(vm->scratch_bo[id]);
>>>>>-            for (i = 0; i < vm->pt_root[id]->level; i++)
>>>>>-                xe_pt_destroy(vm->scratch_pt[id][i], vm->flags,
>>>>>-                          NULL);
>>>>>-        }
>>>>>-    }
>>>>>    xe_vm_unlock(vm);
>>>>>
>>>>>    /*
>>>>>diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>>>>index 9a0ae19c47b7..b92d8f54011d 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_vm.h
>>>>>+++ b/drivers/gpu/drm/xe/xe_vm.h
>>>>>@@ -61,6 +61,11 @@ static inline bool 
>>>>>xe_vm_is_closed_or_banned(struct xe_vm *vm)
>>>>>    return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
>>>>>}
>>>>>
>>>>>+static inline bool xe_vm_has_scratch(const struct xe_vm *vm)
>>>>>+{
>>>>>+    return vm->flags & XE_VM_FLAG_SCRATCH_PAGE;
>>>>>+}
>>>>>+
>>>>>struct xe_vma *
>>>>>xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
>>>>>
>>>>>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h 
>>>>>b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>index 23abdfd8622f..a5762e99e6aa 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>+++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>@@ -158,8 +158,6 @@ struct xe_vm {
>>>>>    u64 size;
>>>>>
>>>>>    struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
>>>>>-    struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
>>>>>-    struct xe_pt 
>>>>>*scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
>>>>>
>>>>>    /**
>>>>>     * @flags: flags for this VM, statically setup a creation 
>>>>>time aside
>>>>>-- 2.42.0
>>>>>
