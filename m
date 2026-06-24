Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4ADCDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 09:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F193510EE52;
	Wed, 24 Jun 2026 09:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlQ+Ic38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D7110EE52
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782295015; x=1813831015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=t/0uhu6Bu9oE6k89gDOdlb4Ak1rlNdw+UCQIg/LkLc8=;
 b=GlQ+Ic383N6Ik/CCAgGh+/AumzjYY4wi4Pknb7Rkhy58edtFrPwSMR1J
 Ja3zQz/mXmnHXJAvIbkqbL1K+4H78gZRyaqg1Z//6J0+Z0eZT7qZakSdJ
 ZmH3qeUB3Gb10DeC2lL0DTRDC5qXc9r0cKct0Ptc5LHjg7aAzHYhMv7G3
 mwDmQIfG1KBhaw0kzEROOilAq4RR4OWpInYcwU4Q+FkPA83CQUBQBebp4
 Ya3jIP0qgpvW9KjIscHaua4fHgtDZyx5dz93b3+Iip6Zo2wpRBEEBcF6K
 J7W84Nya2QRKHjKMEHjk4LRwGYjj8OAW/oOe/O5oKtxU29C/U220AZaDN Q==;
X-CSE-ConnectionGUID: i4K37dmjTcWJN6E6htOtrQ==
X-CSE-MsgGUID: iPI7VssoTgWwSGHmpZPfIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83147958"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83147958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 02:56:55 -0700
X-CSE-ConnectionGUID: OqqU1eEfT66qZ4ooagy2oQ==
X-CSE-MsgGUID: cxb3DC9DRj6r7jW1AG4mnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="245668504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 02:56:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 02:56:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 02:56:51 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 02:56:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIFmvx289S+o/aHzMgvDDeTiI9F5AJWNjDi6KCxoHyX5I74eD+IQL9e0ue/CoZJyQbng1aNgeGCwCB3njwA7ADySNB+7jWIEhLLphMI80Ejxf96Y+Ea/J9CksZsHiaOihpO/USTwgSmf9b70VX+9Mp9sSQ2GzqSXiBWYbHEtG/yl3Q6Vst7uf+V3M6eUZayCKcGX8JWFW++J6jYWryFa5BtXKS8J5/bZVB0TQ+9hrqDTjmys3iAPIfd+N2A02//dZ4nxp2oFS4l2qGJMfgQ2JotjUKwybaHzvF6tjae5JREt+JRRzDopiC/Hw3Si/HqxA4KoUKrnwI5Hs/JxiewhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hibRKsDtMDIz3i2fj9UzInZu9ZIOW5GqupkhVVd+ZxU=;
 b=Bmo48ADmye9sJnRJCZYB3qQdcmJCBHqOiHUBz9qm5/l6/8QK+Hm5w1zBnLH7fsmXiDF3+IP7zp+JMsIg1Avfgq0qeJqETkR0dcktjZJve0MR7Nzu7g+z5EQSiYEHIzPcYDlbNUN4SnLMSUDQXCXjLw9BjRyYPq5kCfO+ci4+Gft5ax3Y2p7+gxSHjs4oPHGuQUOSCXJoaygdIFxXFc/zpEg3zqST/JCUmj25bzMBzsHMUQAhn6Gz/zgrrJvtVSXGOcmhBjlQxmNnVvLPA3KGFM6G9T8IRY8bKsmE9J/TVTHfdt0I8cZTyUfFWf6ihmwU37sMrXpyqeVymqzeIenV2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:56:49 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0159.015; Wed, 24 Jun 2026
 09:56:49 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH 3/3] drm/xe/pf: Add the definition of VF resfix abort event
