Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAD6C54722
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D0910E34E;
	Tue, 20 Aug 2024 20:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kK4tpvL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBAD10E34A
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185580; x=1755721580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MxFZf7tAR/gOGOQ4YfcAywFM0xXHRIrqX4/jkr1wVMc=;
 b=kK4tpvL1Szaxgj02bhVG/N8/38E43JaKn3nUSoeCfv+vUBruWUsyW+Pm
 1hYaF+gTHAQbJFcjtuRWzc/rPWZdrIrc5fyTBTE3lpdUkQZnyrQ1XMT2h
 J9N0yor0vJHJ0DzHipVWrPjBflCHL3fVke9lcY34r7hOsG40xhLLZCMEF
 QXyaHDbIJbYHcxSTEy47/MWbMrfSgAZc1GdcUOd2/SESWTfvOv8yzUOhh
 iUVfVr01TtvOVqG/6oYUoW9QcJieaZrrxyDUCBkGhwg+0dRyTAQzJO4Wn
 84/pOigKvNNkaXPiyruNxzQ0NfdTVFtxmKoL/myLGuSUjEuBpYxAZfOa9 w==;
X-CSE-ConnectionGUID: oTk+vsBDTB6CdSb6e04Igg==
X-CSE-MsgGUID: HcgJ/YC/TmmmNs+S2VBJ0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="25413588"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="25413588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:26:20 -0700
X-CSE-ConnectionGUID: fqTT5kKtR2GA06Y5IEe/fQ==
X-CSE-MsgGUID: lsECp/LlTuq7HCH5nxDk2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65809758"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:26:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:26:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmkY1ClgcFek1XLZpPWS3c+W6JTKYhroxjdR3edh9bWFJjTjaLO0SAcvZuLzvS3OJ3M2MK5kmRzOZeg9yYLRTyWdjGxNK4viamwNcti+rnMDH53Gt2P1zcD6svoPiCoI59t4jDyxCV/d+EuURrC/qNgJfX+jxa4rtv9hMWbYQHz/MUJBF7XblbRLRFMT+JzKv+5PPMtzi6mM/ZeMRwoysZPVh36Ng64KpvsW3SM3HubkZWzG8F67BOAa/RwvcsDZ7ePBX4VX0+FCEIElrzbSiey8Kq/cUftMbhTjZrtVvV5VGFO+1w7y1zfLMIy77oSH5abLIApGl6FmS7xjv2Xu8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8g9enwFjwXsRvDtspC22Y/lSAcbpMdPFT3UdyfWi+G4=;
 b=MmguzLPWT6Ly/HerlmhYv+j/LqSIm5Fhcn3q5b/a6UET2lizsLVbrZ0bpGzkRQYFI1sYvG1XhjDiaRQTm67dEqWK7VymPHBD2A6T0UybH76jl6hoxvchhkOudmOPCTaKXLIpQWOmfKjq4TYYlLuqCWA615Jg14HrKYXpdQ96tF3HBMm+LESwyFYHofQgeffOqgjueQgiXCIg/PE7JZVd6BZmPltNSryiVFWVwocrfg+nOv7nd5c/Tzx2QQ/fAi6Ne2xEbrRu3psFtZM736edmpMxJ3qK1LFsmTJAax4bqkmVaz2C9nxr4AvyNa8MF9Cka1qGTrxRKGfVlhPNkArAlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:26:16 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:26:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew
 Auld <matthew.auld@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 12/12] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Tue, 20 Aug 2024 16:25:47 -0400
