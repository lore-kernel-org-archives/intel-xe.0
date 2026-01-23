Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04B2D778AB
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 18:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624F310EBA5;
	Fri, 23 Jan 2026 18:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWRYvk18";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122A910EBA5
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 18:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769192138; x=1800728138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QZGcsi0UzmOVcey7vaYVUJe2LQlM+cA3P/4CWXhYTfg=;
 b=KWRYvk18la9fOfO7ELRMQ/CUbGoU8zaRs+6+j8sI6jUID7L9DuvOtifp
 W0WPIaPv2t1BBC2BdXU4APRFOywypO4eUlRduPLb/kaEyeoOv/U7VpmjG
 zbUR2Wj+etsuawxSUKJ6cqEPN4Qox5xpL1HTRVkqfCIQ2mWch6F3J25N4
 R/msZLlmuzTfaWZxkHiR2Y5J7/ud8puYCUDlF3joz4EH64aNRlgMeZbop
 Y1h2ftEnVLJbdof+adALCJO00bzlLYNcQgKoaTHT7Fojf8Yt9EHxL1G5A
 BwWZXgAS3KaCcBACJ5KsJec0NxYSS/P+rGbODfAx/fDVh0Jvz0HEaAp2b g==;
X-CSE-ConnectionGUID: ndQb6LxFTqKMxwQvCO8Mlw==
X-CSE-MsgGUID: /ryxeLvERE24lBPrFDX+1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="69467777"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="69467777"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:15:38 -0800
X-CSE-ConnectionGUID: zuDZiPk6QKqmUk5GK466QA==
X-CSE-MsgGUID: lfNSiEZ9TnqV4gGpp8MCow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207333150"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:15:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 10:15:35 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 10:15:35 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 10:15:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSxbfd4s2FprLhGHb+3Tx0eLtH5nOWL2nBAL5xyj/fMEqcNAOBzFH1H44BctqX/E2tX6dguLROwYR+Jg8U14uVjHMs/73V5ZYP/ZuDvS9E+98IGuZOvU9RIRG6EvP87iQH2XvvDF3ju6fraAn9vaO9daq7JFOj12bwm5Apm5KQFhzbGWDhJY5Xtz74t+PXbuq8tF2e6OhM8Oo9OOmZLcrKxVGRWoX7NvyIlkTHNAxcb0hw5F2LFLKey4v1vNhlcujwUX9rPP7gELtuwBDS588JrMxWtLRY9b72BVv5udD/LVa+6QmA0ELolmAE5BXVXH4kRw9ax7oLJTOlbNcBXnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyXRdw+wZJVqwSE3RzeCPnR3b9gHxwpAXpIajtdOb2I=;
 b=r/d4zmScbduNvkfAvco8oBrfqbCI/4xOuji3a6vndaObUSPym3g7QhGrP+brmJKjAZvChV203eIVzs9aZ5dGBKx/3ocdmlg6uXNY35/bSJXOU+AsSiowOz7Dx5/lGFqHEp3YgfmbnDQLby68rBAMo3bOGHDn38QIAWzgiugtWYXciQnuwvi4nJcHKKMarpxOS48r+v9YKp7BLNDEfgpb47KDSwjG6vdBNALKg27ddssiFzbvejRuYByJXJoGWPTKyQukXVoQaqJPhuCX302mTs3pWu596lAU2f132qyXCUwD4F1iUXwL7AWBKpd39dJUzZsXTVrnXIxmSaZcthetsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA1PR11MB6893.namprd11.prod.outlook.com (2603:10b6:806:2b4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 18:15:28 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 18:15:28 +0000
Message-ID: <577a8e87-8c85-4ff3-8875-0769650b1561@intel.com>
Date: Fri, 23 Jan 2026 23:45:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20260116103451.304716-4-sk.anirban@intel.com>
 <20260116103451.304716-6-sk.anirban@intel.com>
 <5d9b546a-421d-4006-98ea-a2e930f935fe@intel.com>
 <73520ae2-967e-453a-a7ec-dfa0b2d6a080@intel.com>
 <800a6f03-62ea-41c7-ae7b-d25606ccb708@intel.com>
 <847f9254-6712-4fc0-8bac-48c91aa2d0a7@intel.com>
 <f8b01eb4-f582-4f78-be33-11e64bdd47c7@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <f8b01eb4-f582-4f78-be33-11e64bdd47c7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SA1PR11MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aca6ffd-43e5-44f8-7f14-08de5aab62e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFJnK01Ra0dNaEdoQzZFVUVsTEo5TWpGOXlZWXhHak9kNHMySThXaW5Pb3hK?=
 =?utf-8?B?cW9RUHE3N245Y2tMRzJNb2w0NWhHSm5pNXVLTHNRU1BzaXNXc1F3MHBNckRP?=
 =?utf-8?B?Skl5OVpZZGZPbjhVZW1qdnNWYjFTUVdkRlJkZThBdWJBY3JxMjRBbG1JWmNs?=
 =?utf-8?B?dHhOUlpodUp5TEM3SGU2NTZqazE0VW1sdkdaMGZSbFExc0o1b1F1VHdPbDFl?=
 =?utf-8?B?VGIzOEIvMkNZTVo5VVIzNlp0SzBwWnV6amJuOGZjWnV5U0JXWGdRcWhIQlBn?=
 =?utf-8?B?Y0NzMmpDUk5ZNGVuOE9iSTg1d2E2bEV3UFg5UU53cmZEY2cwUzVrN21udkFq?=
 =?utf-8?B?N3ZSL2RYeTN0eFJhSVFkTFdlOHl6TVYwVXE3UGQzR2FIVUhLRlhQYTFjVnZj?=
 =?utf-8?B?MGJCRkxmTkZwSURvRWNoUU1XbkpBbjdldlVYY1l1NzM0MGV2TUpyYUkrbWVr?=
 =?utf-8?B?N08zSDNWQTFpWE5HT1dvVDdKWTZTSlVhVDJ2Tm5BbHQwdW1nRGMxODVRMDBI?=
 =?utf-8?B?MFVyK3FKRktHUnBNWktQOU5hd3hueDk4a2huZjdhQ3BvbkgwYlArMTZNRGhY?=
 =?utf-8?B?QWkzYzY2cmJWbWdSVjAvMlQyNThmRmppLzhxSVpsZFh4YTZLelFkd0lISVVW?=
 =?utf-8?B?Ui9sYjJiUGZ4MkhzczYzNmFKOUdwWEZITFVWdVNhRzBEVENBdTRybWhpR090?=
 =?utf-8?B?NHJpYU1Xd3duT2QrbTZCM1BKLzFhWkRieEdvaHMvejBITHk5dGJXOW5rUDkz?=
 =?utf-8?B?VDZUN0xwcVNISXRoczh3ZEIvaGRueDRuL011Y0sveU43Q0JmdDEvZ3djRThO?=
 =?utf-8?B?OUtoS3Jac1dENS96VzRENTRnVXBhU28yVE93TzV6RVhaeUdSdUFRUThLRkY2?=
 =?utf-8?B?YWRIeUY1Q2tEU0xNUWJCZk9meFVuTFRYUFhrb0lNRTNqbHA1NkdiVG5DN200?=
 =?utf-8?B?UVRvUlI2TERZL2xCaHN6SHQ5aEU1djFGT2F1Z2pXMVdwbkp0ZmJMaXhUOGx0?=
 =?utf-8?B?b1MxeVZWRXBoalBxcmlSeFlzNDlyVmV2ZG1jY1BKclpUSUVnV3R4OVU2V0Ri?=
 =?utf-8?B?OEtiZmVNME1KM0d0dStCbHhjd0FHdWM4SGxDOTZlSUNUTHAyaEZJTEhMdVdO?=
 =?utf-8?B?TGFySndjZEZBaERJOVB6VHFJTFFXWTBJbmJFSzV1Q2twVnNHRTBIMU50b3N6?=
 =?utf-8?B?bXAva01tUWVSQ1E0SW9Rb09wOHZoN05DUDVyMUo5OW1HcXM5QUliK0dic3Iv?=
 =?utf-8?B?TW9KbFB4bDlFZjBHSzFMVVYxWnZpNU9WYkRkejlZWS91UjQ1eHpVUllMRGZ6?=
 =?utf-8?B?ZHJlOHNXYkVSWWVEYjMxQTJRSUYvOFFOODMwZXBOaDVkc2pWaFBEcm9YZEp1?=
 =?utf-8?B?WFpNWloya2Zma2ZDYzdSUzJHMFhaYzh1dkNVMFNzOVRCMTVEdlFqc1VxU2Zk?=
 =?utf-8?B?UEFJbFhyYmZzYmZ6YklhVFRXRnFaaUlkMnl5akowemxya1o5a09KdndlQXpo?=
 =?utf-8?B?VnhmMUJ2NjdlcXBPbHBTQ29JT1dsOWVLN0lVY01FWTVQNlhZU25iOW9xb3Ew?=
 =?utf-8?B?MU5sRmZqTXlnWTV0RDZCbmZia2FFdGtCTHF6VUJwQ1UxWDVPU0p2MitHMnF2?=
 =?utf-8?B?TFlpQi9TQ0k2TEowU3l2eG5VK09DMjZTUTh0c0g0KzltOWFKM1JKRU5lV2pZ?=
 =?utf-8?B?TXVIc2tNUDlzYU52Yk43dEpUQkZBM1M3YnZrNFhLcXNGazQyKzJ3bWEzWTVQ?=
 =?utf-8?B?d1N1SUMwajVoeTdRNXFyaFBLblRyRjRZaEFWUXgwaUJzakRvM3FFS0JCOTRD?=
 =?utf-8?B?RTg5VGxhSXBQWEFFR2VoaWpabjlmbmk3N29xZmtaTEtkZUZTR050T24rSlRD?=
 =?utf-8?B?eTUrNTR1NkxwRXBIczE1S0ZXN1pPbDZrbzVORTc1UDAzdlJxQjE1TVpvc3hV?=
 =?utf-8?B?aFpyblo0Mk16TmFVWCsxa085OWtycCtkNVRla3RtaVJrTTlMemVNOS9lWHJy?=
 =?utf-8?B?S2RyS2h6WlplLy91bFpMaFc0cFZzODVvd3ZTZXIza0lKdVNiMXphdmxXdDc4?=
 =?utf-8?B?dng2bGRDeFlEdW10dUZsbEJHNDJlTlFnSHhDemhvdkNRemVwbllhVE52UC9s?=
 =?utf-8?Q?77Ls=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWJCM0FQMlZCazhDNUFIYWNWdTliV2x3dFREQ1hjSGRjWHlnclZDSm5oL05E?=
 =?utf-8?B?Q1JhTStxaFBCbGVtL1BNcU5ybTdYem15TWVzdDNPR2JzMFBURy9wM1g5Z21C?=
 =?utf-8?B?c1NOWWQ3VnYxQWhOYy9SMGdMMUFJNFJmNUhDV1Qvb3FOWVNJYmtSd0ovSTFw?=
 =?utf-8?B?UWFkYitSODEwc24reENpRHpIOUwxcmhrYmxsTVpYaloxcW0vdjBZMmY2RzY5?=
 =?utf-8?B?c1NsQzlSSHBmNUxteklqVEw4aUJ6cHh1YnNaaHZOQXRYa0ZDWUVZVjhxZzJp?=
 =?utf-8?B?Z0w4TXZTODM3elROclJBbmdtLzhma1VBcjNNWElmaHh6dXpvNEpxUS9QdXUx?=
 =?utf-8?B?YTEwbk9tZzB3T1hWcHB5RXJhK1dvL0I5TmhpYjZ1UHliVVkwb21tOFlLYXpZ?=
 =?utf-8?B?aDRUQklsR1ZvRHg4YmNJc0IxTmxBb21NSmJOdnM1amxOUnlNL3pGUGVCRVBs?=
 =?utf-8?B?dzI4VXlVVGlNSlN6eEtFdUFObzA5N1QyUW5CM3M5UVVhT3dOWXo1VXB4ZTgy?=
 =?utf-8?B?Wm5vRDcyVWlaNkY2YkJydkQ1SW5rQ2M5SVNYVGoxOXBGQ2IwaU15aWxBR0Yr?=
 =?utf-8?B?OGFKOVErRUtwSUQ1OU9GT1NQNndPRUk5ZFRNUXFLemMvNDVJLzNOSEpaYVdz?=
 =?utf-8?B?SGxqak05N2N6YUcvWlBQUjJvRXpOU1RPOTZQcGRMVFZBNld6MEhZU1hZb2RJ?=
 =?utf-8?B?bzBwekx2bzlOOXhjK3h2SGNGd2x5VGdyUnZzb0VtNjVoYjNSdXFJdUxEc3Q5?=
 =?utf-8?B?VTdSTUlXTXBUaUQ0MG4rczRsaHQ0NThjRXMzRWRvcXN1TDIra29wUDBLZS9P?=
 =?utf-8?B?N1pHWlM4WnhaVy9PSWl2UnJNbEZrTWlleGdORlE1R2sxSWJhUm5IQkdrOExC?=
 =?utf-8?B?Q243V1B0MEdvTDFFOHEybUlrVUdLSytmUSt0ZW9qNWJqWk0rSnNkTzJKclIw?=
 =?utf-8?B?eGdwT25DMUE2cHFIRkJtcnVVUk1GUG9YY2ZDdnhtZlR5cjdqN3Y4d1BXRllu?=
 =?utf-8?B?L0JRbllyREw4K1JWUnh5NXVydU1oVnRCL2E3aWhRSVdHWmUwa3pieGVIYWR0?=
 =?utf-8?B?SU1wcjR3WmFmNE03a2JCODZYR0ZUQklTbkhGUXIzdVhCS0dCNjBhTnpuaFlo?=
 =?utf-8?B?TjFpUHhGblZyU2lPY3RKbVhBdkdiVER4ZWhhZWg4Ym00WUlqTVF6NHZMNnN0?=
 =?utf-8?B?cGc4aVE2bXlIWHhKMUV4enljcW1nc0MrampielFZSEp3NndROENXR0RPN0Z5?=
 =?utf-8?B?WC9UMVNPc0FiYUV3VEMyNFppUEFFSUFHTEhIMGVnREN3OXFXWGZIcEVCSFZp?=
 =?utf-8?B?UitZMVMyRGhpRENlWHovSWgzNkRpWkxuR2FkM1JHTzU3WXZqK2I4K1lacm9C?=
 =?utf-8?B?VHFUMVdhaEN6ZEdmU1ljRVVmWFgxZUlhcVFtS2hyVTZZcW0rRGF0dUI0NHBt?=
 =?utf-8?B?ZjlHVk5iRDZYYk44QlYwTE1aY20xMmhnTHRFcEZtYWtjNXBJRmJyYmtLS0NZ?=
 =?utf-8?B?K3FGNVg1K201NDB1K3dmSmxjWERSNGhNa1ZJZUh2bC9oOHdJNDNSQzZpb1Jk?=
 =?utf-8?B?OEU1YkxWR0NqU25yWUtvemlrQUY1RjJQL0FQWjNoY2oyME0zcjBuZFNvZVBo?=
 =?utf-8?B?aks5SkM5SGVIWVU4MW1PM3NJNkN2dW8wY3BIc1dPYUlXN3cwR3UyMFAwTGxo?=
 =?utf-8?B?d3k2UHRDSDRvdmlaMldNdHllUVEzUXZVaDRwTlFvekRMRHJNT0J5amhwL2g2?=
 =?utf-8?B?d0pqQUZnNUdwaE5zUUc2My9VM3kwZmtBZm9Nb2dNcjF6SVVkV3NsVmxlL08z?=
 =?utf-8?B?SDZvU1Y4bnhMWk5xdEI5K21wNlBoQ2dHRFR2cUZEV2djWUs1enpZQnhSRFFq?=
 =?utf-8?B?UU55N0w1L1dSSldtUE9Uc1pOU1Y4QWFSRVM3RnRwWTJYbjBHWVgyT3hxQkxi?=
 =?utf-8?B?UzJtVXptUjI0VkgwbmVQTTdpL0tzUUZodzN4UDVVYkM2MmMzUWdkSW84blZM?=
 =?utf-8?B?alNRaktRQVA5eUlpU3FyTGE0OC80eXpkbTRVUVIrenViUmg4RHBtbUpzOFNX?=
 =?utf-8?B?UUZFVkMwLy9HQ2RrK0gwaXE1azBlNjV2MW5qSjQ0dHhiMXBKS1ZsaFZaOGh6?=
 =?utf-8?B?MjJsczNCNXdJMG45M3JRUlVhWHBERVJhZjNaaGtSUnlScC9iSmFrZC9nWVpS?=
 =?utf-8?B?SmJjOW9YejFkQzgzUWhHUXlYZUZFQ1dsK0YvdmdQampWd2hweXZqQ1pRbHFj?=
 =?utf-8?B?Zk93VElnTXVuQ3dia0Y2a1RBNU45RTVrSlhnSjVVOGpHTG5pc3Y1ZGRRaUQ5?=
 =?utf-8?B?WGNISHQ3a29mT1RHYW5VTnpTTHRNYStPTzU0Wk1aaEVoYUdiY1dWdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aca6ffd-43e5-44f8-7f14-08de5aab62e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:15:28.2599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJpX5XWBktyDiCg5ALwtrAT7VnSxVpRUDPgBNL565xWttxa8TWXAYW/bs+qUQnopp8KC+rZo1v7Ou5avxNvNxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6893
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

Hi,

On 23-01-2026 11:28 pm, Daniele Ceraolo Spurio wrote:
>
>
> On 1/23/2026 9:54 AM, Anirban, Sk wrote:
>> Hi,
>>
>> On 23-01-2026 10:58 pm, Daniele Ceraolo Spurio wrote:
>>>
>>>
>>> On 1/23/2026 9:12 AM, Anirban, Sk wrote:
>>>> Hi,
>>>>
>>>> On 23-01-2026 03:12 am, Daniele Ceraolo Spurio wrote:
>>>>>
>>>>>
>>>>> On 1/16/2026 2:34 AM, Sk Anirban wrote:
>>>>>> Prevent GuC firmware DMA failures during GuC-only reset by disabling
>>>>>> idle flow and verifying SRAM handling completion. Without this, 
>>>>>> reset
>>>>>> can be issued while SRAM handler is copying WOPCM to SRAM,
>>>>>> causing GuC HW to get stuck.
>>>>>>
>>>>>> v2: Modify error message (Badal)
>>>>>>      Rename reg bit name (Daniele)
>>>>>>      Update WA skip condition (Daniele)
>>>>>>      Update SRAM handling logic (Daniele)
>>>>>>
>>>>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 +++++++
>>>>>>   drivers/gpu/drm/xe/xe_guc.c           | 30 
>>>>>> +++++++++++++++++++++++++++
>>>>>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 ++++++++
>>>>>>   3 files changed, 47 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>>> index 87984713dd12..c9cb02f32f5a 100644
>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>>> @@ -40,6 +40,9 @@
>>>>>>   #define   GS_BOOTROM_JUMP_PASSED 
>>>>>> REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>>>>>   #define   GS_MIA_IN_RESET            REG_BIT(0)
>>>>>>   +#define GUC_HASH_BOOT_CHECK            XE_REG(0xc010)
>>>>>> +#define   GUC_BOOT_UKERNEL_VALID        REG_BIT(31)
>>>>>> +
>>>>>>   #define GUC_HEADER_INFO                XE_REG(0xc014)
>>>>>>     #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>>>> @@ -83,7 +86,12 @@
>>>>>>   #define   GUC_WOPCM_OFFSET_MASK REG_GENMASK(31, 
>>>>>> GUC_WOPCM_OFFSET_SHIFT)
>>>>>>   #define   HUC_LOADING_AGENT_GUC            REG_BIT(1)
>>>>>>   #define   GUC_WOPCM_OFFSET_VALID        REG_BIT(0)
>>>>>> +
>>>>>> +#define GUC_SRAM_STATUS                XE_REG(0xc398)
>>>>>> +#define   GUC_SRAM_HANDLING_MASK        REG_GENMASK(8, 7)
>>>>>> +
>>>>>>   #define GUC_MAX_IDLE_COUNT            XE_REG(0xc3e4)
>>>>>> +#define   GUC_IDLE_FLOW_DISABLE            REG_BIT(31)
>>>>>>   #define GUC_PMTIMESTAMP_LO            XE_REG(0xc3e8)
>>>>>>   #define GUC_PMTIMESTAMP_HI            XE_REG(0xc3ec)
>>>>>>   diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>>>>> b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> index 44360437beeb..42658a409556 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> @@ -900,6 +900,33 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>>>>>>       return xe_guc_submit_enable(guc);
>>>>>>   }
>>>>>>   +/*
>>>>>> + * Wa_14025883347: Prevent GuC firmware DMA failures during 
>>>>>> GuC-only reset by ensuring
>>>>>> + * SRAM save/restore operations are complete before reset.
>>>>>> + */
>>>>>> +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
>>>>>> +{
>>>>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>>>>> +    u32 boot_hash_chk, guc_status, sram_status;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>>>>>> +    if (guc_status & GS_MIA_IN_RESET)
>>>>>> +        return;
>>>>>> +
>>>>>> +    boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
>>>>>> +    if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
>>>>>> +        return;
>>>>>> +
>>>>>> +    xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, 
>>>>>> GUC_IDLE_FLOW_DISABLE);
>>>>>> +
>>>>>
>>>>> The WA says that we also need to wait for the status to be "ready" 
>>>>> after setting GUC_IDLE_FLOW_DISABLE.
>>>>>
>>>>> Daniele
>>>>>
>>>> As discussed, a GuC reset can occur without firmware interaction, 
>>>> and during RC6 exit the GuC load status may transition, meaning it 
>>>> will not always be INTEL_GUC_LOAD_STATUS_READY.
>>>>
>>>> So we’re checking GS_MIA_IN_RESET instead. I just want to confirm 
>>>> that this is enough to ensure FW is present before applying the WA.
>>>
>>> The GS_MIA_IN_RESET check + boot_hash_chk are enough to determine if 
>>> the FW is present. However, waiting for the ready state is not about 
>>> confirming if it is present, it is about waiting for the FW 
>>> initialization to complete after we've confirmed that it is indeed 
>>> present. Basically the WA is saying that we can't do a GuC reset 
>>> while GuC init is still in progress.
>>>
>>> Daniele
>>
>> Understood. In that scenario, a timeout check on GUC_STATUS[15:8] = 
>> 0xF0 should be adequate to verify that the status is ready. I will 
>> add the code block for this.
>
> Note that the GuC init can take a while if we're throttling due to 
> excessive heat, so use a big timeout (100ms should do).
>
> Daniele

