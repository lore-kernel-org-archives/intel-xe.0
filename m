Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FECBC8303F
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 08:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE1610E31E;
	Wed,  2 Jul 2025 08:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApL83zU/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C0810E31D
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751445946; x=1782981946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9643ykSLGE12Zf1/GT+f+aS1lVusz2BR0SlP59MpPLc=;
 b=ApL83zU/ToOkxAKNn1lTaiQ0kkT3V5DQTIfA9Agm3hhlHchKSbk2Uvdf
 wYJhvJxtAUGEKYRggoqH0NqGQYZTm4FGLEV5mwFCFOpZS3BHH9XV+ieka
 wmixGp74jF4Cg6UqHgE9CVUCVJ4RmLd4NyK1bVIGh9HcEiwcugNxaBzUo
 hzlCsncl2NcmTeVY8dCEhtUneqgyO3zdICocs5E4mSiWnJIwJoUrM5rd7
 hl2wp3kbDVUEoT1FpXzaty1qhyAMZk01vbB0fr5TmT1htzg9bjPDDbaGL
 +Qrr9jyKpsUdFwLZPjqan9h10Ch+UyHBMp9WeVr1n816oF4nFVn4jqodk w==;
X-CSE-ConnectionGUID: RG96u47RTEeGtjMQrSyIDw==
X-CSE-MsgGUID: FBDPRdtdQ+SdPgRHvAuHiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57407949"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="57407949"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:45:45 -0700
X-CSE-ConnectionGUID: 9niZrSmDRom0aSACgu7ieQ==
X-CSE-MsgGUID: syGKXsfKSTeA63iLLkYeKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="154745971"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:45:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:45:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 01:45:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:45:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDqLhk4ii3DdeJi60ZBT/DagiPywNKZO4EwE7Cv6CO/+b84TsZx1+Ez/F3auceeoBftVN3ScG+RvcKAw3pjG24D/Jroif4dfb8Q4mZ1ANSBVk8zP+YPi/N/Dh3qR/TCOHl74jiX+u35c9ZfOUllzW6YAddrQZNr7FLWiNFNq/bOme6SJXwSnl3RKYXMbhqLZB7tX5J0s9aXuR4kP4eRmtQotBK8SWu/5FZU3oyhYZNIamPj5QpoaiWmdqLURFGH5EAYvYMJoB25GQqOS4WecVythvh0aZHuIhnXZ9lF4mShnvrd83wwTFZLQqsZsNbFDvgiXqh4ss+MkIgPMxDx/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H72x7or7vJTGrlet3k1tqZVlMUQH4pDLakagby1jQV4=;
 b=miGH3b4EuHwLJSv+Pcmv5H5V9Ux2ZsfK7MR0FyaGIHH9YtkwoI9ZXIhkVB0eLDmMtd9xJnIMAvmZ/rRNeMzVMCRYgOq+2JO3NsDmjvS2nhCzEuWzzFQO2oYH4tMfPTc/EOZftbtD+h6eyd2aYOoIXWN729mOC0EOuvutghlSMW5RCRchuvwbKt3O6tvmUCAG5mwipK88ZQCloARDdzghkntUALF+mQtkAvAoKXXYikPd2TzxMt8f8efSpN/78Aqb8n6l73n5quCq8G3FAezqWHPKS9Gh9dBrnehaOuAoAOfje2i7RNCo9+7IdbKTeLGF/p/Y5cuVXiQQcL0pdtjVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 08:45:02 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 2 Jul 2025
 08:45:02 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v8 1/4] drm/xe: Use devm_ioremap_wc for VRAM mapping and drop
 manual unmap
