Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FB4C10DC1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 16:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6A410E758;
	Wed,  6 Dec 2023 16:16:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4E910E758
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701879415; x=1733415415;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UTJZd1eeCCul4IY/wY/BwwerPjgB+93HUueQEIUA3Qs=;
 b=dnxrG+Ru2rBFfu1LnGrMupAnwmjDyb7RXoT5/KeZuFQTrdYc346VDP1+
 cYGLsTz2gshqMYv/PsZrRAPkqILPsMeA031xJ4ZvnL/qqE5Y2c9+Y1ToI
 fOEuiNqXMxIGYiUpRaMdXwTCogknHO/Ygto9pOcVqMmnrYAQQHqObN/5R
 DJLWj38q0hAQUuzWVzfBVcZogIlXWee7PXTwLz+JiWqVuC4OZwUkMpumB
 +A5ace2Zuc/VhVKpaljtP+KuqUFZgSRyU09+gaqhnHixDfr8eFqcjIKX3
 WgviPafZs6ymNGK/cpbO2+fIICOQeGZz9ypeQJjNEc08mW4v255YDpNTq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1186107"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1186107"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 08:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="805684982"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="805684982"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 08:16:29 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 08:16:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 08:16:29 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 08:16:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+xPtz5Q6wANFSm6TeDwQQMs3sKzo81mcYFPeTsjlQljN1+27VqRC6M3paQWeDaJ7P4BLDEAYfxaLtbnsWir6orp0ukffG3K4vvOq5IVJckbXiIblTW3MGHGFdLKSZvVsu2sk1qmsqKWDwp3P/zD5K635xCXOJZzcNDS8GlV2ap/E5BvrG4R9gAOTbEUNXqo/o+xwHodxVEr9htO+1lgOfVVWP64n/t5vZUIRMZ+pGMQDJH53IgImlVfr2j2Gf+Mm40JI07AQxNCxiCPkx3ydeOlIQZzJEYBkvr2/gWjI+fdD92/p5EhRQAi7m25/RatFyMZoDx/+dzk6eI2dNFcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47x6AD3tk5EMsEVYqOm6/zy/AmvRlC4B+vouDtVTPGc=;
 b=mVMIgMC68PJwXC22Qnu+6150a1Zb2pA3b4cw9FvW0C/hW6uir88P5c+zPNe/TSATVngJSrSjODyI1WCDIsf1CVqVdiqrcDjDQAEji0+nGXien0QQ3PFfA6PHbWPdff478NG3qq9zZFwuguGlZqbGSXzKbaZ5q8y9ukBgZUJF6Ax2FRqeVqiCkcZon9jSXbODFzXUrCU2eim+wJm42eEsjBVbIs4C3E/SN4GIZEz3RvLSkGf2BtDSiwTmOxrV5fq5F+wLI7b3CQbt/Yw93RkBuNgNHYIeFDO6dT+OXIUpan8I1lYDHDjnLS2da/n/0FrD+JZ96CHk3yDCspqIGRVdoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 16:16:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Wed, 6 Dec 2023
 16:16:24 +0000
