Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEA0C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 00:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFDE10F670;
	Wed, 24 Apr 2024 00:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0MDMOfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DD210F670
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 00:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713919218; x=1745455218;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wYDIFbEUQLd2mN8KRhxRuvYGfhfczfjmFKOFB3snbc8=;
 b=I0MDMOflp+J1dhxRsG06J+6JWEj+99M09WXJZXAJdt/pMWRvuXWl2N6d
 PoOup0O2cEYopoGMG8vwpT2qAjtYPXJ7aVTS3Qhetz/id4mMaOm3BHgcM
 bSioQ9mGRIYD2YoR2NwFThXpf2Wt7pjgbStHYimMYLvTJbygdOf+V/Vi0
 2THBJ682+SR9v1rV7RiJPmcEDyYHYOwCiHsic42L1s3SrYCQos6tD/CiC
 YzBR7Ee0wnLFNwQlZam4t/O6jCBWRC+89JyaZxVKe66PVuoUwc56uUHsR
 FMNEKMTIGMwhzCYQyXBNRBExbuG6qRqIoAiets1R8OZcFWKKbVlCcD6/U w==;
X-CSE-ConnectionGUID: yKzsoq2WR6Su2Ocyc/zDoQ==
X-CSE-MsgGUID: OEcqmzFaTG2g2bD5B4xj5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20145605"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20145605"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 17:40:17 -0700
X-CSE-ConnectionGUID: hsg/JlSVQRWqecdJao9z9Q==
X-CSE-MsgGUID: o1suAj8GR6G/UVxgioZmyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29334512"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 17:40:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 17:40:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 17:40:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 17:40:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 17:40:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGPaXswe0KYcon0ChjeaydWE69c0Js4+DByKMIwt9kNjDAO3mN2Yl7awy77C7mUvLtdQc7TX56Vd2XxKyHXsjgSORkkH1yXx+ahpXI8dLWV7BXcpWdKtgP6o3vy9YhS6V+0qolks4NXCHg5SeU1HTHyzQu097TZtY8K9AiaC4JFik7C/Y4xB2+UynqtmTNWL8tlrtJmwspjOZQ/RTuiI1gZMUsigat4jQWgwGllJU8d2oszEpvfg1W8PTneMPigYGi+56jIerNMGjGR3UhBmlLR4zxU6SjCQBCmxRAol5H5/kO0mJTJa9uWbkKBXGwpI4yQ0OD+hY0pdmH4utQfuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4A+//td31e0JNRzzrfuRuh2yNWplLKCbqoyBuA17aLM=;
 b=XQuB9XcNlhvuuhv9+L9xLR+V+KoYhhV5afpBYkQjiHX0/36lc1leXrprbBju5iT9YbuJTnsC6alwcxUH/cRIC8F0/BHHTbWUCKzR+rw2ZB06ftieiODYQQRa+D9bfUHlgT1qHcjl1plzyPIMSev49drpAtlpPizvc+d+L55Xc0ducYP+U8h91GSTzI9U6fKUJyFiCE1JvO9kCli7QQ3m3wTDJsAOPR801oBq/cqqaFGp8OinBkRd04B/fDtjTlVpy3BKUGR2ur4795JMbxcUswFfydHpVPYj/G9p3z6+g4xIxa+yf5QHvfCSmFGhwdvFSxaUB0UCPOgJpPdT175Q2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 24 Apr
 2024 00:40:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 00:40:14 +0000