Message-ID: <20240820202547.300257-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0362.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::7) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b9bc22-622a-424e-55d6-08dcc156578e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkdLN25pbUpub1pueGV1NUxUTzE2Y3ZUM2owbS8xdzNrdXhkdFdUUFI1WG1V?=
 =?utf-8?B?VmdYSTZOR0pPWlVQNUl1NkhZNTN0QTMxQWZ3c3A0a1FSQlpHYnB5bGQ1MW55?=
 =?utf-8?B?dFJuWUtWS08wMnlCalorQkg5aThoNU1XUStPdHFQeFl1bHZhaVNJR2NxTnhF?=
 =?utf-8?B?cThSOW9HZm1NdmUrQmR5QXprSGpza0JvbG1WNXl5VTJWZUJTeDMxSDBUa0Y4?=
 =?utf-8?B?S2ZzMkFIaXFnakREblVGQ0E2K1NWOFVoNW9JMEgzSkF6dTB6aWxmRkgxM3lJ?=
 =?utf-8?B?Q0RHeG9DYnpOa2JsMFJVWTlxcy9TSnhDUzhsRFFNSDhJbERCM01VS29jY1JN?=
 =?utf-8?B?bDdscnRkYWlCcThpZGs0UVZ5NUdKbDhzZGtrUUVReUdmVC9IQ2J4WEtzTlVS?=
 =?utf-8?B?R1dYclE1NStLM3hVQWxJV3A1SGtuTzRMUGQvTmpjeDVyNzdadlEvbFVqdHBm?=
 =?utf-8?B?czVmYjFzcjJQd0dJOFhPeFlnYUVORklBOXZ3ZjFrSnI4WTJ4c3Y1Q0sxVHpT?=
 =?utf-8?B?M1JCamtadTFLaElSOFVjbEpQUUNoS3dZZ2hJVmU5SzhqKys2UDVERXY3S1Zw?=
 =?utf-8?B?NjdkZEIxb3Q1QnlCa0doTGpiamJkUndsNUFkUDhJTjhpeHU5QXRDT2ptOVY0?=
 =?utf-8?B?aVIvRjFUR0xLN0ptV3l5V2kxZnJEU2tNS0UySFVuV0dmZVp6bWx4UktRNnp0?=
 =?utf-8?B?R0N3NlBHUmR4azZFN3hzS0VQbXRBVURpRm5pZ3Q0d0FXNHJ4dlB2V2UrQ2R3?=
 =?utf-8?B?NHdoQUZzS1l1ajdvcy9aYm51cU9DS2IvcXlFZTEwTXdBaHhyRktsV1poUEo2?=
 =?utf-8?B?b0U2b3d3cUR1b2ZFVWd6eDVHTWZWd0FXSnZtempFQmdRZVpKQXltV2J3N29Z?=
 =?utf-8?B?aXB2THljZzFQb2c1RFMrY0pweHd0eTU1bVNHYUZyZEdkSWQrWXBjeHhiRXZB?=
 =?utf-8?B?WkptYXcxcEVPNXNYZnlEZzBiWEhSZTBhRW1CUXA3YTF6ai9rYUNTMzliZXpM?=
 =?utf-8?B?Q2xMRW1MS3NuRm00cjlvcTIyKzVRUk1IYTJOVS9QUFkyd0NnU0NmbWNzdmVw?=
 =?utf-8?B?cGlubzlZU1E2cDgyTDhXdlhrLzZTYXkySmRXS1J5THBnS3F6MHI0RnpTZ1Rt?=
 =?utf-8?B?d2JEblNlZkFpeVJhTThqZHp5SE1BbHRjbTY2NVMzU0R4eEZxUmV1T0R6MGtF?=
 =?utf-8?B?SDJOY2NoL3ZmRzBHdlpIN3o5RGNVR1BnRUZZbm94UlB0SE5YQ0drS0hDenNw?=
 =?utf-8?B?UzhKK21mMWlHYzJMTHJSSXc0ZElKUlI0NGp2RWs3c2V3aFQxWXNZemlQY1Rk?=
 =?utf-8?B?Rm9YNE9nbmRDSll2WWhNdDRWYi9KNml0cjBKcHZ2WittRXlsZFFCR04zVkda?=
 =?utf-8?B?Q1pmZ1F4Yk1obW4rVFV0MWtZWkdrNmVHd2xjSTQ3eVlET2RiOFU4dGc3SUdx?=
 =?utf-8?B?cFFzdmRsOFEzVy9xc1h4eHZqVlFlUVc4NXorei9md2NuaVpoZlNXL1UvNjdr?=
 =?utf-8?B?bkloYlJiUldWM3hmbWhjelQ2ek4wdEx3aFExb2dPUUgvWUxJSlMyR0thRmdR?=
 =?utf-8?B?bjFoK3o4K3JiYVRXSDVsTGRGbVcrTXdwWXc2aHRZckFOak50ZFJoeWtuVVpP?=
 =?utf-8?B?Tmx5cjF3LzQwbkxaYkhBbnpBcUFvMTZaaWVoK2hKMjF0VmRGT3dlR1BxTm5U?=
 =?utf-8?B?YlRUMDFoZlVETnI4aXRDY0hjZk93ZFJ5b2IrQUkwYTFqSWtIbXFsRFhIVUtl?=
 =?utf-8?B?RUh0QkNBZGppTWR5SnJyZGlLZENjUXQ5RlN5RkN2aUFmZi85VVZZdmd4amt3?=
 =?utf-8?B?SnpVcGFKKzh1NkFNdHppdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW83b3JjUWFhRC9Fdzd0cG1KanZ3SFpLd3V0cURwUUhwRmVUUkI5aWkxNkNn?=
 =?utf-8?B?b202RjdJQUhsY2RrTlpraVowakc4WXp3UTVYcEtpbXVlWUtRUU9hajJ5V3ZU?=
 =?utf-8?B?V3ZGb3IyendtSXlyU3lQaEV6ZXIxaUJCUnRoVUdSN0pkREl0dDhaN0dQTitp?=
 =?utf-8?B?eHVzNy9YMmY1andHTUFqc3lqSkhvMENTYWJ1Q29JSDFhSVZVSks5M3VhNllv?=
 =?utf-8?B?My8xTjExNUtyVHpjRTJGNzh1RmdHNDB0T3BiQVNJTDFJcFU5S1dpNlJUdk1r?=
 =?utf-8?B?N3JoWENtWG1tT0JhcWt5bFZBVFBoc3Nqa2p3U3BoNGxCWXJkSkhVNk1JNUpa?=
 =?utf-8?B?dzdDOFhDQ1J1bFNaSCtyRFZkQzYxMTMvQU55WTAyZ0FLenFYbWJOQnNuRFo1?=
 =?utf-8?B?RDNXNGJaeGVReTJaU0ZnRzROUSs1N2ZSZmZlc1o2RGxmVkVmc29Zd0FPWDVj?=
 =?utf-8?B?SUp0R3IzNk5HcHVuRkJ4WG5SajM1VHVRU0dyVmV5WmpiZzU3TmpyVXBMeEQv?=
 =?utf-8?B?WURsd0pBT3BpZE9TTnczNEZkS1NySUNsZ1VXYTJSUCs0VERZb05WcDB2WEJN?=
 =?utf-8?B?OGRDSU8wMmNiZVE0eEE1MkJicHgraW55V1RPb29DcVFXdGNBSFpoQmtyUjNj?=
 =?utf-8?B?cU9TdjdGOGNwZW1Fb1ZlcmFDSWdQNTc1OVprZEpKRnYreVpBNmY2S3h1TlRC?=
 =?utf-8?B?RXZPRzY4NmFGZEp5bEZ4MjZxM0Rkc1BrU0tlbG8zVCt3KzMrN1EvbW9tR2xp?=
 =?utf-8?B?d3EvQ3AxZG9kM0NtYnFPRUxpb0dJTk1oLy9SamxkcG5ZcFhYUWhvdk1DYXEw?=
 =?utf-8?B?c2gzTGZNYVl2OXpLeXIzMTJid3AzaTN0Vm5URnY5OTI1ZnRzMlo5TFhueHVi?=
 =?utf-8?B?QXlOZ3JLdFdiYWMxV01HYlA1Y0hZempKYzgxdU1jY1RvUU9mN2RTaEN5SlFs?=
 =?utf-8?B?QlFqY0VvL0NyaXk0S2VmVG1ucGE3VURrRFQrUUFhNzNCYWpydGJqYW5WdExZ?=
 =?utf-8?B?S1JRakdQRm5SbkJWZHNZZVZVdlhxazJiSHMzbGJOSFYzckg3Qko4UGdJRVlK?=
 =?utf-8?B?U0E0b2ROdGtZaUJscEVXdE5yanNuMG1aTS9jY21XOHREdk5sWEZNV0JOR0lM?=
 =?utf-8?B?TVVLdUwzL3RWQkRkSEgyVnZnZDhxTzZMaXlWbFBXOUJ6cTNjSWZZVkE4QkRl?=
 =?utf-8?B?Rk4wNFRINDIvQnV2YVBIdWNRN2dUdGRkYzJSVlV0dkxpVjFsZ3YxdTd6VkFT?=
 =?utf-8?B?SVBCRXY5czloQjVybFltYVRzS3VzTS9kNGdFMTk1ZnJ2cnc2VEhLZDAxN0Y0?=
 =?utf-8?B?N3o1Q1IzSnlEd0tPYkc5VzNWbFJKdjlpTWVocXJ0M2ZOdE5KaDRmRDBDcmtL?=
 =?utf-8?B?dkhMc1FPMDAzaC9kc1ZCYU9XOWROL0dwUWlNUERDdDF0YVpaQlp1dzcxVmxO?=
 =?utf-8?B?c1lDSXFpOE5mU3JYOUtudGJSQmh1RUNFa3NCRjRKTUVacWhMV1dzTWFQT2p5?=
 =?utf-8?B?cVBqUTh6dnU5UkwrWmxyZUg3S2xwUGx2cUswMTRLaVpISWJzbzh6U3FYMlJN?=
 =?utf-8?B?THNrRk5uN2dzUUd3QXZZTHZoMVRrNEQwSTVKYzBWSE9CMEo0UFZyQ1ZtOEdC?=
 =?utf-8?B?Q2pPdGNJeUpPajRLY0IxQWtXeVQ2dTV1K25nYkZRN21SK3E1c0dOS3RiV2hM?=
 =?utf-8?B?eEVGclpqSVpRd1BJNzdob2JqZFkxMDRmTXRpZUdLTTloL0d6QTY5RWlBdzFK?=
 =?utf-8?B?TlZKaGlBU1JTbFBZK3loUG1CMWxVc3J4MU9UVFV5MU1YVjRidERQRkxaR0ps?=
 =?utf-8?B?NzJLYUlFZ2JWaXlocElPbDFKOTFJbHk4UHV1cG1kcUtUWUFKWWtsZTFUdjVN?=
 =?utf-8?B?T0hvS0xNSldVeXl4NjlYYTVOclUzWFhOem5xUzlrTVlEdHZCTjlPNXVRR1ps?=
 =?utf-8?B?V1JuSFFPUnFONGVVTVNmc2FJVmhyL3NqZWRqMGVDWE52Ui9DREl4YUV4bVRk?=
 =?utf-8?B?Um4ycFVXSm1YYkZ6Tjd3L0pkSkR5YU1DTEtuSjgxUHlDWEhFU3NTUDIvZGZH?=
 =?utf-8?B?S0hWNE5mR0dCbUcwWGQyc3BrQzYyMjRpUllmQVRtMGszNDlGd0JSdWU4MzYz?=
 =?utf-8?B?TVJSbS9SU3J3eDM1UDFGaDN5MDRleVJFNmZZakY3MEVFL0ZVWW9IV05JNnZ6?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b9bc22-622a-424e-55d6-08dcc156578e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:26:16.1842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cePKC9xp6/iGPdT02NCaUrtg+/C6fwJ1g9k6R9Rwih2FVDcYacAApD/wjO/HEvQ/2ljYMWujQ5uMj9eTu0uL5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Brost)
