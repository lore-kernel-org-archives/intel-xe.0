Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FA1C6FA8E
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 20:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA4610E26F;
	Fri, 24 Feb 2023 20:22:27 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0260710E281
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 20:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677270145; x=1708806145;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iUepyBzAaFry9waSA+TcyQY79vVL5eyVmddrt7uZiHg=;
 b=giaMQKvSAdfAjeudNOzZO2rdfPveV6WMoMAP+6ABFfciTK7KSOjQ6hAo
 QH4povEjV0KGQ77wfG36jTGLUp2oMobHURV6GxXZwjNxLXLPhph/Ua5/o
 gBhqgOokIZD+JqwkhYQFhs5kCP6h1Li14rzEUQhM6MWvaaCwBuSHSMsfu
 P1X9Z5FM/+gCnP0X3tc+YAf9+ac0o4cekmprOv/anN9DvQiYT/wJf8k9p
 NVpg11R1MA9cgW6u+05AyLhFSKLpWxLzb5swg4nyWhAcJB5avb96hsoZu
 Ipz5dV6xoZ5OcA7Pkn6bNba/j4dhaBQ+hJp2T8MKeuIUYU0smkACR91wQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335002854"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="335002854"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 12:22:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="847057042"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="847057042"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 24 Feb 2023 12:22:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 12:22:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 12:22:15 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 12:22:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HytuNol8mflJkNbSG2h6zQfH6iZ+zlh3nT/F5/0eAFnuxL88WjyXwkl1bkqzWmWNcFfDxwTferu1zDpVlivWZLTl/woFJiuiHBt8TVt1FEAA817UFfAqMHoRsFn3QWTS8dPbJYKUP/+4AZ9intUcw37044FLO5hNA3bnSmsLIc5HjVvq6g5gUf3n946AVd+tMi072hu1WfPrC56mohN+FsRJ7uylpouvlK9wXeG27v5w9FuUg2XOByRny3O2aQTtoOtZpXVjZqsuK6TetrApk/BGUz0Sq8+41wsjCr5p1PU5t1802lpqhkv0rCUrw1soXeR3FM3EK/LfF61uRCwOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUepyBzAaFry9waSA+TcyQY79vVL5eyVmddrt7uZiHg=;
 b=Gux+VOzLJcqVgG+43lweylmx+0OHCRcxecaKR8vYaNKRGzm1kc5zUdPNUJZnLjM0og/MLLYDm2rAkKIzLypSOAedsl5STjfZcFeVN3o3Q7PczRVPne8j7VBNvE5yBX9iJwU4UAK3LJferB8q1rC0yJF+J1lRTVLCldccT3CM1cA2ssouOp+XKWik4M30r5EdBiT1jnLm537//cBXTpjRnRgX8junYNrXcA+dIOjcsLSdLEEf7r5nmvXBQTKHG/LKWC6ZmNkgmFv4fRihfSHnYjec5ViNJlehgwEily2K3oyokQWBJQrl50e2jRDtauBimWCt9DNu+cp5ZbTIw4aZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4627.namprd11.prod.outlook.com (2603:10b6:5:2a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 20:22:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 20:22:13 +0000
