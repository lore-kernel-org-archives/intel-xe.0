Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B43C46CD3
	for <intel-xe@archiver.kernel.org>; Tue, 26 Dec 2023 18:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EA810E0F1;
	Tue, 26 Dec 2023 18:33:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740F610E0F1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Dec 2023 18:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703615584; x=1735151584;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=c9g+GZe+jYOudZvf8rT6JAVwwxmyvqfgWtGHFHMlX5Q=;
 b=jt7r19i0c7KCw7qZl4mUHhnU40fUS3rlPymggAqbbdmFnhgNqxazN+0t
 EBSDtZBYoMnzuDrrvudr7LfhOi+ejiPzZtC/F3dr9yffltI0Q1wWAXGS0
 l1s8ByVw2WmkAa9IZzU7WBeFdN7FgQb733sO4neg89mic3H6L+nNznWed
 j5vJUKwEGnzjM2Jn1U73o7/EkCyiP6ILoDZKQHBEMgAzZpBgXz5522/g6
 gCo3wJujZAvilEGEPaefkQAbXH8TH+7GZNDaio7RIA/6ltwT9VtMr4BNv
 j8Q3r0/0uIkd2RPFb52RWz32eiwTizfYdn6XUay0yRmEr4d2erTbcq91O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="396104289"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; d="scan'208";a="396104289"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2023 10:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; d="scan'208";a="26359792"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Dec 2023 10:33:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 10:33:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 10:32:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Dec 2023 10:32:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Dec 2023 10:32:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ew0KjwkwazMOnHCNw8JiikdJNnR6g/MoAQP3zEPmRM1srA79rg/A/rKnFhG5cRDyjEW8NOA1oCbxU2e/JJHLs3wkXuAUbyPm0lsh79FRNBidcRCaFBUglqcKZfmC/qHOFFyl9Q3gK8E6ISd5LaemLLpHy4llKDCSYScODuvC504yQhRKappdz72x0Q9FhCHUId66d8bJwlp63Swe3t021LGyrUIR4JRrQCwn/techy6AOUSlrwmwu13c7ZXlE6ZcxCXrJ5P7fNWiqJk7fQqWuJV7qm0u5MmvQZUTz2QJlgS35zYyb5cIpuDvwC5zw7dzJNshvzzydLq7Ch619TscIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAgSld4Rn08Uq2nr41TIcODY0hMTJVHObkJhdgQKFSM=;
 b=ket2sp3ExVxEL/IPjCJjH+5A4ubi/vByuEEKQ0ZISjQJneQw38xBR9lWJoUdTcxAPMvEov5GhdtW2bVpWI2NbsJ+LmmJ7GgueoSnRAJ7R4ULNY2g/CFIsuYStCcf2bMqzk3JdfuUGfVLuSQoDB+h7W53eRybexpzZe+CAZumd7o++cz9UgM6mmpFa/mss3Nce189BXE0B+6SJzV5vgJVwjek1X5ktInjjMgfWiOyXsw2sjFaRlguLx+jRDoriRgZ/YUCdm6y+iBf+97zWrc/HWYPoSvWfSzRJe3+xFB7Ey6ZBnLKiKy/R0Lxqig6XpfYNpZHUG5M1JU40CmJYQjpzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Tue, 26 Dec
 2023 18:32:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 18:32:55 +0000
Date: Tue, 26 Dec 2023 13:32:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Remove DRM_XE_VM_BIND_FLAG_ASYNC comment
 left over