Sure, I will use that.

Thanks,

Anirban

>
>>
>> Thanks,
>>
>> Anirban
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Anirban
>>>>
>>>>>> +    ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, 
>>>>>> GUC_SRAM_HANDLING_MASK,
>>>>>> +                 0, 5000, &sram_status, false);
>>>>>> +    if (ret)
>>>>>> +        xe_gt_warn(gt, "SRAM handling not complete 
>>>>>> (GUC_SRAM_STATUS: 0x%x)\n",
>>>>>> +               sram_status);
>>>>>> +}
>>>>>> +
>>>>>>   int xe_guc_reset(struct xe_guc *guc)
>>>>>>   {
>>>>>>       struct xe_gt *gt = guc_to_gt(guc);
>>>>>> @@ -909,6 +936,9 @@ int xe_guc_reset(struct xe_guc *guc)
>>>>>>         xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>>>>>   +    if (XE_GT_WA(gt, 14025883347))
>>>>>> +        guc_prevent_fw_dma_failure_on_reset(guc);
>>>>>> +
>>>>>>       if (IS_SRIOV_VF(gt_to_xe(gt)))
>>>>>>           return xe_gt_sriov_vf_bootstrap(gt);
>>>>>>   diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>>>>>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>>>> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>>>> @@ -73,3 +73,12 @@
>>>>>>   15015404425_disable    PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, 
>>>>>> FOREVER)
>>>>>>   16026007364    MEDIA_VERSION(3000)
>>>>>>   14020316580    MEDIA_VERSION(1301)
>>>>>> +
>>>>>> +14025883347    MEDIA_VERSION(1301)
>>>>>> +        MEDIA_VERSION(2000)
>>>>>> +        MEDIA_VERSION(3000)
>>>>>> +        MEDIA_VERSION(3002)
>>>>>> +        MEDIA_VERSION(3500)
>>>>>> +        MEDIA_VERSION(3503)
>>>>>> +        GRAPHICS_VERSION_RANGE(3000, 3001)
>>>>>> +        GRAPHICS_VERSION_RANGE(3003, 3005)
>>>>>
>>>
>
