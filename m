Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5216FC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 20:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285E910E516;
	Wed, 10 May 2023 20:22:26 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4890210E516
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 20:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683750145; x=1715286145;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i5WtjZ77hiGxGBZOXfYSqdxvJgQAV4L9rI4pg3arQZ0=;
 b=cbYJMzdPtz/p8gfRaX61/kNqNZlOZzppFHat3fpgeLHxJtqmk9NWlgBP
 LIBmhRK1U7pZQfynK1L4yZgtRpY9f0jwSUyZcNSd+BFjq4oW92x5x2ug6
 lRwhYLe9H0INGm5OIKlbTGTQ21f0gZWAkSwMSKfWGMKcNb57gefLlPBog
 ROOqSADAWlkz9A5xMc7M9rKUnr+ZwK1/zqTA84flzJTr0uTr0z8206buX
 t4qYAxY0AZmrm8yDk6T/kX6hICrOqH1wlfmIKLvZXx5ORHt+bHyhXrOqF
 /rkXBLkORF3UOmHKRkGmGKoSdAHaPibLG65ilAIguXBSLUnGX94n5e9yj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="415891909"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="415891909"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 13:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="702407461"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="702407461"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 10 May 2023 13:20:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 13:20:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 13:20:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 13:20:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSQbWYZOn5hRJ6CEZcYK0eHeFEAedC2B/6zBLGlkGukUySTO1u+FsqDS1Rf0asd0pVnUTL/yQtPVRVmtu5M8mK+gsx03UEPlsfpFMh2XL2QbXPcM7I3mEO7CcD50YtVsZtzxOU453QSqKG3NLThl3oI01Lq4jdKZ2ViP3yoQCcQVY44smMX+rI9yZoUR8KKj12MgREcgg7fa2Iv2RYWVXQdPXYW5rkB+p0iGSgGTOgflWWJi3hQweC1YBvzIG+fEpUHhTs89R5e8P+5lysPvjM7SWYlDCb+IFOzv1QGtlmyWIg+l3Pk+ht60JCnCxWTy/UoKPRJ/GaIs58UXWwrSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfXHKLA69DHTO0OB/cP8vE6FhSwHYvkxq/pXTxYNR1I=;
 b=g1PEeqx4Z5OBcbjcE0isPXENSCSgwao3jkEm8ue5+8QeQEjYxjTRrUh3RSGE25WD0V7v13ywcgng7KglXDS8TTllXhqtIPVEshZCZnBDV+96WWHLVQeKEbFwm4sO1shVkKacL4RXaPV9vTdGxdCBC6X6BA8fysjmAyHYUKNvsEXnAgchqSSeDGIBoNqpvNCOsp/gaILKl+hKolITim0LhBryhhB9dXBmHuDOtW9/7pBx2S1wHaxNyiluiSqM+wl+RzwG0s8h6SYbpBdNSPGoCnBT4jqG6id6BZa+OxcTe6IyutdRkQQKfX/bwkSZ7+h9DmS5CCv94CZaMEv460yTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 20:20:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 20:20:48 +0000