Date: Wed, 24 Jun 2026 11:56:34 +0200
Message-ID: <20260624095634.1250956-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624095634.1250956-1-michal.winiarski@intel.com>
References: <20260624095634.1250956-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::6) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb0c317-6ea8-4cc4-103a-08ded1d6e8b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: IMSwPGs43CIRVUK4GwvNXNzA34e84OzjgVFWXNEhQAxDQCrODK5k+kwjP4JPMUCYJdsYxboM1rWNLkWsEeYR56WAviZ5MKjGa8nfcYuy1SJpQEMnlVKQxhQ8jo3QP4b6RusPM3i3hC1uPoBaKfItrQ6B8mh8JlM4QdojpBnCTANICrUnUBthbDniDhD4K8A/5yP5nNVGkuFSpESwQ5V3a/dMIrZ2SJ+9/+Ar/Wrm+W2KR9y0jVyTqTXD4b5Oz0P/oQAhKDQe64KA4Kl/fRmPQrCy61UcMVAMPU0+GSHcfZn7D1Qs9tw3OzCcg7SaPaBAZ4GemCB2AJjaMUakKRBepZNK2btaGhDIE0u1FIuPVUc9PQ6eWeugdDE9jh/vaPkrnUswGiWKPh84SekBiFlJynHvqDBBuH3xWgxwSSASv/dJD9DCAQIMofhA5K/L6cSDpLF6JI1oMr/wX5UtVrNot3w3MPguWCxa70e8D4aRGVSoAcns7DnXHaGNiLtbognJHhn/7DaWxuocuuGfUoAmCGMNrS3TDwNrOu8m6UthvBG9LVy3OsYve+UlHFoXpvoFZAf6smFKx5Q28Cjy9pTWsVU07fJrq4jwZ92jZJXxy5nauamFKXa9dhY6uWCW/8fpASmr712hTQDfGj2fkz/dVHapsHBGjXluSXFTAZPjPZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXZqMUlDWXgwY2hPZFA0Y0VhRnNnUTV3WXFEMGdrSHJLbHZLTkk3WHA3TlN6?=
 =?utf-8?B?OEU1dWU0bDlGbzZYRzdWbFlrT1NNS1BOVEwxZVFzUWxTcDZVUDBOM1YwSjA3?=
 =?utf-8?B?NFI0dUo5NXViY2t3T25CTDFXcER2aDk5Yy81ZXlYL2Z5YmlaaEFQS3pHcUZ2?=
 =?utf-8?B?b1JzRytTZ0U4amlIT250SHQxUHUzT0RvY3VMWkVLUUdON1FZMkRyTElKc29E?=
 =?utf-8?B?SWFVL3hKS3krK1d1TlE4T3R2VHhRTHNSUW1HM2h6bHlkZGd4UVd6bmQ2QU44?=
 =?utf-8?B?a1BvMEFQUDU3eklNWDR0TTE2cWxFOGNiMjZyM3VFYlo1MEQ5VDFiSGNiY0FN?=
 =?utf-8?B?MDZSWWxHUDUzN00wVDNqa1ppQXNJdmdZeE1GS24vY1h4UDhZT1R1aGx4Szhy?=
 =?utf-8?B?NDE0eEZNUC94ajd6S1ZNRDRwc1NSeG5oeVdJaDFNelJBcFRabWFreDZlY0Nw?=
 =?utf-8?B?R3NDbXlSWW1hVUxuc3YwRmsvZkc1Ym9QTVJlNWhwVWdDKzZnU3Z1QXMva0kz?=
 =?utf-8?B?SlR5bElaaWVXSnYwZXdaQlYyMW5SQ25rWTkzekNqOWV2R2tycGZGd2V6T1BK?=
 =?utf-8?B?ZWZwUTZQeUJhbjM2YzFJanNraVA2Z2twRE5mVjJ2bFV5NU54LzdsMThpNUNp?=
 =?utf-8?B?MjlmVkx1cFhpRE5Tam1QTzkwcDkzc1g4NWtuTHlraDNVb3MxNmFLUkFWY0Zy?=
 =?utf-8?B?R2w1dXppRHBrZHc1UGI4dXpaQ0MvVXFVRVVJWXYwYmo3NW43ZlZEdkYwTWVR?=
 =?utf-8?B?SzBDbG16cjN1TUgyL1EwYTZTRmRKYjZZdkR3cE5xMHU4RUNkYXRGQmx0MUds?=
 =?utf-8?B?S3RPVUhlK1dqc3lkUXBtSHJ2ai9oT2VRSFM2ZUM5YS9DOC9CN1R5MDZ3S3ZR?=
 =?utf-8?B?NXBaWWtqb09oeC9qRTg2aThXVE5iMWNxZkpRR2FvdHVwdmg1elFEeURHbTB0?=
 =?utf-8?B?LzBwNEVZZlpaUEVBRWN4RVFkRjlValZTVzdIUktuWDhnbWJZRlhBelEycHVt?=
 =?utf-8?B?c3puc1ZydVJCNE14ZFVQczNwUEQ5Z0VIRFQxdXZNU1hNOURTRXlWNURFejVl?=
 =?utf-8?B?ODdTYmtSNGluMkk1OFlibFhlMGJpU2E3R1NsS1RPSWFkME94L0pvVXJIMXBQ?=
 =?utf-8?B?R3RaZUlVQlBzTUxhai9jTXZUNTJVZlV3TXFBODMrbjdQa3dLNWZENVE2NnNx?=
 =?utf-8?B?VCt4Smp4UnArZFVrV0pQZWdOTmhlemd4VDE5QVRROFMybUk5RlBTQzBNdXFE?=
 =?utf-8?B?aDdob3lFeU11NjhjU1NPZ2xOZjB2ZmlFeWxIM3NXejZjOVRhR25UMjh0dlNE?=
 =?utf-8?B?ZVNueENpWElTZU5qSXRNSnFUYytNMndyY1JJZDJKcTJwN1U5UFVPTXpWMWZi?=
 =?utf-8?B?ak9idWE5K3E5dXRPSkhkbE1LZ2MrcEtoREY2aXdoeW81QWY4ZnRlczBFRkRk?=
 =?utf-8?B?UVQwK2pSL0Z0L1hMMjI1OXlFTlFSZ3QxNTFya0kwWmQyNkgxUmI3dHcxQkt6?=
 =?utf-8?B?MFVKRVFwY0JnV2VZMG12TnFIcndFMWs0cFVtZ0RlQk5VQzJHenFkbVRQdk5X?=
 =?utf-8?B?MCt6YVh3LzUrb21USUxOVDUwMndwN0MrK0IyRVU1L1lhTmc0ZWlPN3I0NHlF?=
 =?utf-8?B?SDBRMDBrVEovZWVKcnhzb2JONVMyVCtuaGRPc3RTNzhmQ2d6UjQxVkJIZ1hK?=
 =?utf-8?B?UTRhQVllQVVsWFBwcTZpSHVGR0VrYm5FSklVNVhwM1R6c2w0ZEhVWDhabkhK?=
 =?utf-8?B?VTJQYkdVM25Kd0pad3hXZ3JIQXZ3cmttc3pOTWp2UkIxUytQUXpkMHg1MjlV?=
 =?utf-8?B?Nmg1MUhqRkh0SW84cktkMUtBSjZ3em1XNEhQcDZtYUlPVG05RUF1M0p6bGtC?=
 =?utf-8?B?R3VvR2JHSVVBZHRrNGZzZVRXUnRldDFqWDkvemRkc0VLSkpoYUxsdHNaK2Rn?=
 =?utf-8?B?eUNhT1k0UlFGRCtiUW9qM3VDZEpwZGp4U0k1NXErU3FydWIrd3ZaWVdFZVg2?=
 =?utf-8?B?Y1dXWEJiM3dhTzAxTk8wMTNVdStZZXR1WVU1endISzhwendnSEN0NWdqNERQ?=
 =?utf-8?B?dU5CdDc1WWRTekZnMXdaS3hKOGxLaFVLZDN6TTluWlRHaFdoOWNSSHJSQWY5?=
 =?utf-8?B?WDNtN2kwKzNOR0VpN0pIVEZsMUEySHJmd01vN1Raay96bjNvNy9xQmpKN1dF?=
 =?utf-8?B?NWhmU1pzYUxWMU8wdzlyMWtVUkhBd0Q3MVdSK0NVZ3VOamx2V1VIT3N5S3Vv?=
 =?utf-8?B?Vit3QWc3L1dYbmdMTEhjbGE2WkFJVktQdlYzTnlBN1h0WHBpZHlhaXNLUitx?=
 =?utf-8?B?RGZFN3BPeUFPb0tuTDc5cW45dWNyOENqK2d6eGN0d2l4RzlvYnd3L29KdmJI?=
 =?utf-8?Q?VOpoxilXxDvlgesk=3D?=
