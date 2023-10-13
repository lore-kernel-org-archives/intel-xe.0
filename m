Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282F4CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 17:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D2710E060;
	Fri, 13 Oct 2023 17:50:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D58410E060
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 17:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697219450; x=1728755450;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LGntmXd85sEVlx2PfWLJTzqbdcGVwfy9N7dePT1FRUI=;
 b=TJrmHSzeXNnP9HuKDn1h/XkRgOXLPwpWKUg85rYZLuUiEh0VhxNO/yYu
 +MEm1MHLqQGuPqQAya0seuoFG71Xa4mf9jBsbzv9o+fVcppcPC/oO/0iD
 gVAu9+NtoOLo+HYlQMdrQh9F94JhDUQ6Rm80kFKyqRpWFBzMEge6qZRIs
 gl5hw9IyQcMhmFSWYj80Y82QT6I803kStmuYY61pF+AovhTRy0apUZ8I5
 dRivM/jdZjR4D9L0vGsntiwyNpmAwKl/d+1b/tqHKZhQiWjzHlyXRoNld
 /GcwwYwmcu1JcUMUlOKoXVbbxaRZ9+d+Mgydjd9zqtqCyusA58954cQHi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471462842"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="471462842"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 10:50:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758568348"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="758568348"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 10:50:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 10:50:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 10:50:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 10:50:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 10:50:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2h7oPXNdK4PRA8Ha64bDBI0ZASu9vlF4ye3zPUByt1o36h/c3+dFI1GG0F6Sp/k7u4qiHKtE5Y5ng8ZDrIgQyaKktuPcHXVULxSS8fSm4s87w0NJQx4Ft7c2nSU2suaOsUM6WmuCyXQNX1jbJY1ePbBS48FYJSA9l0p+BxPzRTO5wXXp0OIEbJ+3lNrqhpO1DkZFybifSK9pZyB476BJlzxC36GLyOKQFRC+CbKgeeQsHZTULGFNBZw9d4inTsscQgoSEr8P6lscwkIeSUlNkOOXJ7uJYMjot9/1RJ7LLTEddDDEJBk9pZcf5TZyDxvvxihSgBQa8qI1pvwTowuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGbJDVvUhpBJFg5c3c1TXimcQb8eDbqHDpHtOZghdA4=;
 b=Bk1QKvG2R76KTyKF4ZeafRLVWKUz5S70onsBEGXKM3a4lXuxxgXNuR3Ohg0RxJ5296Y/U5GHTUSD8+/QYa8fau64AU1mfQUMbT8NyebflmUpzrrTP8tkK+HRPtXFwGLVTg84taR01J7ImQkD85ssoj2rzAjaPBwAVNe44IRIH2ERX6L+zqCb2w8E4NvcFLzae1MD1RK13oMM09hWn8oZC4OOG2zYLHh7mcN9AYO6ruDaYt3VJbYt2cHwph3EtU0HX7SLnwDFFK+AJ6BC88GKK04S7RLBzM5vJhnRVi3Lq+QnAhuM43uID6K9UNCGUYodrHx196s4s9NqjU4+fT5YDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DS0PR11MB7410.namprd11.prod.outlook.com (2603:10b6:8:151::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Fri, 13 Oct 2023 17:50:45 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 17:50:44 +0000
Date: Fri, 13 Oct 2023 10:50:34 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZSmDahQtHL5Cgi+1@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919161049.2307855-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DS0PR11MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d07777-73f7-4861-d97b-08dbcc14ec9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IETDKiWsErWlKb3X+WmMBl5qbdaJQZb3kdFvVG2SfC6yKsa+CvTWzzT9EkFKr7GqLpx83EKHv3HpSsdQCjkNjFXTR5GMOysmouua8seKQuusLlXjx0i/+BU0CbpIW6x5CqNm4Vz7uEO4EAGThNi6N8Mh5p/jia9OB/Zr5u6GRWo2f+fuHgFgg4hX/o3optWydpa3kGfR/8ek3iteotodQX0HOMm9F6lFk5jkEu7xmMMUgDISZ0xlhfIy38yGr9jcwUqc8qs1BFkbkY6ILsJu4z+bM25rCGXdCMD6DAv9qpwI/z9GCF1QOnVirVTSD9ThcotvaIRniYtiG81DvTbz0mdshCU5wvb3P87s3uAzxty6X6+APTZrJtAPiyFXvnB2tgghg6MjUTAyqqIQ+MYWEy9xRN6YenVDUwJdfNExuN/cMmF6sQgY0am1iE4cP7EKJdhI0DYuJKtJV223JK0Wo7SOnOyuAjHCWoaDWxySew1FidOZ0B63X6H08UWT0Gsjd9At7PaOCx3D21n8kbUjV1G1UKT8xm8mq2aA3c9khW2VpUHTApMpeaTDLTXOAduE1J/uBhq0uYoMQr8Am9cWgPl0M3KdyqGbN4rGv8Jwwio=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6666004)(33716001)(2906002)(478600001)(6486002)(30864003)(6862004)(41300700001)(4326008)(8676002)(8936002)(5660300002)(66946007)(66476007)(316002)(66556008)(6636002)(83380400001)(82960400001)(26005)(6506007)(6512007)(9686003)(86362001)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHdRSEk0QWdUdjVqM1RETGd2bVQ0dCs1ckhhbjdoeEVySXZxTUpYSDNlb2Zl?=
 =?utf-8?B?aksyd1kwZG5WVFM1bThnU1FIb1ltTktDRFZ5bEdRNmZWTWpieSs2YlRVaHJr?=
 =?utf-8?B?VnNFUHdGRFVxWWVseFl0cGZjYUVYWHdKczZ0UWE4YUx4dHplYmRnZmV5ckcv?=
 =?utf-8?B?T0dyUEtrTncvWlo5elZzL0dINHpaYWNYelZpYUkwVE5ndVFFWGs1Vi9hSkgr?=
 =?utf-8?B?UW9tOTJLYjBvS0lVOWl0T3FuTTVhbFlaTjhqVHpoWDgyNkE2dW1teWhxckZj?=
 =?utf-8?B?OFZnNWFWRCs5dXJnL1JSODJDeXVza0pHZmpLbS9ETHdhNGp5Qm5tV1doWk9E?=
 =?utf-8?B?QVFYMXI0RVd2RTc0bWxFVks4cStUYlI0K084VXRGT1pqaVhnWW1BbW5hSHRC?=
 =?utf-8?B?b2F6b01telZLR3h2VXVnZS8xNVJseVprb3hLRFlXY2VLU1hDSmdXdW43K2Zr?=
 =?utf-8?B?SkVubGtnRFlOVHl1Q1I0VmplNm5vVUY1S3pVTmJIYzl0c1RGTWZoaW5pRHFo?=
 =?utf-8?B?bWFRVVM4SlhZQ2VRTXloblgvOWZmUnNJMUJ5Yjg5R2ZpZUxMZFUzbXVoSjJT?=
 =?utf-8?B?anh1REhlN0RLeWRFTUdmQldBT1F3Wm9wc1M2NDlPMDAwd0RNTGFtUjVHY3pO?=
 =?utf-8?B?b3NiQU5TVkxmemc3aDRqaWpRQW5xRVdKcS9ScEl6SS9aVWkwWmxCaG5nM1V0?=
 =?utf-8?B?Y3Z3Y2dndVBZeEVUbjM5RGxBelQyQjkzcEFxTUx0bnBta2lHbWJ6UG9kM0Y3?=
 =?utf-8?B?NW1nNEc0RWxnKy9PQW9PL3k3K3R4ZHNhb2phbTROWjZVUnhNRUlCcGpyeHVy?=
 =?utf-8?B?Uk9tMk9Jb0phd3VTUEpSYlhLVFdZaWthWHdHR3hsQnQyK3dqRUJ6L3h3b0Rv?=
 =?utf-8?B?OWlGWVdlRE1ubEgwWHNkMnRwdzRXMGhuenR5R3JlRHlCdGMyRkFnaWlRMWRY?=
 =?utf-8?B?NlFBdDh6bGgyS1dVRDFVWU1ncldSeVZlci9KVXRYWitFTlA4RXdDanR5U1Uy?=
 =?utf-8?B?UDFUUnlrcDhmWmNmL0NTZTc0MFFaRTZSd1h5UkR4M0F2Ty8rYXJiNitvSDZp?=
 =?utf-8?B?MHNrRWk1TWEvK2xUc2VJdFhibzhGUVJ2M2JudHFYend6c2pLYit1UTBsemJx?=
 =?utf-8?B?Q0F5dXdqbVJzYkFXVzVRVExQRm0zTU1ZTXpJVnNkcFZ0QUo3WTUwVERONmNH?=
 =?utf-8?B?VzliaUFDOXFTOGo4Rk0rcjUxZWFMaEVBNEVTdEtxMjRKVWlzUjkyVkVJbEw2?=
 =?utf-8?B?clIwczBxTlNKM0dUSWRHc2V6eEFkbjNxN1lNRkVLdmtpZ3M0YXVyNlgySVdq?=
 =?utf-8?B?L0dKNU1hSjkxZ2RMUXNlOVV1TFp4TGpYcHFkaGk1N1lYV29uOEUweEl5U0tZ?=
 =?utf-8?B?cE1DUDhqdFVzY053Wnk1ZEtlcWpMeGRZUUxHblYxUjFQdGVCbytXVlpLQ2I3?=
 =?utf-8?B?aW5yN1FwZkozaHJkR2pmWDdVSWpldHBmR0tsZmlUY0JsMjRsRjFkaDhqZUcz?=
 =?utf-8?B?RWd3TnF6amlDWjVlajBDd2E2U2NoODllQVZCMy9STUxrRnI1ekY4eGszT0M0?=
 =?utf-8?B?TGNHVDVqUTQ0djFlK0NOVXlNcUxKV1ZyOVpYVkNnb3l3cWc1RFIzRng2UlNV?=
 =?utf-8?B?aFhGKzQxcHdiTmdicTg1bVhkcmlCVFRjSVAwV2FvQnNXWDdIVXQ3QW83WGYz?=
 =?utf-8?B?TkE4ZlkxbVNpdlRmLzJUUm9VeFd0STl4dXpFSjRQL1Z1YmpsRTlpcnk2b3lU?=
 =?utf-8?B?Tlg1RCtXSnM3Y2ozS25aMzNTVllQbi9OK0pya2l4TU9GVm5YaVNpTU5wcyts?=
 =?utf-8?B?YndBaElFSlAxYThQSEk5QlJkeVY4bGRENEtGNllMcVJRQUM5aDdkaFBOMjFq?=
 =?utf-8?B?ZnpZRTVNbnpFZUo1S2xUdkVOTERtVWh5bCtrWVJGSE85cktGWERjY0s5a1hi?=
 =?utf-8?B?OHlCWGNXOVFYMG5XNkkzWk56VXFMK1duUWpUWGRaU2JEVjlVS2plVjlQdlFu?=
 =?utf-8?B?VXhlTlJxNThjaTFWdzBLVExBdnlCTzFGcDJPdFdlM1ZDQ3pOY1lOVUJORm9W?=
 =?utf-8?B?MVJQQ2lweHdxaVQ5Uk5pRnpMS2hCd0lmdk9GTlhHM09JbUFEWHZSU3ROUTU0?=
 =?utf-8?B?SzBnYmdQZTd6ZXlkSFdJK3ZFQys4cHZ6WkxjbHFXVjZQS0djRGo1dUU1ZmZ3?=
 =?utf-8?Q?UAKKq/3WJlmJ+f+CXNlCS/o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d07777-73f7-4861-d97b-08dbcc14ec9e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 17:50:44.5661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15x1ItZft2GUuQKg6PqGfQe6DPlBmFOkysK6kl/o87tq3vteB+xFXPv6RystPh19qe7ZyfVRmM3c0DD4XxO1hLsqygQqTwKVBldOjbPmqqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7410
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/21] drm/xe/oa: Module init/exit and
 probe/remove
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