Date: Fri, 24 Feb 2023 12:22:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230224202210.ghq4bluoblrnndv2@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230224190814.3956563-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230224190814.3956563-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4627:EE_
X-MS-Office365-Filtering-Correlation-Id: b917db1e-41fe-4f43-f2dc-08db16a4d057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VMrUJRp7TY+6gJSjVMe2V7djke+qe8QFfixNrofA4oLy9nbLZd224wwuMueKjoeqkPfAmHk+QHx1FXf7tUfAl2k0BGmpVW6JoO3qjMdIGo3oeQPiOeRqUOLw0O8vlndHcYQFxyGU1NV4cjpXd8bZS1sBxquYYftgmA+Jl0ee7bFDQ3Z+mlFAbKrQ2Ok8JRyEQMVI8PLtIUFO8B7kJ16Er2YNj2A87EVyT6BgytUu6/XJ8ep77Qj9wVDGXXg2/uRs8PF3N7Zg9yg/cpQXB7x+75D3GFxxQELbSZDLhdt99llp2so8rbzKx4scxHu7ZZhAYM0cIL49OPLdbViphHzwvnH5ml7yBq2a+tfxR8rbdgskf+maay0BA/BpOv1mPicINONse3TtSw84GjaYZIPd1voW1m6DPe9WAgb6lzUAbeWrDWLJ41idsucBKAU6WyB7q2Ksiq+JuP+rwXIwvBBtAvOq2ezS4XPoOpverbV6DIgKW0rz28eoydeWf1hej/FRWEjeQp4cd8mTAhiyvyNqaqANYi2B8V41+S/70fxsdLGvsWqs2vh2uxhk8iqtWNI763ZjzS8wliYfHK+dY5O0LEXRbTxn37zkr5vRoBxBPGC2PRr07mCiH0avfIY/D2lB/G3NUujpOjLP7uyU/lTYzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199018)(6506007)(66556008)(8676002)(66946007)(316002)(66476007)(8936002)(6862004)(6636002)(41300700001)(4326008)(1076003)(186003)(6512007)(9686003)(26005)(6486002)(478600001)(36756003)(86362001)(2906002)(4744005)(38100700002)(82960400001)(5660300002)(66899018);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tOkISP/V/NxDP/3FLBQsWOYRNt/3GiKA6rzsdPBAAex5Dbb0EIRsXFFpWj5z?=
 =?us-ascii?Q?+zm4QfzxB1gIemITUaI+qm2v9C94SMXQUbnPOlE1OcMb1gKw2GWPVTH9agRL?=
 =?us-ascii?Q?Q1VuTiW3orTWcikPRbgk1EgVYyjS9plm8FsCynblWGwk1fFiFV1y4CcGLGIj?=
 =?us-ascii?Q?pA9tLjz5iBn+I8lAE+tpxo65kBwNfumUQ2UnzSogY1ioWIzAEXSO6fxUpLeY?=
 =?us-ascii?Q?EOhha/Lvz8Ez3n0sClqbTOjq3ScKRgUgVd9lJ3QDx95O2Y9E4LRhpWLlcHoK?=
 =?us-ascii?Q?cLiBLCuOlsOuTaHxdTL79Evi/vAwMERg/bJm0kKICOcSwv5m0pTf4oGNW52n?=
 =?us-ascii?Q?GDZBnamaJWkfUPnvTJFqTlQ0bQHnoZwViWDLeYYxlBJkjPZyUgluTw3H09Gi?=
 =?us-ascii?Q?e7K56wkwt6nDhxFl+8xAeMIPiufZECnHT7Rgw8ZTDYHfM7LgLwNi9QRGQK5u?=
 =?us-ascii?Q?JkxPMTJe4FI30m72o8aiWpE9vAhjb0KJf/LFuujNdlnAMFb8g/OucGPdj0AI?=
 =?us-ascii?Q?N7e3flhnWMf3IEcykjuiDXErh4qYdcpr9FnS3lmJr0+sxb7C/inei6pHmV9n?=
 =?us-ascii?Q?bXPwjobirDajh8s65e4AWgZnSrsG/l1Wrr1qfBy/LO4aml1nckxXOvYYXRQH?=
 =?us-ascii?Q?k96mK/7U1GQu4hYhNtMcHFntza5N5lEdEmG3zAxIwPvIM/Y2HOE0vSIRcmrL?=
 =?us-ascii?Q?UyoYQuRnxz9yW4uJy7R40mpqhQknytRXWVMxwGQysnF5MupA5N7dhmisL5rU?=
 =?us-ascii?Q?czI9uEs6fkiMOPNHGrqkxUbQGSG9D+h3AkP1Nha7Ux0FxdGjTBM4H8b5QVdU?=
 =?us-ascii?Q?3QLdWVGcWd+AWM4w5p3cOkxLMmkTWBO52GR+X6+MJu30jEcI2t1JUI5v/Fgh?=
 =?us-ascii?Q?sW5i52kO0+ISSu5a62x4oJRPE7gefX345/SZk9VB734BGRHJONo1bOxtWTHM?=
 =?us-ascii?Q?DqsbItkK2HSVwPkVbQf2hngHyK+ynJ2xkWrPeEbb2b6WNwM3uhYiYjFd8X7O?=
 =?us-ascii?Q?TQcfMUG/t5V+q4EIiORdJ6WeVznXJ7uNqIu4rlrp/AblKRMamAFpIXYJj5n6?=
 =?us-ascii?Q?EBy7WR60YPttE5O/MYldT3MsVLDTNxumPkU05QEcjFiQs2aeik5DeVGm9ztl?=
 =?us-ascii?Q?B9TQ6Uqo03c4DixUBTTw0YtAbzqI3/XpMKxBNCLgfUouL+3qnQ7fjtgUwbgE?=
 =?us-ascii?Q?+GndRcGYTODZhgdj53OJvSOt7TvkwU8PoqH1Vzwwo234d54hxcyKsaNCUfCg?=
 =?us-ascii?Q?HIDfWqkTcrUywSmuGv8r+9ygTSCS7Vr0+oPGphUHK+LO668pN+dilBq5LnU+?=
 =?us-ascii?Q?FHPU+ReuubSloD3EHEFMYgf9AeEcL65GiX6Uu5Ff6sMPGGjlE+rj4Id0Tvnj?=
 =?us-ascii?Q?+b8pZllBSNWz0nIvqvNFkppyyLHDmSEEYZcqfkKMt1jbej+Q1fYkZTR8pPUv?=
 =?us-ascii?Q?iUp9YM9yTr0jAVZAKC3sB3JvenSS9k0Tz1mNVO8o1YbVcZEpVAyDOMuclRTS?=
 =?us-ascii?Q?/ZxewP6u/iyjUpfCwfX6GyVyvXFXAZnP/Auw5babuVU8Y74g2+janZv482xC?=
 =?us-ascii?Q?acdMoMJrcP8ShX3WlTneyCbehGV1m/tCg1ZYTbKCJoxA26bhB/s9Z2vbRcNW?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b917db1e-41fe-4f43-f2dc-08db16a4d057
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 20:22:13.2815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udsA1XGuRAPc0OgKd+XPdYteCAQoPoRAUBHbQy8M7D3nRluIk2wFDjJFsTmu4D54ReBtMOKp8PAHVg0i23WvHsnaEkRog3KWPQNh1FVijXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4627
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove gen-based mmio offsets from
 hw engine init
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

On Fri, Feb 24, 2023 at 11:08:14AM -0800, Matt Roper wrote:
>During early generations of Intel GPUs, hardware engines would sometimes
>move to new MMIO offsets from one platform/generation to the next.
>These days engines the hardware teams put more effort into ensuring that
>engines stay at consistent locations; even major design changes (like
>the introduction of standalone media) keep the MMIO locations of the
>engines constant.
>
>Since all platforms supported by the Xe driver are new enough to have a
>single MMIO offset for each engine (and since our crystal ball says that
>these offsets are very unlikely to change again in the foreseeable
>future), we can simplify the driver's engine definitions and remove the

oh... I hope saying it out loud like this doesn't give HW engineers
any creative idea for future platforms :)



>gen-based MMIO bases.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