Date: Wed, 2 Jul 2025 10:44:21 +0200
Message-ID: <20250702084424.3609863-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
References: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: bf35e4dc-c7d3-4ffb-c8fd-08ddb944bc2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFd1UUxDdGZZcXpwRFprOG9OYWVsRDE5eWVQSi9OWmdEUmxOcEhLVFpPRm1X?=
 =?utf-8?B?a1BuUnNWWHJndkpOcnJsbGwzeFlrS040b2crVFZLb2p0OHpTOWo0NXhxQzJB?=
 =?utf-8?B?c2J0QlAzS0o4WGkvTUZ3dDJ5d1BnZE9iaDh6Z2Q4UjNlakNUV1NYMGNyWDBi?=
 =?utf-8?B?eGpvUHV5TzVSQ1JoaUlGM3g2MzZycVhrTTFiWU1RM3FkV1Z5Y1U1QllYMjgy?=
 =?utf-8?B?MnRETXpRcHBhb2R5c0RabHA1cFVYU3N3K01aSmtkbEZyVlVSYUY4dWFsUnlZ?=
 =?utf-8?B?TkF4MWpMQ2xkU2t0Z0t3NlJ5aGRsQUQ2RE5Fc2cxR0w2N2FKSTgvbWhTNXRx?=
 =?utf-8?B?bUM3ZVBiTFl6c0FQNks3NzJsbWZHTDNMZ3FYU21NemN1SlQ5ZDQrMVZmbVVO?=
 =?utf-8?B?eHJQN0NrdVF5VmpiYzFYVk93LzZXc1Yvb3Ntd2p6cnFFTUM2Rnd1WmY3WEwx?=
 =?utf-8?B?RDRrOWNidUpJaHZ4bHViVit1U3p4QnpVclJsM3NSbWQzZmE1VXh1TFVKR1Rk?=
 =?utf-8?B?MGpQWm53V25sRTZvalhGbHBYT0NkNlRiVXd3elNMMjRST2tmdStxTGk1dWwr?=
 =?utf-8?B?V2RWd2pyWFdkWWRGd0xBMFlXekl6VnFqZUhUN2NIYXRud3lIQkk1cGcyc3Jh?=
 =?utf-8?B?NkVQRXNZekRaQ3B3L1FyWmh1eHJ3NGd0ZE9xRlJPTXc0WS9uQWNTUkZ1czBN?=
 =?utf-8?B?dkZtZXdWY2tlbVl1WjRHem5GUnQ0NlMxdFVSSU5pek1iOEdGNXZVdlN1bHI5?=
 =?utf-8?B?b3FvS2VTWVZDRmo0YXBKY1VZSHZ5TGxieTBVWDVhRjFCN1A0WXdlM29tbVJq?=
 =?utf-8?B?NGdrNkluVTJ5Y0E3TDFxTGtUMWlXUUxsSTR5SGh5NS8zWFY0Rmw4dkJobHQ2?=
 =?utf-8?B?cmptdDIrTkZGaVQyT0srTTJyS3BxeTM2cUtwcUNBTjhTcVppa2UwQUh2TGxF?=
 =?utf-8?B?RlZxNnZoNXQ5WUZkdjVqeWNiWEhnTitRdk1ua1ZvNXpRK2dBSHpMWWRIa1lj?=
 =?utf-8?B?ZG9OYU9MZ292a2YyempycWovYmlLanpaZ0ErZHFUU0hRTk53LzRscFY1RlB5?=
 =?utf-8?B?c21tTmV5YzNBVXl0ck1DdkxvRk93bDYwOU9RS3NPOVdhWE4xQm1vR29hRW5C?=
 =?utf-8?B?aTBrd1JZZFFnWFhNc1pkOFJvZG9YRGN3N3NsWjdsaGd2eE0xWGFvNEg1cHBT?=
 =?utf-8?B?UjRrMDBGaXZtcjJuWTJPZUFkOHhBQjQxVW51MkFGdUZpNUVwdi9HRnBSMzNk?=
 =?utf-8?B?NHZvTXBRck1IUE9RY0VENDNUM0JxblYrMlA4Mk40QVZ5dTJ4aDc5SGpMT1Bo?=
 =?utf-8?B?QVVyTjBTY2hRaExwL1BWd2w1M0hGK0Z0ZnFTako0aGNreks5QWNUMTJtejla?=
 =?utf-8?B?UDQrai8zUERBTDJoVUJlOHc3Z1I0VVpGdTYxakVYY0ZaaFduSjZENTZ1UHpm?=
 =?utf-8?B?Yzlsa1RNSTdsb2ZXUXBkRVVNMnJielFiUnBpU0FuVkptcVpCUUl0NUVaZDR2?=
 =?utf-8?B?N0dFVWZXdU5RUmMrV2hHdGhtZ3g0bDZ6M1pDcXdJS3JFN0ZyNlhpazVrZ3kx?=
 =?utf-8?B?S1RWWmtyek1FVi9JcHR0YkV5L3BLUWdrYjBTZmJXRko3UUpkcU9FdGJNQU84?=
 =?utf-8?B?QVcxc0IwZG9rWnBaN1JpcVVtbkR0TzJNQjVHOTIwNE5zNkNPaXU4R1ZHeWRU?=
 =?utf-8?B?RElRUFNyOURwVUxWWm1iNjlHQ0duR05vcDRjR3FZa0ExSS9sNEkyQklLZXRx?=
 =?utf-8?B?ZG1aZzV4MzZvanAvSndmNHp1eUFONDNYelpGbGJ2NitJQTRHQnlYRnhaSGVL?=
 =?utf-8?B?dk9xQWxwMGZtOGc5ZEZiZktiV0FoSmVwbW1YUVZadDRmTUpHZ24zemZtWXdX?=
 =?utf-8?B?aDhLdzZMSzU1SG9GZnhkYkdta1FRMGNIcTJSZ29hbVQ1Y09tVCtpdjR6R2o1?=
 =?utf-8?Q?lXv+M9PKyGs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlpodWhjOWVpMTIrMndHTlE5WTdjZkx0d2dyWXRLK3B5U2JISWhvK0Vmck1J?=
 =?utf-8?B?QS9hWmNicUkwY2NTYUtWNTd4WTUrVVBGTmhNWVUzdjVXZVA5Zmk0QythdUI3?=
 =?utf-8?B?MWw3aEpNYUdOSm9TTHkwZlFBOTBwTHpuVGJxVWRiTXZRbWtJNndjUzhBWnls?=
 =?utf-8?B?UjltbzFaeDBxT1FiTEgyS3E5TVRSYjlIWWsvdjh1M0F3Nzh0TnpiRUlNRFpR?=
 =?utf-8?B?Mk9uaFBlcjNKQk5WVWNxeVdHQWY1QjhGME1oOG1tNEVXVDRrL2xqU1E0M0I0?=
 =?utf-8?B?TFA4elZNTkNGM3dVeWNKMm9XYkJPTDBLRUY4bjVuSHlwL3lUTTZ2L0EyQTJ4?=
 =?utf-8?B?NklOWTh2MHo5blg3Y1Z4YkhLNU1RZ2o3OTlQZm5VSGVWMmdyM0pYUXo5djRG?=
 =?utf-8?B?dUxXTXRxUEVIVXVUNncxUDlaNGVsVGplbEtaZGZXemVLREVBZGFXcG5RYitu?=
 =?utf-8?B?QWZGbGFKWmdBdThTZHVWaE1hUlQ1RkJYNlVEUkhJOTdhRXR6NU54K0FKNFVP?=
 =?utf-8?B?TGhpNVdjYjdRaGtGVS9jNWE1bUNpWGNCd1BkVUtLcHpQUzhIYzA5QmY2RVI4?=
 =?utf-8?B?cmErNks2VmxnTlFTQ2NTdGJlcjJJamdPU2tMUTM3cHQ2QUJGNU05L0RoczR0?=
 =?utf-8?B?d0dpRFNJTm83bHpiTkZ6dlhoTXFsMXExUTZWT21wazZEVVdtTm5YTFhsOHVQ?=
 =?utf-8?B?U21FTHJ3U0JQMXp2REd5aE5jM09JN2JiUnUrako1dURSbTVlWGhPR09NMm9i?=
 =?utf-8?B?Wno2TkZiQURPM2o5UGFpRzVTdFJZSG9pakZ3T1ZFSVFZWTVsVTlpQnFCZjRy?=
 =?utf-8?B?bnRkeHFKNzRLY1c4L1Fnb296dFg1bDJ5WU56WlVJZXQvWTl6aG1DVlFncWI4?=
 =?utf-8?B?VW8yU0RzMnVnSUJUazJuVUd3VDE2eE1GbFV3YzNkNzN1TXU1MExNMVZ5T0R1?=
 =?utf-8?B?Zy9TYXdrbzNnemxDVVYzZ3FISlpYa0lwSFFlVTFpdXJnTlZQVmtac0ZpYUc3?=
 =?utf-8?B?U1VXMWZWNmNEdE1HNkV1eGxvalVUSVJ4Q3hTVlhjUGRkSk9IZmw1anhsOXJl?=
 =?utf-8?B?aWlYcGFQeG1lWm9hTWVIaFExQm5LRUx5ZEZqYTFyWkpTbnRBTnJsRmJIV0Vm?=
 =?utf-8?B?cjNUdCt5Q0NLSnRqTDBCdEdXVkxoYjhpaTRhdkFRVVFmTjR1VmxqMnVYeWhp?=
 =?utf-8?B?V0FEaHh6emZ3eDFwZzNBeGNFM3QrTTZRQjJKRERBb0ErSmR3MUZ4YVNPTEtT?=
 =?utf-8?B?c1pPeUl2cEdsa3NCNWR0aWw2ZUJienhPT2U3elpyU0VZamwzczN0NVR1cGUv?=
 =?utf-8?B?OXp6V21xTVY1Ukpxc2VYRlU5NjRadlpDMmw3UU5DT3BwdXJhQWJJYi90dkVE?=
 =?utf-8?B?dGk1QVErNXlQZFBGYUFqSmd0MURraFhWb1BZd04zZTdxSDhNNHZwNG9DeTFo?=
 =?utf-8?B?QXY2SzFJaDBmV0ZuRXpwUnpMSURaVHZnSERkZ3JMQ2RwUVV0TXMvMDg1aW5r?=
 =?utf-8?B?MEl5c2ZLMjVwelZtUGhxRVdYY0I0ZE5KWGlZbWliVlRmemFlWUkyZmVJUElR?=
 =?utf-8?B?NmRRdzFhMGgwOFMxMHdvMWlaVlpEQzhwekZtMVJjcjJtOEZYZ3BUZzM4M2pS?=
 =?utf-8?B?eGhXNFYvbXA5bC9aalFWZllYODVHeGF1MmJGSms4TlJ2cjVSOTFZK2pBZlhH?=
 =?utf-8?B?ck5ENkg5SUJHMGNzZ3haendVUVpJcTZxbHg5MWhOYVpEZWYyVUpwWHp6TTRM?=
 =?utf-8?B?L0Z1cTRrSDNNNDFPcXpKYXVxUE1PYjVaNnFub0xQaXBkbjkxY1FIU0IxR04w?=
 =?utf-8?B?N3hiSjZidFUwenlYTFh1ZHYrWmN6Zk5NR2FnNG9wTWVzZWFZS2xoVWtFb0xa?=
 =?utf-8?B?cjhMRzJLdVZnVTRGS3h4Yi9yUmpmeVl2U2d2TEttdjJKZ1VBRXhCVVhOM1lJ?=
 =?utf-8?B?Zk1keEtoakNhblI4WUxLdCs5VFpvZzdiMUw3QlVYdkVEOFZvQmg4bWxyRkNm?=
 =?utf-8?B?Qmt5enhVTXNQbWZzdHE3VXVzbjQxcUdNbHUzenFBN1U4SDA2aVd6end2UWkx?=
 =?utf-8?B?MG8yQ1lSTFZmMWtWQ1hJUUJiNXIyMVNsQWRwZWNQTERYVldHOGN5TFc0Wkk5?=
 =?utf-8?B?anYvWWMrRlRsT3dEaWlnREdSdVV3d2tSbXg2REI0RmFaUlNwcjhyT014TjI0?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf35e4dc-c7d3-4ffb-c8fd-08ddb944bc2a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:45:02.3306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swXR0oH1pjLmJXCAsQS5ue2w9u/4Mck5jwC1tAeYe08DbrBeYUMkbntHR4CeKLcgydSVISO+HTQzHs6ec0KtSF6cM+POHQDqq9FmGhHZsLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's replace the manual call to ioremap_wc function with devm_ioremap_wc
function, ensuring that VRAM mappings are automatically released when
the driver is detached.
Since devm_ioremap_wc registers the mapping with the device's managed
resources, the explicit iounmap call in vram_fini is no longer needed,
so let's remove it.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e421a74fb87c..3a4c84e9efc6 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -156,7 +156,8 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 	xe->mem.vram.dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
+					       xe->mem.vram.io_size);
 
 	return 0;
 }
@@ -278,9 +279,6 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
-
 	xe->mem.vram.mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-- 
2.34.1