On Tue, Sep 19, 2023 at 09:10:32AM -0700, Ashutosh Dixit wrote:
>Perform OA initialization at module init and probe time:
>
>* Setup perf_stream_paranoid and oa_max_sample_rate files in /proc
>* Setup metrics sysfs directories to expose which metrics configurations
>  are available
>* Setup OA groups which associate hw engines with OA units
>* Initialize OA units
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

similar to what was present on i915,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Umesh
>---
> drivers/gpu/drm/xe/Makefile             |   1 +
> drivers/gpu/drm/xe/xe_device.c          |  11 +
> drivers/gpu/drm/xe/xe_device_types.h    |   4 +
> drivers/gpu/drm/xe/xe_gt_types.h        |   4 +
> drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
> drivers/gpu/drm/xe/xe_module.c          |   5 +
> drivers/gpu/drm/xe/xe_oa.c              | 309 ++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa.h              |  18 ++
> 8 files changed, 354 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_oa.c
> create mode 100644 drivers/gpu/drm/xe/xe_oa.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index cc95a46b5e4d3..a40c4827b9c85 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -84,6 +84,7 @@ xe-y += xe_bb.o \
> 	xe_mmio.o \
> 	xe_mocs.o \
> 	xe_module.o \
>+	xe_oa.o \
> 	xe_pat.o \
> 	xe_pci.o \
> 	xe_pcode.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index b6bcb6c3482e7..2c3dac6340f04 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -25,6 +25,7 @@
> #include "xe_irq.h"
> #include "xe_mmio.h"
> #include "xe_module.h"
>+#include "xe_oa.h"
> #include "xe_pcode.h"
> #include "xe_pm.h"
> #include "xe_query.h"
>@@ -323,6 +324,10 @@ int xe_device_probe(struct xe_device *xe)
> 			goto err_irq_shutdown;
> 	}
>
>+	err = xe_oa_init(xe);
>+	if (err)
>+		goto err_irq_shutdown;
>+
> 	err = xe_display_init(xe);
> 	if (err)
> 		goto err_irq_shutdown;
>@@ -333,6 +338,8 @@ int xe_device_probe(struct xe_device *xe)
>
> 	xe_display_register(xe);
>
>+	xe_oa_register(xe);
>+
> 	xe_debugfs_register(xe);
>
> 	xe_pmu_register(&xe->pmu);
>@@ -363,10 +370,14 @@ static void xe_device_remove_display(struct xe_device *xe)
>
> void xe_device_remove(struct xe_device *xe)
> {
>+	xe_oa_unregister(xe);
>+
> 	xe_device_remove_display(xe);
>
> 	xe_display_fini(xe);
>
>+	xe_oa_fini(xe);
>+
> 	xe_irq_shutdown(xe);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index a82f28c6a3a01..8161407913607 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -17,6 +17,7 @@
> #include "xe_platform_types.h"
> #include "xe_pmu.h"
> #include "xe_step_types.h"
>+#include "xe_oa.h"
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> #include "soc/intel_pch.h"
>@@ -365,6 +366,9 @@ struct xe_device {
> 	/** @pmu: performance monitoring unit */
> 	struct xe_pmu pmu;
>
>+	/** @oa: oa perf counter subsystem */
>+	struct xe_oa oa;
>+
> 	/* private: */
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index d4310be3e1e7c..dc700198f33f7 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -13,6 +13,7 @@
> #include "xe_reg_sr_types.h"
> #include "xe_sa_types.h"
> #include "xe_uc_types.h"
>+#include "xe_oa.h"
>
> struct xe_exec_queue_ops;
> struct xe_migrate;
>@@ -347,6 +348,9 @@ struct xe_gt {
> 		/** @oob: bitmap with active OOB workaroudns */
> 		unsigned long *oob;
> 	} wa_active;
>+
>+	/** @oa: oa perf counter subsystem per gt info */
>+	struct xe_oa_gt oa;
> };
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index cd4bc1412a3ff..c38674c827c91 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -146,6 +146,8 @@ struct xe_hw_engine {
> 	enum xe_hw_engine_id engine_id;
> 	/** @eclass: pointer to per hw engine class interface */
> 	struct xe_hw_engine_class_intf *eclass;
>+	/** @oa_group: oa unit for this hw engine */
>+	struct xe_oa_group *oa_group;
> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 7194595e7f312..5bf957b127f0f 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -11,6 +11,7 @@
> #include "xe_drv.h"
> #include "xe_hw_fence.h"
> #include "xe_module.h"
>+#include "xe_oa.h"
> #include "xe_pci.h"
> #include "xe_pmu.h"
> #include "xe_sched_job.h"
>@@ -68,6 +69,10 @@ static const struct init_funcs init_funcs[] = {
> 		.init = xe_register_pci_driver,
> 		.exit = xe_unregister_pci_driver,
> 	},
>+	{
>+		.init = xe_oa_sysctl_register,
>+		.exit = xe_oa_sysctl_unregister,
>+	},
> };
>
> static int __init xe_init(void)
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>new file mode 100644
>index 0000000000000..fae067e73c027
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -0,0 +1,309 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <linux/anon_inodes.h>
>+#include <linux/nospec.h>
>+#include <linux/sizes.h>
>+#include <linux/uuid.h>
>+
>+#include <drm/xe_drm.h>
>+#include <drm/drm_drv.h>
>+
>+#include "regs/xe_oa_regs.h"
>+#include "xe_gt.h"
>+#include "xe_device.h"
>+#include "xe_oa.h"
>+
>+static u32 xe_oa_stream_paranoid = true;
>+static int xe_oa_sample_rate_hard_limit;
>+static u32 xe_oa_max_sample_rate = 100000;
>+
>+static const struct xe_oa_format oa_formats[] = {
>+	[XE_OA_FORMAT_C4_B8]			= { 7, 64 },
>+	[XE_OA_FORMAT_A12]			= { 0, 64 },
>+	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128 },
>+	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
>+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
>+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256 },
>+	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, TYPE_OAM, HDR_64_BIT },
>+	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, TYPE_OAM, HDR_64_BIT },
>+};
>+
>+static struct ctl_table_header *sysctl_header;
>+
>+void xe_oa_register(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+
>+	if (!oa->xe)
>+		return;
>+
>+	oa->metrics_kobj = kobject_create_and_add("metrics",
>+						  &xe->drm.primary->kdev->kobj);
>+}
>+
>+void xe_oa_unregister(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+
>+	if (!oa->metrics_kobj)
>+		return;
>+
>+	kobject_put(oa->metrics_kobj);
>+	oa->metrics_kobj = NULL;
>+}
>+
>+static u32 num_oa_groups_per_gt(struct xe_gt *gt)
>+{
>+	return 1;
>+}
>+
>+static u32 __oam_engine_group(struct xe_hw_engine *hwe)
>+{
>+	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) >= 1270) {
>+		/*
>+		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
>+		 * within the gt use the same OAM. All MTL SKUs list 1 SA MEDIA.
>+		 */
>+		drm_WARN_ON(&hwe->gt->tile->xe->drm,
>+			    hwe->gt->info.type != XE_GT_TYPE_MEDIA);
>+
>+		return OA_GROUP_OAM_SAMEDIA_0;
>+	}
>+
>+	return OA_GROUP_INVALID;
>+}
>+
>+static u32 __oa_engine_group(struct xe_hw_engine *hwe)
>+{
>+	switch (hwe->class) {
>+	case XE_ENGINE_CLASS_RENDER:
>+		return OA_GROUP_OAG;
>+
>+	case XE_ENGINE_CLASS_VIDEO_DECODE:
>+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>+		return __oam_engine_group(hwe);
>+
>+	default:
>+		return OA_GROUP_INVALID;
>+	}
>+}
>+
>+static struct xe_oa_regs __oam_regs(u32 base)
>+{
>+	return (struct xe_oa_regs) {
>+		base,
>+		GEN12_OAM_HEAD_POINTER(base),
>+		GEN12_OAM_TAIL_POINTER(base),
>+		GEN12_OAM_BUFFER(base),
>+		GEN12_OAM_CONTEXT_CONTROL(base),
>+		GEN12_OAM_CONTROL(base),
>+		GEN12_OAM_DEBUG(base),
>+		GEN12_OAM_STATUS(base),
>+		GEN12_OAM_CONTROL_COUNTER_FORMAT_SHIFT,
>+	};
>+}
>+
>+static struct xe_oa_regs __oag_regs(void)
>+{
>+	return (struct xe_oa_regs) {
>+		0,
>+		GEN12_OAG_OAHEADPTR,
>+		GEN12_OAG_OATAILPTR,
>+		GEN12_OAG_OABUFFER,
>+		GEN12_OAG_OAGLBCTXCTRL,
>+		GEN12_OAG_OACONTROL,
>+		GEN12_OAG_OA_DEBUG,
>+		GEN12_OAG_OASTATUS,
>+		GEN12_OAG_OACONTROL_OA_COUNTER_FORMAT_SHIFT,
>+	};
>+}
>+
>+static void xe_oa_init_groups(struct xe_gt *gt)
>+{
>+	const u32 mtl_oa_base[] = {
>+		[OA_GROUP_OAM_SAMEDIA_0] = 0x393000,
>+	};
>+	int i, num_groups = gt->oa.num_oa_groups;
>+
>+	for (i = 0; i < num_groups; i++) {
>+		struct xe_oa_group *g = &gt->oa.group[i];
>+
>+		/* Fused off engines can result in a group with num_engines == 0 */
>+		if (g->num_engines == 0)
>+			continue;
>+
>+		if (i == OA_GROUP_OAG && gt->info.type != XE_GT_TYPE_MEDIA) {
>+			g->regs = __oag_regs();
>+			g->type = TYPE_OAG;
>+		} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
>+			g->regs = __oam_regs(mtl_oa_base[i]);
>+			g->type = TYPE_OAM;
>+		}
>+
>+		/* Set oa_unit_ids now to ensure ids remain contiguous. */
>+		g->oa_unit_id = gt->tile->xe->oa.oa_unit_ids++;
>+	}
>+}
>+
>+static int xe_oa_init_gt(struct xe_gt *gt)
>+{
>+	u32 num_groups = num_oa_groups_per_gt(gt);
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+	struct xe_oa_group *g;
>+
>+	g = kcalloc(num_groups, sizeof(*g), GFP_KERNEL);
>+	if (!g)
>+		return -ENOMEM;
>+
>+	for_each_hw_engine(hwe, gt, id) {
>+		u32 index = __oa_engine_group(hwe);
>+
>+		hwe->oa_group = NULL;
>+		if (index < num_groups) {
>+			g[index].num_engines++;
>+			hwe->oa_group = &g[index];
>+		}
>+	}
>+
>+	gt->oa.num_oa_groups = num_groups;
>+	gt->oa.group = g;
>+
>+	xe_oa_init_groups(gt);
>+
>+	return 0;
>+}
>+
>+static int xe_oa_init_engine_groups(struct xe_oa *oa)
>+{
>+	struct xe_gt *gt;
>+	int i, ret;
>+
>+	for_each_gt(gt, oa->xe, i) {
>+		ret = xe_oa_init_gt(gt);
>+		if (ret)
>+			return ret;
>+	}
>+
>+	return 0;
>+}
>+
>+static void oa_format_add(struct xe_oa *oa, enum drm_xe_oa_format format)
>+{
>+	__set_bit(format, oa->format_mask);
>+}
>+
>+static void xe_oa_init_supported_formats(struct xe_oa *oa)
>+{
>+	switch (oa->xe->info.platform) {
>+	case XE_ALDERLAKE_S:
>+	case XE_ALDERLAKE_P:
>+		oa_format_add(oa, XE_OA_FORMAT_A12);
>+		oa_format_add(oa, XE_OA_FORMAT_A12_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_A32u40_A4u32_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_C4_B8);
>+		break;
>+
>+	case XE_DG2:
>+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
>+		break;
>+
>+	case XE_METEORLAKE:
>+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
>+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
>+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
>+		break;
>+
>+	default:
>+		drm_err(&oa->xe->drm, "Unknown platform\n");
>+	}
>+}
>+
>+int xe_oa_init(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+	struct xe_gt *gt;
>+	int i, ret;
>+
>+	/* Support OA only with GuC submission and Gen12+ */
>+	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
>+		return 0;
>+
>+	oa->xe = xe;
>+	oa->oa_formats = oa_formats;
>+
>+	for_each_gt(gt, xe, i)
>+		mutex_init(&gt->oa.lock);
>+
>+	/* Choose a representative limit */
>+	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.clock_freq / 2;
>+
>+	mutex_init(&oa->metrics_lock);
>+	idr_init_base(&oa->metrics_idr, 1);
>+
>+	ret = xe_oa_init_engine_groups(oa);
>+	if (ret) {
>+		drm_err(&xe->drm, "OA initialization failed %d\n", ret);
>+		return ret;
>+	}
>+
>+	xe_oa_init_supported_formats(oa);
>+
>+	oa->xe = xe;
>+	return 0;
>+}
>+
>+void xe_oa_fini(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+	struct xe_gt *gt;
>+	int i;
>+
>+	if (!oa->xe)
>+		return;
>+
>+	for_each_gt(gt, xe, i)
>+		kfree(gt->oa.group);
>+
>+	idr_destroy(&oa->metrics_idr);
>+
>+	oa->xe = NULL;
>+}
>+
>+static struct ctl_table oa_ctl_table[] = {
>+	{
>+	 .procname = "perf_stream_paranoid",
>+	 .data = &xe_oa_stream_paranoid,
>+	 .maxlen = sizeof(xe_oa_stream_paranoid),
>+	 .mode = 0644,
>+	 .proc_handler = proc_dointvec_minmax,
>+	 .extra1 = SYSCTL_ZERO,
>+	 .extra2 = SYSCTL_ONE,
>+	 },
>+	{
>+	 .procname = "oa_max_sample_rate",
>+	 .data = &xe_oa_max_sample_rate,
>+	 .maxlen = sizeof(xe_oa_max_sample_rate),
>+	 .mode = 0644,
>+	 .proc_handler = proc_dointvec_minmax,
>+	 .extra1 = SYSCTL_ZERO,
>+	 .extra2 = &xe_oa_sample_rate_hard_limit,
>+	 },
>+	{}
>+};
>+
>+int xe_oa_sysctl_register(void)
>+{
>+	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
>+	return 0;
>+}
>+
>+void xe_oa_sysctl_unregister(void)
>+{
>+	unregister_sysctl_table(sysctl_header);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>new file mode 100644
>index 0000000000000..ba4ba80fd34cb
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -0,0 +1,18 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_OA_H_
>+#define _XE_OA_H_
>+
>+#include "xe_oa_types.h"
>+
>+int xe_oa_init(struct xe_device *xe);
>+void xe_oa_fini(struct xe_device *xe);
>+void xe_oa_register(struct xe_device *xe);
>+void xe_oa_unregister(struct xe_device *xe);
>+int xe_oa_sysctl_register(void);
>+void xe_oa_sysctl_unregister(void);
>+
>+#endif
>-- 
>2.41.0
>
