Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F469E77346
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 22:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B24010E165;
	Fri, 29 Sep 2023 22:13:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DDD10E165
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 22:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696025585; x=1727561585;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5oGihsqQS4YWU6qiKU5P6cKGQduzQm3/ByHX4qgduUk=;
 b=HkvqXoj7SuFMcuLCRuQCoELy5GD9/xhEjLy6Aq0INjxhtBlEGu3JQ8ya
 k00JE46ilHkksvRmZDJBHNbtvOUoREq9L+5Qs5q3PU17kYkW9Q2HMMbLV
 CwQu83viknxMxuQ8lJVdK0V42/xLdnmebpIDtVPfnOPvd7uU1h1ZHOeyp
 Pn++UirH11tLhqsIgfszEa9tqftGxFQHKGE8hXkHYlXC9qkpmUFvgHsSv
 EW/Z3O2RMAeBg8BrTr3Aug6HcZ8rIiGRd+jFhHfLzqruHY5+lWvwR2hn6
 3nGCMHtxt3Oi9SnfVLARmIgWh4Qwwd2MZWdsM1717wyu+xvMzKNxW85Sd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="381271690"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="381271690"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 15:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865860207"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="865860207"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 15:13:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 15:13:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 15:13:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 15:13:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 15:13:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1ODkj2nhfbv9QSTdrWbqMuQgmy0VGagXXu00j5+0oI3g8PdRU89a5mueNKuwWF05rfV5Fn3gHGGlr+ZwT4gqVIv0VX3adp1zofhZ/FZz9SR6BE8a3tKZ/y9AsvzCtU3anu0Kb3Rbcdt80HpS7XeeaBrJiiEU0FJbgKTBJK/df06RGkz9o7IoW8CGCc8euC6o54lFCzy2s9ZXTmqlN4HXD/RlgEkjNcd0O5VCY9KB0uEGx/yu+l2pC+mOmfIiQVu5TGXLoe04WehRKfJNRwZQOgnveelQOaLFYUxgf9bvufFfPeCe71thHpI6vLjrIPL8JJYNszis0UQq3zaR1cU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdGf3VLNZRiFfp6//Jb0oDVsPST3wMd09lpZgFBXEOw=;
 b=dCqaNq2fmSno26lClF2H1paI0wtZ8PJ6XS0NpWn0PRnlhJVnijWm4Ud3uAGtefRhgx686TYDAOcXjj1TQd/RwpkxAR5R5wBjFzMTUFM2LD0U315cfI2Xx87VxtfI388EhLu/2OEoIEtbs7IlPnCHNyAP4+PnYJeZpiAWoiV009k6i03HmOtBG0walsFUaxoeHdfBstgYs0wAh3gz4J4vPhZVOGFs24g1IgvnMnuYG8w0FDap/akKuXdNwCZx6ExyTM+eev7hNOCzo3xPtyiNfK+Eq0eyD+sKAGNDvSntZaZPEwTHLCJ6G1bYflOtpU5ES3VYkVxNc3TfTO5b/KJhdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ1PR11MB6106.namprd11.prod.outlook.com (2603:10b6:a03:48b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Fri, 29 Sep
 2023 22:13:02 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 22:13:02 +0000
Date: Fri, 29 Sep 2023 15:12:59 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZRdL6zeeMyQiQZHZ@nvishwa1-DESK>
References: <20230929210130.1203203-1-rodrigo.vivi@intel.com>
 <20230929210130.1203203-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230929210130.1203203-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::14) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ1PR11MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: ffdaab51-df56-4e86-9cfc-08dbc1393f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hdDiBONPBAnsXJkjQj9qV5Lfzo/EseGfsjmvgrBWylwY3eNcYGN5n9neV8T+I1dJWz7FTlJ0TVUBgf8lZzcssQtewzEVp1ADW8EiuP6Hx2U7arZv7bLJQ3JsbWUbjX7pric+FXcEiQC9/M8PD+jTEf0SZnW+BmWTU68wfKOk5e6UgN0eHH9umvHxiBU0XD3/IkXeBWceKRbBun80ZVN42yhiq15R6zUranNRx9vLXiUOwVRXBIEd6WiZ/iJq06cMX8sO1+T0KyJRZaSo0hStnzIoAlDWO7vNZrJlT5AbccMPEFqbYvh65FXljXFmYSFOi3Adql65RbYuwxDQQyNMqjp08OYfPwoO3Uw3Oe+t1TWJgWix5ZnNKNnBennpkCzUPxu/xilbCEZBu88jHmH5jIXeM7BxG3CcBrjT8QrjKWVjvdjlACTqzmt2hkP6XQyoBZC5HBEmmNkbJHSiC0S0KIo2hviDal3EpFyOrndlaAzJZvzL+j1zpHXLnyiQp1vQiOH4gioh/TgEkBbLW5ikZnaEbPYdizEIGCXXcypSovkIUgFtU8ETJZEFKgurXkbj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(39860400002)(136003)(366004)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2906002)(41300700001)(83380400001)(6666004)(6506007)(66946007)(8676002)(4326008)(8936002)(6636002)(316002)(66556008)(33716001)(66476007)(6862004)(86362001)(6486002)(26005)(44832011)(38100700002)(82960400001)(478600001)(5660300002)(6512007)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+wDwDH7377/h4xLlF3Aw+OQrkP24/RuFedYAP0Ag1pfXCyzoxBlWBtTLSw?=
 =?iso-8859-1?Q?HuiSIRJK2GTRAzsRAkh0zLtzTlkV8TXjzfrb2pBjFIe+5QD3dNO/fLyVUy?=
 =?iso-8859-1?Q?4qovhtWdTjo4qRNLu3uIzEYzsmy3q8OxhZtgvi5UnUoSbRsN3JqHL0/F7x?=
 =?iso-8859-1?Q?6mxh0g5yZ5mdvNgXwLRgco0MBrqS9AfozrnsSoDtoXdnbXb6WvvqAUBTNb?=
 =?iso-8859-1?Q?Xuq7aCuZSOgPDN4/6Wlq+Pfn2JRPvo6ho9fkvuOKRy8hs50la/OCNUVaQS?=
 =?iso-8859-1?Q?6X2ZkF5frZU778i/fq0Og1fC0zRyVJquNSHq++4xSSy0l0RnK9PfIFrwU3?=
 =?iso-8859-1?Q?wTU1YGFHj/LJnTnM6685BbqAPKUDIoGMIMgGN2vENGsXXGWqiFeP4hrRpt?=
 =?iso-8859-1?Q?+RX+1xCaxjRQx1nnaGtE0y/E/c4e2EYf4yiTCYDdjafkRBNci8MiXwJfNP?=
 =?iso-8859-1?Q?64YgmGegfXupJReVGkZWXCEzQuKAs2M2kMoYXlAOKaSwVHb3ylnxVE/YJE?=
 =?iso-8859-1?Q?Ll/QiRK/JyQXxCGfbGQ99TS0KIKQxkUHcq/ZiEmo+THm1gGT2KFmzsaQQA?=
 =?iso-8859-1?Q?OTR/o+8kdbId1YfB9dmlyoT9i9icCh1I8+594K4b1hlQdfEPOvndvNW3An?=
 =?iso-8859-1?Q?9+hWj/dheZll9bD1f0whoqspQnz9l88IbptBQuhGks8acf6BLshr6kba+b?=
 =?iso-8859-1?Q?eYTaHcVijCYYjVcglGn4NFeU32i61MYeg3LQdfIAd9l6Z4W/WjN+1une5O?=
 =?iso-8859-1?Q?B5W42YM7R6Cy9UyOS67s1u0lwVEEH1cKRdL8WONwH9ahzpGhrVr2z7c+Bn?=
 =?iso-8859-1?Q?MhxJ3GxrjIp3NgcBaWNnx7xPCAqrJTZHhOcR+e4/Nvq2Ubt6lD7D0ilHjo?=
 =?iso-8859-1?Q?k0AutJRO6QSZZDD3EWwA3y2z4XDnxfBVahhMKmdVbA8VoDsKsdDeTogDPe?=
 =?iso-8859-1?Q?ImacM2SdHV7se5EfW1ZnOOvliEt7LmSZEmDSL0DWvYjpk7evNZNOBdLaXJ?=
 =?iso-8859-1?Q?6bFp1wZpUMpD5pKQGC+b17oMpPZVWmBh7ksZ15o9rafvpFKM8gAs2VRehr?=
 =?iso-8859-1?Q?OdjIjeVXIuOHbamihe/w3n2LPN8KUGLBX9nshxGytCXKZF55uCBv4oLKwL?=
 =?iso-8859-1?Q?Mmd5vRCqPhivrICpFv/qroEzkSJRfOmkEL6W1pA7xMaLg4Az4YLpUwahHt?=
 =?iso-8859-1?Q?I46XlyP87OpOUagZowCfDWviW6THogOCyr+67bGxjdtMA+F/0w/HnA3lvj?=
 =?iso-8859-1?Q?1wO07om5kWrgmRmqMVkaEFbrHXFyLRHykHsBYdtJYwwnGDZtSyDL5kAikq?=
 =?iso-8859-1?Q?ZBUchzLDZZViNUMaS88+1olVHy/I2KN9b7JkI0BI8SQMl7TXP89BECj69c?=
 =?iso-8859-1?Q?ESXE8dSpCmdhtL8NdqoqBjYTPUR4qzgVpVj0iR/Ac2HY4IB1ke/YiEyYpC?=
 =?iso-8859-1?Q?My4zAFnfz5/vG1I8umlkN/MhgZtj6HD9E2eTWkNBTSIQdDRI7rHFjgzSY7?=
 =?iso-8859-1?Q?T9+lrzCyRy/e/FMpIQlJ37RS748cy9ka275Fry44fnrI5VR5HXse4e660G?=
 =?iso-8859-1?Q?z17UsSfjsxoj0H2aZqtjkzYutQyNSo61PdyAdNrcaf5AvywsHZM6EpFiBu?=
 =?iso-8859-1?Q?Bo9vtionAsSgjIuCi0mP9sGkwYw0DK3rvWqyWlAVUL6VstVXuiBSOyaxh9?=
 =?iso-8859-1?Q?J1KXrJaoNP9Kz2VeDn0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdaab51-df56-4e86-9cfc-08dbc1393f3e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 22:13:02.2630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YIeLtnfL5pQvF+NVmt0cNX0mCg85UwuxL8/hS+f1ele3mAVlyHMvzegIOdw7bqhldOFgPw8JQfIFnNFN57B165Sj1PbGi0qwCNqblo7Lcp//CO7UpABgm7gCsUz1w+z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6106
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Kill xe_migrate_doc.h
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