X-Exchange-RoutingPolicyChecked: lESSJtSYRIDOs3jVFpvKwob3NFk1mWTa1tjUECDmQCx5YoKyxjCQBKkW7HQe8l27UY5GSwfkvRCooPEwm1cdPiLvj0xIZ98BLcHHWgig2GECuaJbLqDfwAwsQlAb0tf/72RmvmlymgcT9dzmTllMKOySOCe8xdUvNQ5XO7jFUTFrHYx8nASN9xd9bAzQeAbPSIsYK7QOsp4x16LVRZuT5qn5SCm7caSzm6nTkZzaS2Zj2eqUncm8lRx8tqTbriihah8GacXnqD36BjD854GOMDnkwx3ooreMdcOWthvLqMa0sxzJpvSJRpg2GbVaAO35hzEuKZeNknGSWNVf/lD23A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb0c317-6ea8-4cc4-103a-08ded1d6e8b2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:56:49.2833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3cXkUTYJ2O1K1JuE5nqYuSM4ev7Bi1AxarpnahkHc93fIOK1l/GAwRoLKDY1VyzqyxYHL/UkvwK+VhMqfpmlT4i5Y09xDe0D0NflI5elCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
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

The VF RESFIX_ABORT event is similar to FIXUP_DONE event, in that
there's no handling required from PF perspective.
Add the definition to avoid the "unrecognized event" message.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h | 2 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 8665b8c5b7336..59c52b7c21ab6 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -230,6 +230,7 @@
  *  |   |       |   - _`GUC_PF_NOTIFY_VF_PAUSE_DONE` = 3                       |
  *  |   |       |   - _`GUC_PF_NOTIFY_VF_FIXUP_DONE` = 4                       |
  *  |   |       |   - _`GUC_PF_NOTIFY_VF_PAUSE_ABORTED` = 5                    |
+ *  |   |       |   - _`GUC_PF_NOTIFY_VF_RESFIX_ABORTED` = 6                   |
  *  +---+-------+--------------------------------------------------------------+
  */
 #define GUC_ACTION_GUC2PF_VF_STATE_NOTIFY		0x5106u
@@ -244,6 +245,7 @@
 #define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
 #define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
 #define   GUC_PF_NOTIFY_VF_PAUSE_ABORTED		5u
+#define   GUC_PF_NOTIFY_VF_RESFIX_ABORTED		6u
 
 /**
  * DOC: VF2GUC_MATCH_VERSION
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 82957c596b683..2762fff78f113 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -1986,6 +1986,8 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
 	case GUC_PF_NOTIFY_VF_PAUSE_ABORTED:
 		pf_handle_vf_pause_aborted(gt, vfid);
 		break;
+	case GUC_PF_NOTIFY_VF_RESFIX_ABORTED:
+		break;
 	default:
 		xe_gt_sriov_notice(gt, "unrecognized VF%u event %#x\n", vfid, eventid);
 	}
-- 
2.54.0

