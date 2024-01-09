Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E27C47073
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 14:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD4D10E05F;
	Tue,  9 Jan 2024 14:52:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D22B10E05F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704811971; x=1736347971;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=76QUnnyRP4LQ5+uRFuGSjH0Awmf67Ld3t6jmKneVpS8=;
 b=mO87TleaACz+O9BcB8pW9KdX161C1g5X1gePSJQtK3sWwDnwfkopGtTf
 hm8zn66GdNdceqyISr8CXZwKhrVD8MAG9taM4O+4Lf5DXsjRiJslZKWWe
 yGgWC1VhMdWPN89tTuMfh9Qc5H2MgkFTEnRMfQWWl7bfBM44EG4EOi4N5
 laOERs8HgAcr2ybphYYF9wKzBcwwc7AcVuiarU1Ay9cHo7VR0AOFuMZ2E
 3uzk0znFT7+mFaqGVUwhyVuKZnaanqaMFLSC4bCNVNeOd996CAHR2cNBi
 nKAIFUHqunljuCYQo6iaCnDdWW9h6Ky21Rse48LQram95112Vraut3RN9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4970375"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="4970375"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 06:52:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="925289028"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="925289028"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 06:52:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 06:52:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 06:52:49 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 06:52:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jm2//Sd4YxRI/mUnjhvyNruQgYV708s3R4sGc6PopPvARMrHWWKMucF5K3V9r5RrSaLEkTVK2aeZYE7nj53TRoV0x8DULbNPEuMjfT3pCPjNr0LacXtDjjUlnJH/NIBFV/Cqyra/2pwGcUMsuT/Wxi9qzQ1rgmaBFb+HPnK4YR+Y8HLkgIN885GBCsXTSrshi+FbUovSIn6eCWyhGrsusiowTQAG0G3d1DQemeEEoSZUQcB/b119hDbd6Jxe6uYhY1///dMC/WXkJvJ8rMi2u4npvL5cA2yGd4tdUA67Iy3MMcgTtLg3nqmL+gLvLVfMixy/MAgsSM4bMp5H54NqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1eyFfhNNXEPTlXJgqbMuizQnp3jM9h1WkrWgxzqIb0=;
 b=kftXxHgNmHHJ8UyNxMGkJMvOMXbE9hWXkePkghPDJYS9CakA0tbQlRWNBUCPYab0zVAeIaM5Qpzow1wS57d5eO2l8/S+7XJSiAVAiOhJ/swwaem+A+WL5ekQIzOu2UKxFDhHweq6tTUBz2Y7qWInKPHyeIU4AWqjJ9+keRs9qO05/doALB/8DB3Pyw3h322Fr3+KvlrTuAlO5og7MMYFAN8K6F0HkWLHsQSOKtaG1gIWg3NNpYnPgr3iG9dVGtVfFxa82QYWTCKuZWG7wdqabDqtcBWrPJEfBTll/F5aA6dZc9JTokubMXCS1xSRi5uCfMDZpUCA2oHVVT/QPMBtZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7659.namprd11.prod.outlook.com (2603:10b6:510:28e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 14:52:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 14:52:47 +0000
Date: Tue, 9 Jan 2024 08:52:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Annotate xe_mem_region::mapping with __iomem
Message-ID: <5csxg24d5yeovp25dl527c3phzf5ncmjy2ejkqsrnwptugavrt@2cgvpcqde7vx>
References: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
 <20240109112405.108136-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240109112405.108136-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0161.namprd05.prod.outlook.com
 (2603:10b6:a03:339::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 8828532a-6bab-4429-b7a0-08dc1122a4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igsKRdT92+lkuLAAIehpST+qceLAeBbcaJtdOLY7k3nGqEU2wa7Q/HFDC4Oe92b/8ZNWIDSB2ZgVEuTfulh1bnxnwkLSRXMeIe5BWyzB3YhYZYhS2oa36QYM1iGSioo9w2GQpCuNgEWDvvKchATcELd7sTp1xa67VTg3E+HMlbQ0NQhYCroMfiWonhMlp536nn9xbT5yQ2TV3/sVz3NePPrs+O/HhcZnJi5O/VOZvJKH/LQZIDZET1vDvTLPqs7WnJZKVqfLvwUJvx77tjt5oNQ6AY3f8NzSY8BXTainoZ4XVPlRv7H6aH0F8tQFreEHoCjmauuYdJQQVEsJgcaJh3D+4YFqxurLviDcHj6nszbHSOt3G3p8rCt7KDYqVEJK+ZrYeh4UE+9oy5kdPBTOE8032242FfOUUm+DFgQp3jkyJ45RN86BPZppY5bQHwj7Tc2H4X3Asriy2ShDP/Ci8zDQS4Iu98m44blls5He5NKsE08OOYGjmSd2q6SugiGYc5Mx/c3q3Kl0IjDCP033Yjfrnq7WOXgadk0Kju2zm2/8tyCO8pwewjg01jtEMuwz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(396003)(39860400002)(376002)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(66574015)(26005)(5660300002)(4326008)(6512007)(9686003)(38100700002)(6506007)(82960400001)(6486002)(478600001)(6916009)(66556008)(66476007)(66946007)(316002)(8936002)(8676002)(41300700001)(86362001)(2906002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eiQbrte+7IXt+3Gx4cN5Tkz0rlpazMElVXFPE+DiiSBmiHfLvygprYSXg5?=
 =?iso-8859-1?Q?l/1ski643gnEqXvIyLZPjtwWKmozUkXpuQYWVLKC0n85c/2MhiFMtJtco1?=
 =?iso-8859-1?Q?wX15nkaJR+Md3RLLbDXKLga39CHWd28T7qooJOdbviSTBcqnmgPKzs0nne?=
 =?iso-8859-1?Q?dlWoXGKZdv1GdFqHLhR9BtbGn2spkC/PGMYnYbZW1OwnOfbrGLmmAQDGYu?=
 =?iso-8859-1?Q?Vsh+GX6JESFHt63hW1ln04I+kw/Lol9/drrYfbTX0ffehxqg9QhLyismUh?=
 =?iso-8859-1?Q?yJchFHsau95zO0YoaOCu5We8Oe/wDc9Fv/8zdaoPS2HqoK2xLghsKhxrwr?=
 =?iso-8859-1?Q?UFaJdi/CNiBpL4v17C4kCiFqfZgJTbw1Y96ArFCvGhdCzjv4/B0ZVfv21i?=
 =?iso-8859-1?Q?TRabzoHtupK+8lwzXK/Q3vemQy6KPYzUz22pbbTSr54gw35F+shzuOdJ/y?=
 =?iso-8859-1?Q?aXNyWGd0dQ9D7+GfEqENWj7UA0+QuUtCYI9p7x5wU854FoXYjU8Q9ts3vd?=
 =?iso-8859-1?Q?0ZN6qYZ230EN6xS9y0ucr/YtVGzV0eF0+lndEfVySXI+H3Sx7b0heRYg9b?=
 =?iso-8859-1?Q?djH+H8RTbPxVY2zqS7/j1g7jomkz0BkVY3uvBfB4sZXTCOA87LqdP4W+b5?=
 =?iso-8859-1?Q?Ych/NBajigvtANUtkot4LzSazUjqxpiNVtTLFtZ6sSWumIM9AdiNNTum4O?=
 =?iso-8859-1?Q?lOh8jFsmeoMxBnVn6VRe7LS1fzaxMqV8lkGQJLgV9ftpll1OHpFf36/w78?=
 =?iso-8859-1?Q?D6BkZi6ojB9gsGAgxxbr6qdjZUN82HSuy0newVYwHIDvcH+baDJkIn+5XH?=
 =?iso-8859-1?Q?NJa3bzqEUUSqT1mydKZYby2OAw9yVLUE1mZWF+YT3wkHH5PrwD3I2S5qj8?=
 =?iso-8859-1?Q?cxyx8sdb8zVvRzohhRRpMHkCNVwNMmqeU0bLCj+YEaDjS/YUozfQauyoYz?=
 =?iso-8859-1?Q?zS5vutdTmh1ivgFl0veQ80d4I1FyF5aT5lHTOiONBwJ8UUPTIt7so1JgQ2?=
 =?iso-8859-1?Q?w+Cuz5LsPN1gse6gkDOMQXm+QQMyn5e3QK7MDALAVAn2m/x2RqxKJUCluT?=
 =?iso-8859-1?Q?Cgu2MN5uPTi4ZuSfUeIX1tKytATOrvTnn2W+brHrGfla2LE4naHc+eeCGb?=
 =?iso-8859-1?Q?Ex/oHyO+HaF5blv06MEgM8Y5qHOz/TV/If2BacTBojVw2sBW/dPjXc5foh?=
 =?iso-8859-1?Q?6GmDBNHAR5SLElsyvS/Hkd+JtUvEJhCfZeV4/Ljj1jpKcsgOSCw2Fo/K42?=
 =?iso-8859-1?Q?XdsblAEb8bU4QwXlrpvV30S2b7KR7VKYSE4bh4/sRcKkXNwyJfLAjGOSSx?=
 =?iso-8859-1?Q?u4F2W865dpJAIJOydBO4WmzbRGwhPGb04jn+eB+QqehOgMXhlf0tnwTFak?=
 =?iso-8859-1?Q?0SZ3KrC8Br9Y0zOL9kNAlmStYoNj7gVHu80R3Ut3N8AE81yGxci9iiNJtW?=
 =?iso-8859-1?Q?pKiaksJh3pqhc8TgTgPdIJLs2s+FIcN5CMrP4wt+98ep0gJ/1zzLa2ldq4?=
 =?iso-8859-1?Q?2iaKfuD2MZwx1S7xpboT3VpO0114Y0M7DEP90Kd16J4TOvmVNQ+Dnslmb5?=
 =?iso-8859-1?Q?JAP/ZePcYhRuYBTmFVKaFA+SqR9dTPr50FJcjJlTuH7aJ3x7teFdNiK6z+?=
 =?iso-8859-1?Q?T++zLNFJscs+OIZ0Aw/hBVpZxjkp4qjP+Lti+hyX5YjUuXOVAYamfUhw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8828532a-6bab-4429-b7a0-08dc1122a4cd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 14:52:47.3122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSaJqQGPuDfIB0wLKldcGu6duUGUr+2w1Anowt6Yf+lryI7GrEXV/PgXWzsg/wpaWDX9+nyduElasiL8cWC2Sh7a20G0ssINF6P+2ao47gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7659
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 12:24:03PM +0100, Thomas Hellström wrote:
>The pointer points to IO memory, but the __iomem annotation was
>incorrectly placed. Annotate it correctly, update its usage accordingly
>and fix the corresponding sparse error.
>
>Fixes: 0887a2e7ab62 ("drm/xe: Make xe_mem_region struct")
>Cc: Oak Zeng <oak.zeng@intel.com>
>Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_bo.c           | 4 ++--
> drivers/gpu/drm/xe/xe_device_types.h | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 8e4a3b1f6b93..3cd29bd015a0 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -442,7 +442,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>
> 		if (vram->mapping &&
> 		    mem->placement & TTM_PL_FLAG_CONTIGUOUS)
>-			mem->bus.addr = (u8 *)vram->mapping +
>+			mem->bus.addr = (u8 __force *)vram->mapping +
> 				mem->bus.offset;
>
> 		mem->bus.offset += vram->io_start;
>@@ -734,7 +734,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> 			/* Create a new VMAP once kernel BO back in VRAM */
> 			if (!ret && resource_is_vram(new_mem)) {
> 				struct xe_mem_region *vram = res_to_mem_region(new_mem);
>-				void *new_addr = vram->mapping +
>+				void __iomem *new_addr = vram->mapping +
> 					(new_mem->start << PAGE_SHIFT);
>
> 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 71f23ac365e6..171e8615d184 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -98,7 +98,7 @@ struct xe_mem_region {
> 	 */
> 	resource_size_t actual_physical_size;
> 	/** @mapping: pointer to VRAM mappable space */
>-	void *__iomem mapping;
>+	void __iomem *mapping;
> };
>
> /**
>-- 
>2.43.0
>