Message-ID: <ZYscVGNS0Mlxn0ec@intel.com>
References: <20231226172321.61518-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231226172321.61518-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c45bd20-c3ca-4185-33ab-08dc0641137e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3g8YlH7uJxU+MnbxS+BinII5zzQmy6VR4GjDRtWC1597AmQkApOvsHI7JvCNRtCSAdZ9N99p4Kkj4r0O4lHUEi3grVe4J/x3GfLK2r4WzNvNjJEzzB5a16BndDqTnDQ+cXXlkRmHCYcPPxPolvF6f3rUTvSS7xwZAV+8IsvoXgqZvXif45U3vh8x3H6V5GNiI5O3IMBR8NyGeD0uHNQ6aMc20EIevHZrA2ju4ATY0iyHlHAZKqxA5D80MXkzydMTBTrJMHAyvR1p1OoNAleoguW8OMZ97ME/9a0oAJ03+D9qtAKNK/5ul63uAIAlQERFAm56MdDMdJvyLTIOac5celo8/yR5gjD4TNAsj+wS7RHXkSqjShqGU1sHgKt4t+cMZNiu2lZ9vE1Conu9QIFvF5R+B1G/ChRef0KO/h0I3MA4BhRYC1BzZOD+4U6b7980MOjIrvNKxIl7p6caM5qA7M3lx+McBAobFqCvVRdqQDhJuI0ieINIrnrODpDOHNlEh05yR+zDXlRGd1BGXR/uiwWg4uNB0r2QotbhlkgDKh8Z1SX9L4FOYxzzt4W+hQHf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2616005)(26005)(6506007)(83380400001)(66556008)(6512007)(66946007)(86362001)(66476007)(37006003)(6636002)(316002)(44832011)(4326008)(6862004)(8676002)(8936002)(6666004)(478600001)(6486002)(82960400001)(38100700002)(41300700001)(36756003)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?64pVT+9fnDT4uWXsCg5ObwppInTtu7FrDMtn9dZ8i0zz1OitvMa2luac5s?=
 =?iso-8859-1?Q?SZAe/RX6k96eh8XWzNsLOda9UHVCFw0qmqSH2xQrCrYsdE6izVjIXVT69W?=
 =?iso-8859-1?Q?9faCWllo/0HenYDsn4OeolBXrM96MXVnYUYnRgMDrzHHaQIyb77XqKV3V+?=
 =?iso-8859-1?Q?QGZFAaXCVikG5uxXVBlAJKxZbkgVEIZwlBWxr3BgRPA9YFYcRwCQD8Kdip?=
 =?iso-8859-1?Q?HSyr1YmBbByQ3Rtv4FpUblc0jmlW4SGcHMHeOkHHt2tvH6C9tbFx0sWSRm?=
 =?iso-8859-1?Q?EgKhFrvkiUS2XQ12CKRsr8WrMfLqb+VooY2FtQ1CZSGHEivBMeWB1W3umt?=
 =?iso-8859-1?Q?iHnnZh0CGCoOruggBwBisXEBdySAkqsaD67h6Hmb5zC+AVFSJClKqG58XF?=
 =?iso-8859-1?Q?Voy4Zy4XZxrqwnx/KHTkIP8y2BptdzMdAWGT/AQrJXIG1TA9j071x9AfIm?=
 =?iso-8859-1?Q?4+2E6EZ33/LMkPMJnjZ88J/95sg20/mXV9tScoBWHHN5OF3XVGk+AqvJOq?=
 =?iso-8859-1?Q?ezB6UtzEBJfNbirD5cfpt+BduYjfEOlWw1tMhFVCNJ364PpTWyXxit/h31?=
 =?iso-8859-1?Q?YXbVKwWb9QePfQTLQt41AQc5Oz29LhL9z5cxkuom6iO2Gh7JhuKTzOcZPz?=
 =?iso-8859-1?Q?L+iIvN5P67lChWlqIO+eeB9FV3plZib9ARME0YFZH6m6Q2uXLEDcuUQpbB?=
 =?iso-8859-1?Q?dUs3MDEUf35FvO4X8sOs5RZrE0FIIFCteUfETEa4j/L5Th5heGVvKDzU82?=
 =?iso-8859-1?Q?GLw3VOavL7PfTn4w02TITrXV/haRIqoXw6m3KuB/BkhOhGVddsHt1t6psC?=
 =?iso-8859-1?Q?0g/HrL6CF+p2hxjDjuy4qwjrjdL4I6PIUehHPhBlbmbZ39YYqZ3ByVk4uj?=
 =?iso-8859-1?Q?1mexW51rim4PRSBYGtLuaFvG+UJgdILDpgd2vbz8PkjX9ZKwO5V6AYoXDl?=
 =?iso-8859-1?Q?kQ8hFMDViX8kOBwasERgsV/t/g4jxgKDse4QjKejwwFCqiliSyJc6NXpkP?=
 =?iso-8859-1?Q?XUKNJNc/p4jkp8E/VlfQSjTLRYkbjsK8GpwbFFEeCUvlOFORryKQSF2EE9?=
 =?iso-8859-1?Q?I87/WdqhSBz3K1MQj8bz/QcRkTGRpEpdxE7Nmfvw5kHVbwX/l7hFIWfL/r?=
 =?iso-8859-1?Q?AxBggQ0vvq5w/ndum0W/IPEo9iG0fXM6yRn9KvYVM5C3lFK1XyQGz4XOJu?=
 =?iso-8859-1?Q?EWqms2VtvT9DtPgvT08WYmtJNWmpEuW5qg7tmdydySTFvDaojRsL13Mc/j?=
 =?iso-8859-1?Q?3uzdwNkQlfITFtSwPof5tzECaFPyv/DMHwILy6Z2kERaqXpx/T0DMJLwbW?=
 =?iso-8859-1?Q?6vGd4/7J713mfxfSuORgCYZ4795bCJqHNKz6kQEzdtudX8i8MV6vv+LFrU?=
 =?iso-8859-1?Q?vruQucRh2Cf6aZbK2GCklCp0VzMlWDJ9lcbR1MaP+U0Xb+pkmw33Ao10cp?=
 =?iso-8859-1?Q?3zV6r6IAcmp/Ltwd/v3+fBv7Sgfk1WGcdn+di5G4sPfNriezpnhC5vr2FX?=
 =?iso-8859-1?Q?irs69bzJuFINoUskAMVxBNJP7nM+NlMSAAOBbx7XZFceYCEUC2ym3kZc2m?=
 =?iso-8859-1?Q?C9Q5jvfXQGQn5k7RPl3mRTJ8m62ljxnuwnftnAGyl3WgsZPrjMqCAf8F7T?=
 =?iso-8859-1?Q?unGCbI3eDe/9ie5+lZatyQf38CmW22cVVjBxWNjwQUceuehjRPBK1mCg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c45bd20-c3ca-4185-33ab-08dc0641137e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 18:32:55.1789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKXT3b1n93eAE55jIyNUNTJlz5tOr4ggzAGsJNpLBx1gt0Mk9UjW3YEVof40WlErKkrpQaRXA+lGyCVl+2G3SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5634
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 26, 2023 at 09:23:21AM -0800, José Roberto de Souza wrote:
> This a comment left over of commit 52b226320b63
> ("drm/xe/uapi: Remove sync binds").

d3d767396a02 ("drm/xe/uapi: Remove sync binds")

> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Fixes: d3d767396a02 ("drm/xe/uapi: Remove sync binds")

With the fixed reference above:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9fa3ae324731a..50bbea0992d9c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -832,7 +832,6 @@ struct drm_xe_vm_destroy {
>   *
>   * and the @flags can be:
>   *  - %DRM_XE_VM_BIND_FLAG_READONLY
> - *  - %DRM_XE_VM_BIND_FLAG_ASYNC
>   *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
>   *    MAP operation immediately rather than deferring the MAP to the page
>   *    fault handler.
> -- 
> 2.43.0
> 