Date: Tue, 23 Apr 2024 19:40:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 0/7] drm/xe: Per client usage
Message-ID: <piw6csckdwj5byexrp2kxzd45l2doyk7n2sm5cb5aawvuj6hki@w7wjotmhs6gk>
References: <thplv5pk26br3tou6if2otdoq6owb5lmdhfzi3wcboni4vyeos@sqiu7zpgmgrf>
 <8e2af1d5-5d22-47d5-8cee-f8bd1e54c0ed@ursulin.net>
 <fzl42hvf67tb7373gcpovcjjcufs3ba6jajmpt676uymsat4qs@qolxcmhfh6mz>
 <ZiAyUcuQtQ25xnWw@orsosgc001>
 <6ib4borj4paiuj5l6digeoc7mgnabtji6vtvdtvcafi64y3j3n@vqid357khkai>
 <c47f5e70-e09f-41e1-bc0a-b547475e17a1@ursulin.net>
 <ZiMDh2ddSsx+t+Qv@orsosgc001>
 <a8234a4b-df87-498f-b414-5f6a34fc9223@ursulin.net>
 <ZiabxU10TpNGzUgU@orsosgc001>
 <cdf9e1c5-5418-4bb7-8ff0-75e34b55273b@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <cdf9e1c5-5418-4bb7-8ff0-75e34b55273b@ursulin.net>