Date: Wed, 6 Dec 2023 10:16:22 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <3v6lvfmd37hezn6tudgzrwv235f7wv4wct4d7zswa5qres7sfx@jovwzf4vgh2l>
References: <20231206160617.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231206160617.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 11fe5922-b94b-4e20-86b2-08dbf676b146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FOsaljiTMh/iAqDVI9GSJJrRuW5CEHEJyDFobTat/lhjuW7hUQ/4wr7XL8mvcUatrXHMOs8g33zDsfEAS0Gp/955jz/UEpVSFM+iyJVpE2uMMALIMZqqwk6uProyDFXfZK6BV2afKasMBZONK8T/zv/qoGzIcOnDalOvkG9AnWtdDNPQ9SF4kQrllDQBH3UGWsJVV+tJ+QIrsqNScJbIRvzHx7VhG2fLWs8PWRkgnGoicpgxRZ+j7OnrCrjEhNFRAfzTqGTTIOrqSxslZHN0r2MHOKygFyxBq7dGKtMM9qW1i2U6ZJwHf0efF/oxr7kUuf082Uxif2DNhBV/JtTtR/TteQfmLENWuErsqG36Lsd98Vcv8aCylwvjwEQ0T5JPZ/OCaureKalG9xwwZZv+FY+0UUp9cfjzsz78GMFzSKlcvCoMPDl0X3epul2rcnmfD1KMOwfadi2/FQfbfSWjsmguqxAf8X8AMMPRRZyFqK5VvdptKYm9Q0RTdQUjfCI6DVQQICp/DVlSwRGng37Vy0HweOGvFcvQv4FPjKCMz1EUGeSnzV/C0Ioc/FLHircq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(346002)(136003)(376002)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(6512007)(9686003)(6506007)(6486002)(478600001)(6636002)(66946007)(66556008)(66476007)(316002)(26005)(107886003)(83380400001)(6862004)(4326008)(8676002)(8936002)(82960400001)(5660300002)(2906002)(41300700001)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NB2gCT8Dnv4i/cjn/HxbPYjkYXfYzTut+niuME/53rHBDSMf9u64dTDrntX+?=
 =?us-ascii?Q?b7v+G3P6zFlj+Op6nS/iinjV0JR67MgolqSI2xHMo/ZTVkXPU1FCedOPot7J?=
 =?us-ascii?Q?ezo9uw3ftKZTSYO2naZJeOFotDS43gnLOdGnx3J0ZIatj116jD3IXnPWR2oU?=
 =?us-ascii?Q?skEnvr2KW9IEqnwnL79k4Crmzfppc7u5CJmIkZJ73xttueEsyZ4uYHR5npPi?=
 =?us-ascii?Q?fuJ88q+aIv7JwHTL1MwDUZuB598bYeAm9Yh6UsNuDNO4kxacdcosBLO98A8a?=
 =?us-ascii?Q?1EgcwxJAiRda21zMkw7Cuvt7AsC8m69xkm9jPguVHUfF40Bjm0YF3uesnhjZ?=
 =?us-ascii?Q?nsZr2liU7oTxEdNouVvnuVbzGy3WtlFEieuC+QJXw9v7wsxgjf66yzM4x/I4?=
 =?us-ascii?Q?eyKiLSSoluvqO/xEt4FzPmI+bRxlndVcQoF+JXqLq34+HtvjRaMrej8MY8Ov?=
 =?us-ascii?Q?KBN8vDJOOTym/zGOICGm3atUPXc0RI5FFNdNUGgNRPbn8IR4GYlFExrq9HF1?=
 =?us-ascii?Q?hayNQvIOLBtTpWa0RrUZG5E649UP0S5ilVarFh/tnY50KB4+qTXpWtMzqb5f?=
 =?us-ascii?Q?8wOpfvx7mlFhurnoNZ+MpBVEleNMwkRREue2g3FYvDuhfvSVuTquHPaoAtL4?=
 =?us-ascii?Q?ZGH6tiuJk6JPhu0yWcW0Y96MyxaQ9aueUVsXQXsO8gqepPqv3Zkmn9uWwynj?=
 =?us-ascii?Q?Lq2dm4LUllOsRLNkMJJfmeqLsoq000VQYylbF55rL7grg5GX9cOFgYxDae1O?=
 =?us-ascii?Q?FdmEZy8wwYm7KIa0Wjul6bZxylgSAsHHe93VHzgRxhpbnzNC1sveTNZsZfvR?=
 =?us-ascii?Q?cb6CR+NA9nMSKBiXFuztCZvyfpGQwfKrxsIqbQAaTMfOEhp+e4qIrSKmGysQ?=
 =?us-ascii?Q?RwpdFUKdiBsuHmqSvMZj10AlweJNjioZ3cfzKiOL9Ey0nKpYY+74YADfR9Z5?=
 =?us-ascii?Q?YXo6iEaFTJixSKKCDpIV3kRuJWAKjJu/gVdzS+b5EET5JDQET2dLPDyO5tMm?=
 =?us-ascii?Q?13ztk+aA8YPwEguXQzHY4maPGqFiSOJUapjv+oorOmoWYf8W41Puedthwf8O?=
 =?us-ascii?Q?0SLJnBhCx8/38iMo7RT6Pmr0squWvJDWs7rS3v+1KbLh8Ab68Vyjjapjvb4+?=
 =?us-ascii?Q?02cSdxCvzBBCBbjCfTYuVDPR6gzZLkbPpHrFl9xCaV3QQvEUpiBZzUVrySCu?=
 =?us-ascii?Q?0/s/hPiEkfTdAlM1mK8AwZTNlpoolTM+Z3Jid/CGuHmi/D2/One2YTK1jmHh?=
 =?us-ascii?Q?hddttuVcknViLaXVRVaw57Sut56oU2tumbNX69u6aylDHYAZTNllwOLFA/b9?=
 =?us-ascii?Q?s2CzMqHiDGQ0nRIIePBNKgYEsZL0jhFTHGhOYi0hv9tcpEA60s2SaDPhwXRL?=
 =?us-ascii?Q?cL+/v+62E/fA49Me1FCuqpH680HverTiutX0JTxJZ2IgoGq8qu3HxKhk/GBg?=
 =?us-ascii?Q?GljDbkUs02fnsKp5MgjxLdOFM3ei+8hKe1Irc6WFQZeWGXp9SuHMEaI8kA4a?=
 =?us-ascii?Q?23KtyjbBbkNt7m3UlqQW+sNS6uMtWAw1TMcYtgyJE0JeYKEX5SICpiutVBHr?=
 =?us-ascii?Q?OcutbUrl83oqL0TUDNIu4Fuj5rMkXAI/j2M7TPIy9AWELwT4fDYObqQKr/xl?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11fe5922-b94b-4e20-86b2-08dbf676b146
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 16:16:24.6263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcKjngaVIhDiUQ9hpxNlwGuObgLXJywCIQF+XE6cplncviw/CyTVonN07l/AZ21pr116BOlAFJ+3leTDOWRDTiS4jDuizGG7EKGeSMQzgxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove
 DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
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

On Wed, Dec 06, 2023 at 04:06:17PM +0000, Francois Dugast wrote:
>The exec_queue_set_property feature was removed in a previous
>commit ("drm/xe/uapi: Kill exec_queue_set_property") and is no
>longer usable, struct drm_xe_exec_queue_set_property does not
>exist anymore, so let's remove this.
>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>

should probably be a fixup to that patch? Anyway,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> include/uapi/drm/xe_drm.h | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index dee750385161..346007e8074d 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -53,7 +53,6 @@ extern "C" {
> #define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
> #define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
> #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
>-#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
> #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>-- 
>2.34.1
>
