Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946B5C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6684710E622;
	Thu, 16 Nov 2023 15:44:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C666D10E622
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700149453; x=1731685453;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=d5xGvEak2+1e92dcjrQlnEku5Sw7VFn+L2ngkNEvVAQ=;
 b=HlyspVSSQ0qG2utMXosAq2WysDRN9DsdEbP9PYCG5QYkc20aNwvNFBPu
 kzAhbtLOhFxWg4mauLy1zQ2CSV6jJ+Jk7e9j4L15xEltfYl1Wg1y8F+mx
 xagyDpJh5Ah4WWJFdKd+HMjP6zwVFYA9c8mtZ1GTQdf0DKCqB3fiO3aqb
 abR0+Hh2a9nTIRiLkzEP3b4rVVyi+jIqSivLTSd6ANLLBiBaCRtn17MnP
 U8qkpcz/FVdHGdC72IZww9c9q7gsIgU85x05R+IVQdjBlrQXtpBQVAKG/
 nOMqsU+WHrYUl0LZvdXfVHObsNTCgYW/1WlbqWrOWDevSVEHBZ7OAWoXW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="370469944"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="370469944"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:44:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1096815287"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="1096815287"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 07:44:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 07:44:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 07:44:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 07:44:12 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 07:44:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlyLwREb5b6PX/RgyxNdiroYUAgZyvQSR4uFnlr/tZd5SyGq3Y7jvAs1EhvmIGfpnHVxxz6QPsj83r2Oj2AMb+qG+MaJaJrquleK4QinwU3a3GfHomTU1Zo/dTy2N3jakaKOdmrqKVA/KUAE+vLmRZmLnC0EcBrpY7UR41kixw7zs0/DzQDmNqLR98thPTXvKj7MfOKzEmxaEzWR6GToMg2zJ5LJZ8yfdBhfBL6cxV3MylTHBsg0EHe+vjTMHtZrTk45pGPvDhuzhmclZ5dddcWUNK7qtSuuHnVNEw2/68xvYezWHPMpz+nT/lbUqliyGXj5Wsi7+yZIu+TpqBiI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpX5GBKVMNm0ZbEsm7IoSHhoWN9UmyBEKJo7gDmM5QY=;
 b=oPpo5M3qdeEknSKoEx0B1jH3zRFowyF8EqA/JS24W0EPUIJm4llvOOle8No/CEO8XgEGWF+Zmbetjg813a9zA+2wkLkcFD7dy9n5YBc9CYGB8tknBq35ng3hIqz6i91QZJ4jbcLRlTrfcmQJv3GvLg2EtDg1N+FA5B8VBBOchuPT9kfhpEZ1m+PfuDg0YFNi+JF2xCZyQs1TLQTXQwM8fgoGvQgYRH+/mmAUrjGBDIH3EXHMbFxLZ7U1dEEvoALxe/Y0fH6v19sEdNbLQn+TTtW4DOI6X/13sU8eZiJHP+3Egyi+8UUAFgZZZG49TBoLjVZcVVYLclOv4Jh82IQzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 15:44:09 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c%7]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 15:44:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231116153901.31941-4-gustavo.sousa@intel.com>
References: <20231116153901.31941-2-gustavo.sousa@intel.com>
 <20231116153901.31941-4-gustavo.sousa@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Nov 2023 12:44:02 -0300