v3: amend forgot chunk declaring xe_device.
v4: Use a xe_ggtt_region to encapsulate the node and remova info,
    wihtout the need for any memory allocation at runtime.
v5: Actually fill the delayed_removal.invalidate (Brost)
v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
    - Own wq to ensures that the queued works are flushed before
      ggtt_fini (Brost)
v7: also free ggtt_region on early !bound return (Auld)
v8: Address the null deref (CI)
v9: Based on the new xe_ggtt_node for the proper care of the lifetime
    of the object.
v10: Redo the lost v5 change. (Brost)
v11: Simplify the invalidate_on_remove (Lucas)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 106 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt_types.h |   6 ++
 2 files changed, 73 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 58d7cad2425b..b4a0cd2b62ed 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -161,6 +161,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
+	destroy_workqueue(ggtt->wq);
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
 }
@@ -242,6 +243,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
+
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
@@ -276,6 +279,68 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+static void ggtt_node_remove(struct xe_ggtt_node *node)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	if (!node || !node->ggtt)
+		return;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		goto free_node;
+
+	if (node->invalidate_on_remove)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+
+free_node:
+	xe_ggtt_node_fini(node);
+}
+
+static void ggtt_node_remove_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_node *node = container_of(work, typeof(*node),
+						 delayed_removal_work);
+	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_node_remove(node);
+	xe_pm_runtime_put(xe);
+}
+
+/**
+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
+ * @node: the &xe_ggtt_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
+void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	node->invalidate_on_remove = invalidate;
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_node_remove(node);
+		xe_pm_runtime_put(xe);
+	} else {
+		queue_work(ggtt->wq, &node->delayed_removal_work);
+	}
+}
+
 /**
  * xe_ggtt_init - Regular non-early GGTT initialization
  * @ggtt: the &xe_ggtt to be initialized
@@ -471,7 +536,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
 	if (!node)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_WORK(&node->delayed_removal_work, ggtt_node_remove_work_func);
 	node->ggtt = ggtt;
+
 	return node;
 }
 
@@ -488,45 +555,6 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node)
 	kfree(node);
 }
 
-/**
- * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
- * @node: the &xe_ggtt_node to be removed
- * @invalidate: if node needs invalidation upon removal
- */
-void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
-{
-	struct xe_ggtt *ggtt = node->ggtt;
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	if (!node || !node->ggtt)
-		return;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
-	drm_mm_remove_node(&node->base);
-	node->base.size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		goto free_node;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-
-free_node:
-	xe_ggtt_node_fini(node);
-}
-
 /**
  * xe_ggtt_node_allocated - Check if node is allocated in GGTT
  * @node: the &xe_ggtt_node to be inspected
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 0e8822ae13fc..cb02b7994a9a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -47,6 +47,8 @@ struct xe_ggtt {
 	struct drm_mm mm;
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
+	/** @wq: Dedicated unordered work queue to process node removals */
+	struct workqueue_struct *wq;
 };
 
 /**
@@ -61,6 +63,10 @@ struct xe_ggtt_node {
 	struct xe_ggtt *ggtt;
 	/** @base: A drm_mm_node */
 	struct drm_mm_node base;
+	/** @delayed_removal_work: The work struct for the delayed removal */
+	struct work_struct delayed_removal_work;
+	/** @invalidate_on_remove: If it needs invalidation upon removal */
+	bool invalidate_on_remove;
 };
 
 /**
-- 
2.46.0

