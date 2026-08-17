Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8652C5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 19:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D46B10E331;
	Mon, 17 Aug 2026 19:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJgL7cpz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A189310E331
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 19:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786995056; x=1818531056;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YOHeDxfdknnsyH/IZH+TO43sLDKFMHHiKOW8UNGNO7k=;
 b=IJgL7cpzCH2LWn3g2ci+2ipY/IE2N0bZGgpDrSMIRwWgZBcorTp1moWa
 YsC6H8guFFm8MSLXno6B7ZmZ3Y5Gs+orC4EHLVipAoUGB2YY/KqeETznb
 x9qtR8vNvcuFvhSVrAKWj6D3EqrNCFCIT8DK5G8cCc1TQzVXAcKAG56uL
 qN+wTj0Jdl97EI5Uubc/OnCdStH1nSjul08A6/Tv24zIb7iEw4H/SjI2H
 rwaE29vSRsMKLyQiYsKyGkLo4+4JZW68Vk1aeIe7nF6/bgcjkkxIvRdFT
 dYlrVKAzkv1wWySipRfDGJIEpuU2BpggXIxY1KHAXopiRcZjhBWiL9Zi7 w==;
X-CSE-ConnectionGUID: nRc/q7RURAefJXec4ovaIg==
X-CSE-MsgGUID: nKgDONwVTwqjdW2WjQTFUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="89993966"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="89993966"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 12:30:56 -0700
X-CSE-ConnectionGUID: +pr4TyUHQ76qq2T0bXaQUQ==
X-CSE-MsgGUID: iTPFu/g/QseWH3Pf25ByuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="266978995"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 12:30:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 12:30:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 12:30:55 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 12:30:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUyu1QqOv+FT6uvI2yD9jGZuzQerHDg21nNtOG05WgxpzBreItKt7+vzf/DfqFnkmJt1UhPaSwM+Hzse1H3LD9prdInDoNviC4qr4BuzkX/urS1Qbhk/K8+VNfPR57jvU0+3cO/0BPytekdJiugE20Vdp0CcDezle/hzN5Ap9TfSlbTcwgdY9hwqPCfELTYlyBEB4Qb4ShkACwWBIU3fHqw2cIG6K/k0ch0DMrBlYCl5DI5/irFfMZWtKcmgdRXy8jWfCMJ4t5oyCt2w3+7rzaM+SLpJOdfbZtn1YJ+NMnBu7Y99UveX4h1VeITxOXNY1i/9Fw4+dx37kNFT3tqVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSR9s3+0loBlqfc2I77JXkndwqAZBO63+l3e5Q22LOY=;
 b=m20ZHIvPGeD1ajrs9klNtJCisDsWh0chbgiOf5stCKzbBT0lmbiYiCyzSbx6UngwE2v0GSOZYdsGAK8QihEXIe2kooqVvfNM2wstD98XlGEVvkuEyFnyLjF4GOaF6642DT0tCSWsvF2OddpuRaidcytjeU6lHWjT3n7ewz/IdIKT504D2Ys4YdT2u+DPTiGNG0SKyozpKC5ELlKDPEmg4F5ubKEbf2VXft9mFI3kLTs7C7kJqews13uJOV7Lje8StxXl1WfZLOweHi70N3kGxf5zt+xq/6TeepC36+7JST1vZQMIOsArS/5XiQzECBC7yuPJBsMPqsznR8crhWTh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by BL3PR11MB6484.namprd11.prod.outlook.com (2603:10b6:208:3bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 19:30:52 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 19:30:52 +0000
Date: Mon, 17 Aug 2026 15:30:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
 pages
Message-ID: <aoNhZwRGQC2uh95n@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
 <20260817065055.3734576-24-tejas.upadhyay@intel.com>
 <a670328d-b5dc-48b4-bb02-ed7dfa2d48f1@intel.com>
 <DS0PR11MB871812022E070C0052F5AF3F81A72@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aoMxh3bh1WEf8SF6@intel.com>
 <60960fcb-7aeb-4642-bd6f-ad1b6ffd2a2b@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60960fcb-7aeb-4642-bd6f-ad1b6ffd2a2b@intel.com>
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|BL3PR11MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: a80df5a1-ef6b-4e7b-dde8-08defc960c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|6133799003|11063799006|5023799004|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: Qwf8KRZOQQ0otWWsfxpqzpFGwVN5mUa7dTrFdEdDLESlVJPPwZ14DUPBB6FMUnE1O3aHB3xsUi9xbtl5YffnAjfKXa8NiafOLqZui+trZrX2EXO1VkeKd3LkhGAoRFaqGE6MCNh0+9mK2c8CqGC9HUgXFZooom0uB+CP3G34HM+WWUi4wlfwfq8U5lv0kVArYxbhnn//OLcJTKIFLvlPoFRjTIIcsUlv4Irbrc4cbbTQtmAM1NKyHIBkvq4PIoJmEWtSUlvfFm/u+0303kRwA2lwri/QV7KXk92eEkTsozl7QXfb0P7TjjWabPzEEc++J81xPfFQSLnPr8M9W2gJB4Ita1oBf5wK7UfQlTsDCY73OX93fn182N3IPbz/tMICEU1VOxOS3d165UV7quEXVSgE0jawt4/U4YSdjZdD6vn0EPwoHc77Xl3sYrkjOlmnJ7a7VmZHXHaU97hwpixj7RnszP59X1hs8ZdmsRLCSdbkQ3As6V+uZ/nvVMx+6RXI5lk3rWpa8nfgCJLv+OJSl1erk/R01bK6VAf/09wC5TK9naswakkhnnSZb1jOAFXi6irmUF3joxoFF2J+HBgPr5Eq2eexRP5WItkAuy0CjqwB3k7/q7HBfz9I7WyM/dsw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(5023799004)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekJxL3FPWjEvQTZMdzdYMnFLVHFmNWtPMDdYTEVrVzMyMzFjaFpObHRCSWU3?=
 =?utf-8?B?SUJISGNZODlSYXNIblZBQlhLL0M5NlFJdUJBeXVibGZuWXM5MGVhbEhGNzRi?=
 =?utf-8?B?SWk5K2toRHVTUEwxNTJFbGFXY3M3Q3lGRWwwdDV6a3FvWWxuYkw1NThTZG9X?=
 =?utf-8?B?VU94OVZUOFU2K1VicWk0N3kyT0FDVnQ3dy8xUHR0L1lzcVVSaSt2YU83V0FX?=
 =?utf-8?B?a1hRRGdtMVBVTVhHVUhwL3JVeGhIRXc2TXpqUm55YWZ2YWtoR053R2VGb29F?=
 =?utf-8?B?YmE3MWhlOGNTZm9EejVwbGJaU2JOKy84MEpqS3U1Y1N6WkN3amhaVmh0Q25q?=
 =?utf-8?B?aDY2MXRHOWM3NkVCaFpMOFlqbTN0T0pHU3RXaEsrbFZ4dmZjSmVNQWkwbjVq?=
 =?utf-8?B?cEVoZHY4bDFoallLNWdweENQODBGWlpCWVhFVmtlWU5UOG1BTmZrNmdjWTMz?=
 =?utf-8?B?dVdBUzdhd3plWVZValZ5bSsyZmpPYm01M3hWM05KeFVkdm5Pem9zaXhDMFpZ?=
 =?utf-8?B?b2lrYlVzNFJ2RDN3V3g2RGJQUE9PaDNkY09MU2diOFljZU5mSUZndTRUd1Nm?=
 =?utf-8?B?endCcWQrWlFBOCttUmpQV0tEbWdEMmxMQnFmdlBJdTBKSEJ2b2VCZFZyRVEx?=
 =?utf-8?B?bGdkWVRuaU05eDhtaEZZQ01GdlZBRmF1RjdaclRzd3dCcHBMVlZVSFR2ZzJo?=
 =?utf-8?B?eDFpblFJRnpNY2NZeXJKc0lPT3hjTmZRamU2RXdmUzRUTUE4MHhvL2ZlcHBL?=
 =?utf-8?B?Z2p2QUdlLzREbExPMEFhRitCTUp0MmpDblJ3bzVMY1hVMzJQeUVncFQwcmVq?=
 =?utf-8?B?K1gwMjFqSGpDZ2cwMUdaWWZvN3FkK1BkMnlxcHprL1hCaWhwNmNmTVcraXhI?=
 =?utf-8?B?YVdXUjNhYnhHcE5MeG1jM0dmWGYzaHNBd0VpNkdzU0Y1K0t3SjhXSFJRK3pF?=
 =?utf-8?B?aWQ0bjg4R3lDSmxaNElWY3p3VnhEQXV0Sk9ya2JaWnRRbXBhSFhLUU1pRWkx?=
 =?utf-8?B?eDhlVEhkVkw5NDgvdXljRzZkQTBCd3U5Q2J0K2hQM0N1YkFJWG1GTkdFaVd1?=
 =?utf-8?B?Y1NPV28yeURTcGhHV09CMnNMZndTendiV0xOQTBQTTIyOVFENFZ3YUFSZlhy?=
 =?utf-8?B?QWp3NlMvS0x0OXNOdWRna3VrU3RrOGxWSGFENWlWdzNHMXpjRzlBTFpZMk9Z?=
 =?utf-8?B?L3VsSFhoOHR3bkR2Szgzbmh1Z01RY1FJT0syV3FYYXpKYzRvck4wdkxvZHpo?=
 =?utf-8?B?Q1puVkM3c0ZkSVo4WTlCRGl0OU9rWVNXOUk5RlM1VGpQeHo1ZjJzRGQ0SVdC?=
 =?utf-8?B?OW44Nm10QU80R3dTQ2VBV0FIRXhsaVhtUmx2eEVwWFlQaFRNRXdhOERwemFp?=
 =?utf-8?B?OEZZSDZSQUwzWDFucnN1dDBIVnpGc0d5VCtLM21BSXoxZW00OE40Mk8wMW5L?=
 =?utf-8?B?TFV0V2x5WVNISkRHWHdmcjBoWTBLUFduUW00eFB0SVRBK3VFU2czcStiOTlZ?=
 =?utf-8?B?WVRFM2VaQUlWQWRQVVBHMFNUUUk0endvc1FYM0RUZ090UHpCVmo2NXcxMEVB?=
 =?utf-8?B?alIxanJ0cUdJVjBCUFRGN0grZ3E0VDRiS0hNZVBNbzU2N1N1YUFqS3dOTzNK?=
 =?utf-8?B?T2tlYUV4eHJJR2k0MHJRRFRyM0RBUHQvUEhzWGNIdmh5UXoydWFLdFNwS2Iy?=
 =?utf-8?B?VGExdWJ5S0tPTnJkQzZFaXBWUHduWmpnbkxxamJkRm5UV1lGenFlUXlMV3ZZ?=
 =?utf-8?B?SnlESGxaU2w5bG9WcXREdGJzSzdGdVhiUUdlWkZ3bEFyUjFETWM5dnZhc2ND?=
 =?utf-8?B?SVBZK2d0cThYakEyU1BScmltb3IrcG5DT0xiSFoybHc3dmxGNGRpVnR6VkNH?=
 =?utf-8?B?eGpWaTNpaGRMcmlvR2U2bjZhckRZMUZpY3RUKzBaQW9PMk1DWkV4TVdGbDNp?=
 =?utf-8?B?MjBZM3dMOEdhSkdMTnFMcy9nTy9QRGVSOXlNUmNaQVBwdTRhUVdlMGt1WTZP?=
 =?utf-8?B?MVE0VEpKM2Z0MzhFN1FScktkc1JtUWFhdTRDbkQ5MjRsQTdkbDgweXFxc2lJ?=
 =?utf-8?B?UmdZQi9nMk1zSUJsVnVRM0prR1pmaFQxVyszTVpJZ2lLQTlNc1QyZzVoaGJS?=
 =?utf-8?B?YTR5MGRYZnlQRkNLYnNlamZQRkVudndWcXUvbkdnN0FMYy9uZHRhK2wvYjYr?=
 =?utf-8?B?ZUdEWkphcDkwMC9KK1ZSaGtpMFdjdXA0ZjA5dXRENnB0TWJCbEpoL1V0NmRk?=
 =?utf-8?B?ZFpGeU0xanZYZi8ySHBaYjNpdjI4ZWFGOHk1cHBwd0RWQ2V2NjlRYUV0NXVk?=
 =?utf-8?B?ckFOUnJWZnV1aEQ2MHh3ZkpFU3Jkc1ZOM1Z2VUlaTVdLYkoxVS9pZz09?=
X-Exchange-RoutingPolicyChecked: Od5V/aw/bc3d18HaaAtAcLKsoOQFPcb3vVZ9XHf11UcPAVvd1VpPRBFbC2aBFMOuJ6d/8BJd/bR0FjDerzqRsGh0nusmPCqm0Vy+zn7W9TLULQto2MhNOopq2urfZCt9U3XeVGP+oPS4xIojohm2lvhnQn5SESps03+1GhDrdQ8KG4n+5xcGi5Q0oa6WEdOveFN9n1kyfM+GNU1d0+j0/tmRvtZsytSvhs6TOSCx8+toO0h0C9MyDWtQduNoZgV4tZUb2rZiQK+429czmHoDlzGyD4TI6IAoc0JBZcOSFz8s3kVioHnJ8OuA+NZkwTA3QV8B649yUH/FouhSC9n5LA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a80df5a1-ef6b-4e7b-dde8-08defc960c61
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 19:30:52.0105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZ2BDK3YwmICI2Opzpl4cTi0fbuW3iYsgPDLAWvC5R0pO/CU8NYUK4NytPvcr/d6BvQMAHbmX8NidN9anrkJ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6484
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

On Mon, Aug 17, 2026 at 07:09:46PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 8/17/2026 6:06 PM, Rodrigo Vivi wrote:
> > On Mon, Aug 17, 2026 at 02:58:31PM +0000, Upadhyay, Tejas wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Wajdeczko, Michal <michal.wajdeczko@intel.com>
> >>> Sent: 17 August 2026 16:57
> >>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> >>> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Thomas
> >>> Hellström <thomas.hellstrom@linux.intel.com>
> >>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> >>> Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
> >>> pages
> >>>
> >>>
> >>>
> >>> On 8/17/2026 8:51 AM, Tejas Upadhyay wrote:
> >>>> Include a sysfs interface designed to expose information about bad
> >>>> VRAM pages — those identified as having hardware faults (e.g., ECC
> >>>> errors). This interface allows userspace tools and administrators to
> >>>> monitor the health of the GPU's local memory and track the status of
> >>>> page retirement. Details on bad gpu vram pages can be found under
> >>>> /sys/bus/pci/devices/<bdf>/vram_bad_pages.
> >>>
> >>> since those new files are xe driver specific, shouldn't we refer to them using
> >>>
> >>> 	/sys/bus/pci/drivers/xe/<bdf>/vram...
> >>>
> >>>>
> >>>> The format is: pfn : gpu_page_size : flags
> >>>
> >>> kernel documentation [1] says
> >>>
> >>> 	"Mixing types, expressing multiple lines of data, and doing
> >>> 	fancy formatting of data is heavily frowned upon"
> >>>
> >>> [1] https://docs.kernel.org/filesystems/sysfs.html#attributes
> >>>
> >>> so to follow the guidelines maybe we expose the separate files:
> >>>
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size		u64
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count	u64
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved	u64[]
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending	u64[]
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_failed	u64[]
> >>>
> >>> or
> >>>
> >>> /sys/bus/pci/drivers/xe/<bdf>
> >>> |
> >>> +-- vram/
> >>>     +-- page_size	u64
> >>>     +-- bad_pages/
> >>>         +-- count	u64
> >>>         +-- reserved	u64[]
> >>>         +-- pending	u64[]
> >>>         +-- failed	u64[]
> >>>
> >>> then
> >>>
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size:0x1000
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count:5
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved:0x000000000000
> >>> 0000
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001234
> >>> 000
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001235
> >>> 000
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001236
> >>> 000
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001237
> >>> 000
> >>
> >> Thanks for comment, this is documented format by design doc. Sysman also depending on this format. So I don’t see this can be done without design being changed for everyone.
> > 
> > Internal design docs don't superseed upstream documentation.
> > It is the other way around.
> > 
> > But also, the files will be there one way or another. Both paths
> > are valid, so I don't believe that change in here force changes
> > in the userspace. Although, yes consistency is good...
> > 
> > That said, I don't have a strong feeling for one way or the other.
> > 
> > Since we are adding to the device level anyway, I believe it should
> > be okay. But Michal, do you know any doc or any precedence that kind
> > of force us to go the other way?
> 
> hmm, are we talking here about the attribute format or folder layout?
> 
> if about the latter, no strong feeling either ("files will be there
> one way or another")
> 
> but if about the former, then the same documentation [1] earlier says:
> 
> 	"Attributes should be ASCII text files, preferably with only
> 	"one value per file. It is noted that it may not be efficient
> 	"to contain only one value per file, so it is socially acceptable
> 	"to express an array of values of the same type.
> 
> and my proposal with separate files meets that expectations (there will
> be either single value in the file or array of values of the same type),
> opposed to original idea of array of offset:page_size:flag tuples

doh! I'm sorry... my comment was purely driven by the other sentence above:
"since those new files are xe driver specific, shouldn't we refer to them using"

But now I looked at the content o the patch itself. This patch as is is
a BIG NO! It is against the sysfs rules. Period. Internal spec and other
components need to adjust.

Also please do not repeat the same PVC mistakes with tenths of lingering
sysfs entries. Organize this per directory as Michal told.

Another thing, make a design that is future ready, use 'vram0/' as the name
of the directory with vram0 stuff. Like we have freq0/ for instance.

Perhaps even

+-- vram0/
  +-- pages/
     +-- size u64
     +-- bad_pages/
         +-- count u64
         +-- reserved      u64[]
         +-- pending       u64[]
         +-- failed        u64[]

Thanks,
Rodrigo.

> 
> > 
> >>
> >> Tejas
> >>>
> >>>>
> >>>> flags:
> >>>>   R: reserved, this gpu page is reserved.
> >>>>   P: pending for reserve, this gpu page is marked as bad, will be
> >>>>      reserved in next window of page_reserve.
> >>>>   F: unable to reserve, this gpu page can't be reserved due to some
> >>>>      reasons.
> >>>>
> >>>> For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
> >>>>   max_pages : 10000
> >>>>   0x0000000000000000 : 0x0000000000001000 : R
> >>>>   0x0000000000001234 : 0x0000000000001000 : P
> >>>>
> >>>> The sysfs binary attribute is created under the PCI device kobject
> >>>> when the platform supports it and the configfs bad_page_reservation
> >>>> policy is enabled. Uses RCU-protected list traversal so reads never
> >>>> block normal VRAM allocation operations.
> >>>>