Message-ID: <170014944242.3216.2269599346800000429@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:74::33) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: c90e8d6d-7090-4bb0-2dc4-08dbe6badebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u1Xn3gPtwntyTYlufvuvPPW9aonBXijksPL7TH7gYUzmdXc18suyujoLU4mkVEPc/2dCv65ISoVEEhOukg0fJlpMANjNLU9A0k64JNFidiM3JoyHDaW1djWOQp6v+RDGSK/BRBugj6ftS+Ayjd5mVFqBJqc94MIvbX3q+PzD2ppbj6fmILJgy40QpoOzikioJ2dUydTuXJ5s3QqDiuR9Uk4yMpV23Af0f8hh5yfABz/gnMcjbdpiuwBIvMiBy7yvKRkBWz4RYDDkeC4P97rlbYXYgpoqGf6RzRueIUCD1qbjVOFe9GqHE5zR5Vp32NgWgWtRvrRzAYJbn4lCsg0N7AYWo9nY+idptkAVe8gt6767/YAawcXMNCf4l8AI6DnYMICVpaUqTV7coXjY1kqg/NaiC0m2wyUvc3Y4ArzSf0IoQhfIT2XVwciDNlZAlcQiPqacD7aNLOEPF4z4DIuvfKmFJTMrkbmOGCcjoYH3XkgCGiGBgnMGjwSl5pAmcQ8xJuoVILSRMwWeL0EFNb9PjbHFReu2ja2F0DOvg0WpeoV1FW9voHyjmjvcvOfS0pyq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6506007)(4326008)(316002)(6916009)(107886003)(5660300002)(33716001)(38100700002)(6666004)(83380400001)(86362001)(2906002)(6486002)(6512007)(9686003)(66946007)(66556008)(8676002)(54906003)(8936002)(26005)(66476007)(4001150100001)(478600001)(44832011)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0RpNTVSeUY4c3FXbm96R25oSUFWTkp5OHZlRjhtWTBWTUZXdlVHV3F4dzBL?=
 =?utf-8?B?djY1RDJsWGpycnRiTUFLRGNPM3N5OThCc3dvakdJSUw1ZSs2SjhTOVpDTDZ2?=
 =?utf-8?B?Mk1iQ2VyUDZEaDVDdWlKOHFMK0F4NjJhQ254SnZ1L1c2TElubVFkVVpWWTdS?=
 =?utf-8?B?bE9nWEhSTWNzNVp2NUJrOUNQdmN1SHV0V1FoRFFJdERKb1dwQlBRR3RMWnB2?=
 =?utf-8?B?TElYTjFFZWNJL3kyRG9KbzRyVnkwQjlFQ2lGMVk2RmNqRTE4TE5wSUR1N1R3?=
 =?utf-8?B?Ym9DeDZJZVBWVm41VmxkN2hxbE16VUcvcnpPb3RTZHpCdm1QQzlDL09oY01M?=
 =?utf-8?B?cm12TUN4UEt3a0RpYVZFQUxEaXFRekhFa1dwSmNCaWc0cGtkdXdOVTZDeEg3?=
 =?utf-8?B?bnBxZEk2VHc5YWlXUlhmb3kvZUR0aHJabXNjR0xnNzVURVQ4QmtNZS96cEdF?=
 =?utf-8?B?Q0diQVZORkh5STFpUlJEUEFIN3JUN2k3Y2xzUWNCWk9MU0FCa3Y4QUxpWVFi?=
 =?utf-8?B?Z1V1ODhzUy9VODhYQzRpdXRTNTh6QTluOS9vOUJCMVkwTnB0QUg1Y05lN2FX?=
 =?utf-8?B?bHAxL0cvdFJOOG5MclZaWDVmblYrQXZsZGJhd1owRWxjVlN5S2cxcnFlamtt?=
 =?utf-8?B?TUZuOGxlbUR3QVVXM2hmNWNnaUEzblVHWU5NVzhYak8xVUM1bGFxbklHd3Jy?=
 =?utf-8?B?TThaVE41VHNHL3JYNndxUEx1bnhMNkF5UE9aeU5Dd0NiQ2dwU1RoVGo4UlI4?=
 =?utf-8?B?MjlNbU9lekhFQlBSYnQ1RDRvNW1RcFlZVlBIdDBOTSsydC80WjBOSjZyeU5H?=
 =?utf-8?B?SHBLV09veXlMRGVqUkMybDM3RW4reUhKTjBlUGVrZno0UC9zcTgwYW02ajhX?=
 =?utf-8?B?b0NERmlpK1paZVRJS0pLRm9rVXFqcXBxUlNtVy9VRExUdmJ1S2JMYk1TWlRQ?=
 =?utf-8?B?RkpEUlBnU29xYy9DN0w2WVFkdUhXT2JCSWx2bGg5U0xUMkdVMzV3M1dHV29s?=
 =?utf-8?B?dTU1U3hXT2NDNWtBRFZsd2t3ckoybW9JT09BM2ZseDJVYzF1WjJ0eHBXbE9Z?=
 =?utf-8?B?ZVM4SGcwVmtERmc5ZzVVRGo2YUZjR3orWFg3QTlqUThrZ25wUWJQUkt2TzI1?=
 =?utf-8?B?Z3RFUk04M0JqNWZUdDhybUFZaVVlL3V2UlR2aml3eFl4ZUlGNmN1L1cxWDd4?=
 =?utf-8?B?dXFYRHl6TXZjYXFvVGZJaFNOUk1nTFVySkxEL2IwOFJjM2JUbXRoNW9GR1FI?=
 =?utf-8?B?OEZlZ09DVlUrbk5BbDJrUk1UNFpxRXp0S21lNGw0VGFSZE43eFlveUl6K09R?=
 =?utf-8?B?WW9RZXJFc0Q3aEJlcG1WWExLdDJIRUJwTnJJNUI0ZURKN0t3NGUwaERpZFJ1?=
 =?utf-8?B?U0svNk1EVkQvaGt4NjJKQmdlS2xuL2VuSDMrazNpZkNuMmZjSjlFUlpDVUti?=
 =?utf-8?B?Z2ZpWVlTYXRXanI2Y21QZ2Nob2licEJkKzRLNGhNQlZUZ3lmRlVLOEFJYXdF?=
 =?utf-8?B?OFpvN2s1RW9DenlpZERBbFRIa0FRcXlIMzZaRnk3dmtDM0dpYTBxVk5tMnV0?=
 =?utf-8?B?QzZHYXQyZVNVZU55UlFLbnBKREk2MDFTZkY2a0htVHcvT0FTQ1lYWko4b0FC?=
 =?utf-8?B?UXJjNDVrd25LWllJeDcyOEVuQlRrSkxCd2dWWVZMeFV0Tm5nYmUrTFp5Wm5o?=
 =?utf-8?B?TSs0YmhNcTQ5MEMxTU9UcWNDOUd0L1BJcU1sbklka3ZqdlV5T3F0bTZ2ZjRH?=
 =?utf-8?B?ZlJKeGg3YzhUbWtBMUh3TzJTVEFqWWRVKzY4bTdYckJGOUQwdFNJL3puTm9X?=
 =?utf-8?B?bzdUYTBMTnA1VTI2bmgyTEpQa3BZV3V5eEV4ckFOSlhESDdFTGJxRXo1S21M?=
 =?utf-8?B?dlVlWmR1ckxnY2hNakhZN2sxN3RyRG1zQW1vN1N2VEdLMUdDcDlQM1ozQXhv?=
 =?utf-8?B?cjRUZlNaY0ExT2gxeXJEMVlZbDdUby9HSzk5eTkva3FSZjdGOUsybXN6Ny9Z?=
 =?utf-8?B?Vjd5Z0xGNC9PTnJSWFZTZ2tlaFN6Z0E4dVd1UG8wdm9zT3BTem50dnRwemgy?=
 =?utf-8?B?TmJEZ3ZaNEZudVRFTzd4cUpjUGtEOG1UMkR1RWVPS0t2OS9pTlJOZ1ZIWW1X?=
 =?utf-8?B?Qm9udjg3MHFQekdnRGwrQUZOd0pibUdWS3VEMG5IRlE0aUcyT1JhRkgwZFl2?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c90e8d6d-7090-4bb0-2dc4-08dbe6badebc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 15:44:08.3360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsoAgm9Teipi2xlKmUyyrFWeA+khX/UI41vVJa7giT/SayKtV1HSVhOyI43NynnFKXn1TSpyoEm6EvGGWSBb6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/mmio: Make xe_mmio_wait32()
 aware of interrupts
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Gustavo Sousa (2023-11-16 12:39:02-03:00)
>With the current implementation, a preemption or other kind of interrupt
>might happen between xe_mmio_read32() and ktime_get_raw(). Such an
>interruption (specially in the case of preemption) might be long enough
>to cause a timeout without giving a chance of a new check on the
>register value on a next iteration, which would have happened otherwise.
>
>This issue causes some sporadic timeouts in some code paths. As an
>example, we were experiencing some rare timeouts when waiting for PLL
>unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
>we found out that the PLL unlock was happening within the expected time
>period (20us), which suggested a bug in xe_mmio_wait32().
>
>To fix the issue, ensure that we do a last check out of the loop if
>necessary.
>
>This change was tested with the aforementioned PLL unlocking code path.
>Experiments showed that, before this change, we observed reported
>timeouts in 54 of 5000 runs; and, after this change, no timeouts were
>reported in 5000 runs.

Well, I'm using a crystal ball here :-)

This is under test as I type this (I just checked and it is at run #1053
of 5000), I'll come back later once the test is fully finished.

--
Gustavo Sousa

>
>v2:
>  - Prefer an implementation without a barrier (v1 switched the order of
>    xe_mmio_read32() and ktime_get_raw() calls and added a barrier() in
>    between). (Lucas, Rodrigo)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 12df698f6764..16b3ca97f7b4 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -536,6 +536,12 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg re=
g, u32 mask, u32 val, u32 t
>                 wait <<=3D 1;
>         }
>=20
>+        if (ret !=3D 0) {
>+                read =3D xe_mmio_read32(gt, reg);
>+                if ((read & mask) =3D=3D val)
>+                        ret =3D 0;
>+        }
>+
>         if (out_val)
>                 *out_val =3D read;
>=20
>--=20
>2.42.0
>