On Fri, Sep 29, 2023 at 05:01:27PM -0400, Rodrigo Vivi wrote:
>Keep the documentation inside the code.
>No update to the documentation itself at this time.
>Let's first ensure that the entire documentation is closer
>to the relevant code, otherwise it will get very easily outdated.
>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> Documentation/gpu/xe/xe_migrate.rst |  2 +-
> drivers/gpu/drm/xe/xe_migrate.c     | 79 ++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_migrate_doc.h | 88 -----------------------------
> 3 files changed, 80 insertions(+), 89 deletions(-)
> delete mode 100644 drivers/gpu/drm/xe/xe_migrate_doc.h
>
>diff --git a/Documentation/gpu/xe/xe_migrate.rst b/Documentation/gpu/xe/xe_migrate.rst
>index f92faec0ac94..e7f8f74609a0 100644
>--- a/Documentation/gpu/xe/xe_migrate.rst
>+++ b/Documentation/gpu/xe/xe_migrate.rst
>@@ -4,5 +4,5 @@
> Migrate Layer
> =============
>
>-.. kernel-doc:: drivers/gpu/drm/xe/xe_migrate_doc.h
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_migrate.c
>    :doc: Migrate Layer
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index cd2e00008aab..853e707d8d8c 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -33,6 +33,85 @@
> #include "xe_vm.h"
> #include "xe_wa.h"
>
>+/**
>+ * DOC: Migrate Layer
>+ *
>+ * The XE migrate layer is used generate jobs which can copy memory (eviction),
>+ * clear memory, or program tables (binds). This layer exists in every GT, has
>+ * a migrate engine, and uses a special VM for all generated jobs.
>+ *
>+ * Special VM details
>+ * ==================
>+ *
>+ * The special VM is configured with a page structure where we can dynamically
>+ * map BOs which need to be copied and cleared, dynamically map other VM's page
>+ * table BOs for updates, and identity map the entire device's VRAM with 1 GB
>+ * pages.
>+ *
>+ * Currently the page structure consists of 32 physical pages with 16 being
>+ * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
>+ * several pages are needed to setup the identity mappings (exact number based
>+ * on how many bits of address space the device has), and the rest are reserved
>+ * user bind operations.
>+ *
>+ * TODO: Diagram of layout
>+ *
>+ * Bind jobs
>+ * =========
>+ *
>+ * A bind job consist of two batches and runs either on the migrate engine
>+ * (kernel binds) or the bind engine passed in (user binds). In both cases the
>+ * VM of the engine is the migrate VM.
>+ *
>+ * The first batch is used to update the migration VM page structure to point to
>+ * the bind VM page table BOs which need to be updated. A physical page is
>+ * required for this. If it is a user bind, the page is allocated from pool of
>+ * pages reserved user bind operations with drm_suballoc managing this pool. If
>+ * it is a kernel bind, the page reserved for kernel binds is used.
>+ *
>+ * The first batch is only required for devices without VRAM as when the device
>+ * has VRAM the bind VM page table BOs are in VRAM and the identity mapping can
>+ * be used.
>+ *
>+ * The second batch is used to program page table updated in the bind VM. Why
>+ * not just one batch? Well the TLBs need to be invalidated between these two
>+ * batches and that only can be done from the ring.
>+ *
>+ * When the bind job complete, the page allocated is returned the pool of pages
>+ * reserved for user bind operations if a user bind. No need do this for kernel
>+ * binds as the reserved kernel page is serially used by each job.
>+ *
>+ * Copy / clear jobs
>+ * =================
>+ *
>+ * A copy or clear job consist of two batches and runs on the migrate engine.
>+ *
>+ * Like binds, the first batch is used update the migration VM page structure.
>+ * In copy jobs, we need to map the source and destination of the BO into page
>+ * the structure. In clear jobs, we just need to add 1 mapping of BO into the
>+ * page structure. We use the 16 reserved pages in migration VM for mappings,
>+ * this gives us a maximum copy size of 16 MB and maximum clear size of 32 MB.
>+ *
>+ * The second batch is used do either do the copy or clear. Again similar to
>+ * binds, two batches are required as the TLBs need to be invalidated from the
>+ * ring between the batches.
>+ *
>+ * More than one job will be generated if the BO is larger than maximum copy /
>+ * clear size.
>+ *
>+ * Future work
>+ * ===========
>+ *
>+ * Update copy and clear code to use identity mapped VRAM.
>+ *
>+ * Can we rework the use of the pages async binds to use all the entries in each
>+ * page?
>+ *
>+ * Using large pages for sysmem mappings.
>+ *
>+ * Is it possible to identity map the sysmem? We should explore this.
>+ */
>+
> /**
>  * struct xe_migrate - migrate context.
>  */
>diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
>deleted file mode 100644
>index 63c7d67b5b62..000000000000
>--- a/drivers/gpu/drm/xe/xe_migrate_doc.h
>+++ /dev/null
>@@ -1,88 +0,0 @@
>-/* SPDX-License-Identifier: MIT */
>-/*
>- * Copyright © 2022 Intel Corporation
>- */
>-
>-#ifndef _XE_MIGRATE_DOC_H_
>-#define _XE_MIGRATE_DOC_H_
>-
>-/**
>- * DOC: Migrate Layer
>- *
>- * The XE migrate layer is used generate jobs which can copy memory (eviction),
>- * clear memory, or program tables (binds). This layer exists in every GT, has
>- * a migrate engine, and uses a special VM for all generated jobs.
>- *
>- * Special VM details
>- * ==================
>- *
>- * The special VM is configured with a page structure where we can dynamically
>- * map BOs which need to be copied and cleared, dynamically map other VM's page
>- * table BOs for updates, and identity map the entire device's VRAM with 1 GB
>- * pages.
>- *
>- * Currently the page structure consists of 32 physical pages with 16 being
>- * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
>- * several pages are needed to setup the identity mappings (exact number based
>- * on how many bits of address space the device has), and the rest are reserved
>- * user bind operations.
>- *
>- * TODO: Diagram of layout
>- *
>- * Bind jobs
>- * =========
>- *
>- * A bind job consist of two batches and runs either on the migrate engine
>- * (kernel binds) or the bind engine passed in (user binds). In both cases the
>- * VM of the engine is the migrate VM.
>- *
>- * The first batch is used to update the migration VM page structure to point to
>- * the bind VM page table BOs which need to be updated. A physical page is
>- * required for this. If it is a user bind, the page is allocated from pool of
>- * pages reserved user bind operations with drm_suballoc managing this pool. If
>- * it is a kernel bind, the page reserved for kernel binds is used.
>- *
>- * The first batch is only required for devices without VRAM as when the device
>- * has VRAM the bind VM page table BOs are in VRAM and the identity mapping can
>- * be used.
>- *
>- * The second batch is used to program page table updated in the bind VM. Why
>- * not just one batch? Well the TLBs need to be invalidated between these two
>- * batches and that only can be done from the ring.
>- *
>- * When the bind job complete, the page allocated is returned the pool of pages
>- * reserved for user bind operations if a user bind. No need do this for kernel
>- * binds as the reserved kernel page is serially used by each job.
>- *
>- * Copy / clear jobs
>- * =================
>- *
>- * A copy or clear job consist of two batches and runs on the migrate engine.
>- *
>- * Like binds, the first batch is used update the migration VM page structure.
>- * In copy jobs, we need to map the source and destination of the BO into page
>- * the structure. In clear jobs, we just need to add 1 mapping of BO into the
>- * page structure. We use the 16 reserved pages in migration VM for mappings,
>- * this gives us a maximum copy size of 16 MB and maximum clear size of 32 MB.
>- *
>- * The second batch is used do either do the copy or clear. Again similar to
>- * binds, two batches are required as the TLBs need to be invalidated from the
>- * ring between the batches.
>- *
>- * More than one job will be generated if the BO is larger than maximum copy /
>- * clear size.
>- *
>- * Future work
>- * ===========
>- *
>- * Update copy and clear code to use identity mapped VRAM.
>- *
>- * Can we rework the use of the pages async binds to use all the entries in each
>- * page?
>- *
>- * Using large pages for sysmem mappings.
>- *
>- * Is it possible to identity map the sysmem? We should explore this.
>- */
>-
>-#endif
>-- 
>2.41.0
>