Date: Wed, 10 May 2023 13:20:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <fliqzlotxeedvkcickrymodhpkh7sqheqy7pgzoyrfdcpzcv7q@a25nxqhm5fbe>
X-Patchwork-Hint: comment
References: <20230510160220.714725-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230510160220.714725-1-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: f65472e2-f811-4624-35d5-08db51940b0d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjKFNpK0ertTjz61S+9B/574Mq1dTnxkTwsuWKZ3qRMtgIoB5XYjN9SkKRXws8no2yQO9BEFeePO2BVAPxCjOpZXjRh0NOP0pqmN+41JD3rsyMPal3jNDCqPaPas96skQAQ7dL/28PXNyyBGcrrIsBO/UEpni7EGBtTLvjxiIHZbtemWrIYns6fX9xNc1G+JVJyhLSVMWslmonw/S/0Hj6SspTPgHG1t7IXZyl/OLrx0Fj/OQsNE54hMxw2dtn3M5u+A0x7o3xVRcE5ePRaR4S1PDBUEYYQwVpl17TaHiSgLxmypXzH2V4yDj/vjv789cOMPtCCvQDAfSV62DlTobhlwF6s07gIZSnCGbjpHl9YQlBC64Os9xQHeKJ7FZR/dhRIwp7WoaeonogUbBl7vKj/UR0dNK/2pKYz1NSDhm0BTfWflIRGfwke3ANZCYn6xJ/yLnuZuPcjTwfhCYDhPsmVYX/PyKveev0pVAyX3HTuj+ss1x8lJKAmY2jnAsXs+y6xDQYYoLkA0MMM/jo1NzJ4br/FHeC9XLwmjrtN6TT47QxDqhphGqW6fLzQ5oT8j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(4326008)(6486002)(66946007)(66556008)(316002)(478600001)(6636002)(66476007)(86362001)(83380400001)(107886003)(26005)(6512007)(6506007)(9686003)(6666004)(8676002)(8936002)(6862004)(41300700001)(33716001)(5660300002)(186003)(2906002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zfF+mybfa9qc+LmguqdycF3C7rAd7EFT3RCZD5iVTjde/ys992jPmkH0xYga?=
 =?us-ascii?Q?VImJDX5wvkx6MpQQuQYj8dNSIGn/7NehGSGMgYyrxlNXPUEuNkXKiHcA8/b5?=
 =?us-ascii?Q?rvWJcO3EsJkYJ0LBfSebI0PrCAu7t/h72toPk36LaCDyjzXRqAYwNwtqrEyw?=
 =?us-ascii?Q?hLWBlNd8rdQ+WV/4I8IZqv5XNV1sePEuSWzOQ1PduSOxZ2ytQhDSHQQnyhj/?=
 =?us-ascii?Q?T0dudUoakIZRnHvePY6qedFJrVnVaiIOsK1/iTsjgPebZu0hRWqoeh4MiFHx?=
 =?us-ascii?Q?IIh743XqBryrAVmVt21TmAOMdIevtb+gKZj6rEEEBTw+Q0IFIFXc8qkGtEk+?=
 =?us-ascii?Q?yqiFTeiVd9R6RkJl1BLm4ZnoPnrhM6/0Z4V9asswrsJD71JGuVFq3UoZeYqm?=
 =?us-ascii?Q?USIOVrQoEOHNe7QRch/cltHye8FPRUqFWXs5KhFqCzwcqbHqD/qtdd8Ix+Ap?=
 =?us-ascii?Q?MwxY6dk9z8OtjmlLejj0EahGjzvqzUzdQBsc6jujF7O0vqmjNbn+6EhFiAVx?=
 =?us-ascii?Q?xpDJsYn292aVOhfnZcfCFRb45RosMQF4CizWN+l54KbkCN3QqYA0YCZAGAFG?=
 =?us-ascii?Q?n2NBeubmyi0zkRUcvG0PYXN/eahZ5Gahhso5Kc1nsdwpTXQcXFwogqknmXpL?=
 =?us-ascii?Q?klndsvcz1Z+5IpoaCNX7VOZSImXWOP4CJ7uvfWmYmd6l1FyLj145eesRLw8f?=
 =?us-ascii?Q?ljLkgrtxkXXCpL8ZEVcKPZvX+knFYW6zMP2P2YtJfxUw6pTGlTr7wWb+q0Ii?=
 =?us-ascii?Q?ezML6zRe0Ybr1v6pR8+NafLYxt6SZ80T18eRmy22OMEi6TXQYqaqV0+DDaCS?=
 =?us-ascii?Q?4zom4oqIpeTtQxVnJp4NZPmXthsUGdWgFb1PTHJlJwJvs4bpXE5awmRXIVnc?=
 =?us-ascii?Q?DPiKFW8xJng9HyPE/YOmJO0bnRX6FmMRUoiiiQLIb0B5TEW9LQWuoDnOA5KW?=
 =?us-ascii?Q?Mg38+WFrEsoAPqFHRB+JrMgh0FPrwqysVLhePgB2ocHkMY6JLmJOXGRtRhPp?=
 =?us-ascii?Q?3m0zbkCUC33EaQ6m4hAbUqciD7RoJlVHNT7+D5RSB15Z/aURY7OYxUnxbvej?=
 =?us-ascii?Q?CxwUpuwsarQoN1wClszcodJvP7lphF/Zy3AGoeS62Ipr3AzS4bYVLLxXg9dU?=
 =?us-ascii?Q?na13BUHChe8TzRGBJRgvSxv/UmrW5d8b6RPcqc6oF9jC61YiscVSsPdnxMfR?=
 =?us-ascii?Q?JteEPwhOe/jN18UMrUcbsa9P2bdso21oaEIMo2mbSzMUPUhQhAodZRk0rQ9A?=
 =?us-ascii?Q?xhTh3xReWfuSNsA4txUiFQF8I2HydZ4PzjJMwhXv3lx3/X6hPkH1cf7h5ynC?=
 =?us-ascii?Q?K+FWPMJIRB3DbpyycOsa6cs6oEyW8w9i5g8J4ho4jHD8JGWvMWOakmFm+oDX?=
 =?us-ascii?Q?aifv4N4KL44q0RiELKcS3g/3GAwGSWTfu9fkvPzz3hY7cUB0aWfxZoUcNCkE?=
 =?us-ascii?Q?j0f1voH9dgd5eLJpHWfvHfVUQmmJ4qThy0wExaqZAFtfz4Y8lFXiwM95XPzN?=
 =?us-ascii?Q?GoIJ/MB98re15gw5oKNimOZB3OzYvLn1C2F/9AOUBLVQvqvlinBlVKGrmJHq?=
 =?us-ascii?Q?zng4Nl7hrZLg6sc/o2WC/idDf1ydOSDlRLHqNyqdUxMnrp7d30SEPMwgz9x2?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f65472e2-f811-4624-35d5-08db51940b0d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 20:20:48.8531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dw+TyqGCu6K093l7BeaCH1ph18ag2Ko5Nym5AP7glKWHWsbejtbD3KwQGRJGeKvEKmKOexaFWGygSvlpE6R7sqNpNujzOl4k7ZkbqW7A1ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Add intel_pps support
 too
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 07:02:20PM +0300, Jani Nikula wrote:
>This is an unrelated, unneeded change in "drm/xe/display: Add intel_pps
>support too".
>
>After that gets applied, "drm/xe/display: Add intel_pps support too"
>should itself be a fixup to "drm/xe/display: Implement display support".
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/display/intel_pps.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
>index cfe40c64f6d4..c859b066e827 100644
>--- a/drivers/gpu/drm/i915/display/intel_pps.c
>+++ b/drivers/gpu/drm/i915/display/intel_pps.c
>@@ -481,7 +481,7 @@ static void intel_pps_get_registers(struct intel_dp *intel_dp,
> 				    struct pps_registers *regs)
> {
> 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
>-	int pps_idx = 0;
>+	int pps_idx;
>
> 	memset(regs, 0, sizeof(*regs));
>
>-- 
>2.39.2
>