X-ClientProxiedBy: SJ0PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f86e324-7444-405c-51eb-08dc63f71aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K4anWC5zSV7G2sE/uhaGj7Xv0PxtnEHidDxYOlaw1dme8XcQir4vplTKMb3e?=
 =?us-ascii?Q?JKbsnkAm7n4ldek802iJUtiXboM1hntkbuRXqbJ1kNg3OH5EClJMUn6BmsC6?=
 =?us-ascii?Q?86N/pgERm/TCS9T/02IyZnS47NT9PsUlYBMwmmppoB/5uP/E/cxYAyhGsujC?=
 =?us-ascii?Q?3Dzny4LK/GCyu8uoYSp188PCfkHUSR3Z0/fb6u/VCEascSSvjgsam28kAp46?=
 =?us-ascii?Q?Nf4quvfIZhrWzBqYib48va5KzysWaFJxB5k0i3Ep4lTXCNMb7+yOywNkY12R?=
 =?us-ascii?Q?p0sTk8IcoWU5mnkeY5i97d8p4jI9lNtun+GaDLoDdfrNSDsDlGiJQTDZYuQP?=
 =?us-ascii?Q?5S6ESpC2m1vHkwFLWs/tHiHmXMyC8dtS+K8RWLiwJ3VoUa0kl3VYi1tt8BHJ?=
 =?us-ascii?Q?dX2eiuiDAPIRpQj8Hix11NX+qQ8482Gs+TKDK5cK8leokOeTFe5pCp+gVTHh?=
 =?us-ascii?Q?EEbbWDtyyZwcXFS1XsWp9MAQya20OaCCVMu7Ei3DxgPcburttIqMYBXEe1Ho?=
 =?us-ascii?Q?nJ1cReAvrKnrvfQ/c/PasYjEggLhUBbE/qIsFb/OtEA6NPLboLZ+46q71e35?=
 =?us-ascii?Q?MVu7s0NXVeEVaYHXQGXDmMnydXmORZ2F1pPAj1Xjz5T9QwlppuqLq9wcqzBC?=
 =?us-ascii?Q?2DxWKEFEJS4eQPpb3pzL+s2bJT4Mr/3o/AyAkUhITLBk/iE2X7pzoYwAnQJ4?=
 =?us-ascii?Q?H7wasslFVEf1oJfBSU91A8sR69O2LDXPC3orgn6VDyoEn6u4hmm6cD93hoqa?=
 =?us-ascii?Q?UBk0FWXROar9i8407iMoxo5GDMaENHRcAO94wzGNR0yQZe8xr9g+SsZ922g9?=
 =?us-ascii?Q?SBuDVbYcVrdZVzHxy+At8bInE7zCu0mFqDfB5qWY9UpS4YYA6tA6VN/eWMLK?=
 =?us-ascii?Q?5bAEjYLNn16Wo2gASkEB859pBWRAm3xGJ/ZHAGdMS/DsIQEYAopnVC0D480I?=
 =?us-ascii?Q?5lCP7G87IaQdh9Yj8WMa8/qqKdBzZd/57cTqrKHQwaGgj2vtowM6SbQIjPD1?=
 =?us-ascii?Q?tEVVcjtAvYHnNmbh1a/XWH4wHOzdlQ9kBW88h+r3Gm5wthscUDxfGQor6xS3?=
 =?us-ascii?Q?r46EhH6wGavecaxcQlcK2lq1z5NW0gFVYEmslDuAPlIt0MgBNrgSvqYA0Lvq?=
 =?us-ascii?Q?8+Rud37cwhu00Gc0GxZeXTdki6Z2/8xyRcPyT0wpxLMqt1JfRSFbH25r11CN?=
 =?us-ascii?Q?yIdUDZMds6uuWwiTStd2uiFqpa5O9CcimbfgvXMb/M0jsfDe2FRI79VTuCw5?=
 =?us-ascii?Q?qmq8MOU53RcAPoGiBhEBmoi6P7QC8HvhBZiozNQIog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7G8WbxfMPFhMi6BcqYPEVvgiMxCWFEcjhwx4cadHYRRlFVPUtC3c/GSuIgo?=
 =?us-ascii?Q?OQRy1z5l+oHztmxh18QnyhAXt/YNaXHiFnkbt9TjLlCdRb3CqMCH6/d+qvHH?=
 =?us-ascii?Q?H7l4bXwY9JblqvaCMTxyGvCSEScL5LNGwQWJNMqnou+vgYQJemztvhJFJrzH?=
 =?us-ascii?Q?iAvMCExn92euU3BjMm8JkyyJcME1fb6G52ihiHZsbaOA6zj0l+GgtJ8KprJ9?=
 =?us-ascii?Q?x/O8eEaSrisfTIZIofOLaJ8ABNE/2Utn7wWDdJz8zK3kmyLmCTQkX9619BaP?=
 =?us-ascii?Q?/CKjw3S3UGNQlTb79ElTN0xCsUJkm9+P2h9C7wDsAs1/kQqIujOXzoKw9T4O?=
 =?us-ascii?Q?TNy/OVIFrEtjSM10Xa8azaZwzXf+7Vk23g4A5UUD+u/iZjZ/2PUkMJ95uGr4?=
 =?us-ascii?Q?UP070rb6bJtPFys3HOM0lXsX3oZNqq11IoUznHhh4vm/XOga7ezD300JNdva?=
 =?us-ascii?Q?hrUZS1NZ66X0XnVdCnoAOecT4qawDnPPDt7q+hptxrpsVTs6fFXijocBIPw7?=
 =?us-ascii?Q?WWGn2RksHjZYWetBmutpNgyKCJ7GQlN5fBi+l7gWMNGvqAWUoysdmAc3qPLA?=
 =?us-ascii?Q?Tbfm38SyNmhegz4URvBgkkYKHfp+3vA+WgpGetfOwgD9VZIJXSj9ZtWh3S9w?=
 =?us-ascii?Q?i/sU8d63mnjcz7t1Kl5Q7LIUVudHaAfofLXc0cMio9sfBOpEx++fbHjLvzdG?=
 =?us-ascii?Q?ILfm4RaV4A6u4Fu/lrrRZ3HUhHfjNk5gxMp2XMS0b+rDOpvfMEol47AGLMcB?=
 =?us-ascii?Q?JnaYDjdtLSwBZfOm/TTvM38Dqvd13ikH5FInFIO9M2qZ0zQCKPNLa404zJad?=
 =?us-ascii?Q?zUeGNXvlcwpKAu6lcej1mY2DnkSj1tfsW7fCwQb+zZPfcoVDzLIviTa4491M?=
 =?us-ascii?Q?QUda9pCREnd0TUGhDs9B4C6BTFSWBwsdoewAIG4pS+PABPvkB2gL99DfYacj?=
 =?us-ascii?Q?ihmK9qgRAejZT347PRlsoAOTFCWDatnhjTtR0JZKJQciBJ1RZlPTem00csDl?=
 =?us-ascii?Q?3UHHlwcHFpJatHrkmo3vb+EJGD/e/9U/UB56nOAnZk+/tCR40LG8901YuqmU?=
 =?us-ascii?Q?ANOoxLemLa+FfT52e05iWqK4YjOV5/k0zlGZtmOluVRRn7rEavPl0QPuucQP?=
 =?us-ascii?Q?J9KBNUnQ73J7CxJw5IiIjrTIFFxPGyJiNY+IDx8JteK6cZp3kk2QXu5jOjTz?=
 =?us-ascii?Q?IohvvkIqFwQQhYRFEAoOg0hnEaTJQHOc72tszkO5PgSJDGkDNd7UI6IOl6hz?=
 =?us-ascii?Q?gahZeCA+VVSst4cBirRWhf5C16Ne9ZB5UEk+EdWxBgmekyt/kaisOQkPtv51?=
 =?us-ascii?Q?xDn+tykrBIh5aaYVcpoZDcTZcvhIfF/CbijXvvIr7MpUqE7pGLrXChfTmrCu?=
 =?us-ascii?Q?DfcQ3twUZ0G/W2yV/RYTizwNUitoSOpOeqcBY0eFL/FzHTRTilBfu6gzr81k?=
 =?us-ascii?Q?cB2Sr3AFyOYIgG92QlTjcwJ7yTvxUosaCfJIPtAAGzBn3qhZGkeEPtMkone1?=
 =?us-ascii?Q?q50+a82oYqE06h5DOB52IriaW/L3NS/lMPxREml7FVdKdCiw8Xps8D6L5e8H?=
 =?us-ascii?Q?RJ4naXcj7PzKDhfnkYabJC81jZif0AFCyi4CqtXfQdxzskY7kTaIl/vsqUJm?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f86e324-7444-405c-51eb-08dc63f71aec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 00:40:14.1760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJCl0hN6C+be9vO/GKNKX7P2zttOQdwO7phaXCfA3s9yBAzmc68X7fPs/KX8lJsTNuQzVo080JtuVlMy95Gftxxhdu/7oMdYI/Aje6OmJnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 23, 2024 at 09:44:58AM GMT, Tvrtko Ursulin wrote:
>>For the drm client busyness that we are discussing here, the VF 
>>specific interface is still wip. The quanta ratio is more of a 
>>engine busyness concept (see below) that I presume will be used here 
>>as well.
>
>I did not follow you here.
>
>Current proposal for withing a VF per client view settled at 
>drm-cycles and drm-total-cycles, where the latter was explained will 
>move by the amount of GPU ticks in the VFs assigned quanta and be 
>static.
>
>I was just mentioning one idea for an alternative which is time based 
>and AFAICT behaves the same.
>
>Doesn't matter much since in both cases we are talking about one new 
>key, but may be handy if you start with the elapsed time based key for 
>a PF and then later, for VF support, just add one new key 
>(drm-gpu-time-ratio), instead of VF using a different pair 
>(cyles+total-cycles) than the PF (drm-engine-*).

I think the problem could be exposing the quanta in this part of the
code. I checked the wip interface again and I'm not confident we can
simply read it, as opposed to the counter that we are going to get from
GuC with it already scaled.

I just send a new version with drm-total-cycles. I see the following
benefits:

1) drm-total-cycles detach the calculation from the sleep() in the
    userspace so should even be a better approximation of the utilization

2) drm-gpu-time-ratio means it could work with the current userspace
    tools as is for native/PF, as long as they don't implement a different
    interface per driver, which seems to be the case in some of them).
    The drm-gpu-time-ratio is more an extension to the current api rather
    than a replacement

I'm not sure really which of them is better, but in doubt I stick to (1)
and sent a v2. Even if we go with (2), the changes on both kernel and
gputop would not be so big.

Lucas De Marchi
