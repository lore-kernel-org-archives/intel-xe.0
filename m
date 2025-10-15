Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66A8CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 19:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6299E10E8D2;
	Wed, 15 Oct 2025 19:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+nSccxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA4B10E8D2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 19:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760557541; x=1792093541;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qbGrPcnpEFXE6WF5HGi2H1rNHiXFW/w8/5XFJ1oofGY=;
 b=f+nSccxbsBVwi0o1Cj96GzVZcRFxFHhmlVCneoF9gpW25ACJj/cUMl3j
 /lRPskRanLl6awPYCnIUc+XJPXVZrrLBLz09mVxW+CuVSLuPODdWWciGY
 DcvNwzF30OGlHUVlAKGVmNEmHkavNe8qfbKhS3/MmJXbujoD/b8dgOYeh
 4nVI7l/3FHKnO9WSUmjZG0OPEDkHuStjjpxpaGj/+n5yzSeol2BYZ/ZKD
 ECxca68x0NOqN2jNYBhWfSuvo3JKmvYhrayH3VPbguADZbsAzTk71kFUK
 tzjErp/eEFe8CCQh9whGQwmW/r99niA1wcIVvjDw8wN+CP4AO3MbfsB9x Q==;
X-CSE-ConnectionGUID: bvOWsi+QQTOcKmkjedwD7A==
X-CSE-MsgGUID: 38TLVz7YS/W5YKLq/x/QjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="61773754"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="61773754"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 12:45:40 -0700
X-CSE-ConnectionGUID: oJm7pe3IR+KEwAMzZC6CLA==
X-CSE-MsgGUID: gO+IMzZST1aClNvUo+gS8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="187352843"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 12:45:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 12:45:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 12:45:39 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 12:45:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6P4LkV3K5JDJUoICooryGyfnmcgc/TNVc9Zqy8C2b5DlM3lUhUi7g1JPR1//nrW70y3cv4aGggp4CHukfOqfCSNnyudqGDdSEGcl0Q91rD0qKfqBQlzazPuk27XE6FMog09wEP1BWx2yOD7ZyDylsnTdeW2WAfj2kjC8Mx+dUvm1m8Aue49aDziE6mA5P/GAeeLFNn7qlELi+XeVz+x5Ji6QEVvZ15J4DL97Iha17wyOFynd9c9r8mGNahxrtLllWFgq0khlh7uISBuAVAHVNPQy3/I2kcKEnkhCIJQEhmOiXZE07++GxuG4RkHptOOVWto8I6G1Xp7+VU8yOa+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbGrPcnpEFXE6WF5HGi2H1rNHiXFW/w8/5XFJ1oofGY=;
 b=Yi1pJ/c4XyLvmCxzZ+n4L4Ik5rYj3O26zzgXowVVx6rvh1RZ3YtAcWCYmnR5sFOtv/e35F/VZXIa6EiuePvT3+FSHVJlJPvIxDfL3Hu1pEQGWZiaZc1Ph0wTYaszrGLdU0+l0AaVCdZAMPBKswIk/oluWTCyRclkrc5iRhY3pTEa+Jc7M3KXF1j13h7SGMKftq2sZiYuLe99Mv03s4QsjvajduEsfg8HKgi3RwxcJWya5MfIlFDHKbIKgTHXItwPwO7rpEk10LOw9r4/RGyHBEFVnOeSfGqDwBanG+cWhdUb7Y6YFpmUOcMRyWo8E2EOfbzopBDIlZPYad5mSm5ofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 19:45:35 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 19:45:35 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Clean up GuC software state after a wedge
Thread-Topic: [PATCH 6/6] drm/xe: Clean up GuC software state after a wedge
Thread-Index: AQHcPTW52nNpkmZQjEa6el8c+p1XyLTDnh6A
Date: Wed, 15 Oct 2025 19:45:35 +0000
Message-ID: <fa2d3d56688c64f27baadda86bc1aa8be118179b.camel@intel.com>
References: <20251014180927.105077-1-stuart.summers@intel.com>
 <20251014180927.105077-7-stuart.summers@intel.com>
In-Reply-To: <20251014180927.105077-7-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH8PR11MB6706:EE_
x-ms-office365-filtering-correlation-id: aa4f1c3c-59e3-406c-34ec-08de0c236891
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TExsWlJUUTgyUkU2eTJrbzdoZVNWbXVmMGtPZGlkTHF6dW1SN3NoRHF1OElS?=
 =?utf-8?B?YlZKb3lQRVc1M0NmaTdXOFUzTWtHdTUyQXZIaG1sQ1REL3ZTNDl2M2xsNnBZ?=
 =?utf-8?B?dnVzaGgyNUM4WVg4OFlEVUIrL2Yvdkc2SDl0TFJGRTZmc2tZQWZEelpySkNm?=
 =?utf-8?B?SllnWU9TMENvUmlyNW1FajBHbDNMVThvV3Zvak5DWUQvNkJud0F2TjdOMUY1?=
 =?utf-8?B?ZmRQWVVjYW9DRG01NUpPWDRWbldKMG1PaVF3S05JNVZYQlV5MGRsOE15MllG?=
 =?utf-8?B?UDZ0Ty9MdEZqRTR1ek9rZDNZeFdiMEJMSUpraDRxekovTGVjQUpTcm02U0pT?=
 =?utf-8?B?a3lkOSs3UUE3RHI1WlorVHFPRnJDN0dvek82c04rYVVac2ZwZ2czUU8zTGVD?=
 =?utf-8?B?MWxZQk9ERkdmckFsMktLc2NsaGZoRFI0d3c0WE45bnE5bCtsbWYrMytXeURB?=
 =?utf-8?B?dmQvTkhFU0xDRkRUVGlDM0JIdXBUUUVxd2xYeXZZUHNiYkh6OE55VHlaZXgy?=
 =?utf-8?B?alVGSjVtRndPdXlkL0lGNXVnUUJnT2tDRHZNeFpsU3RWeGNrZVZiREFCdzVO?=
 =?utf-8?B?YnpOam43S3pUbWpCTWl1alZMNzZaM0xWQkdydXZYMXZTQjdGWS85dlF4bzdJ?=
 =?utf-8?B?TGdpZm8wT1VqMGVONlM0Z21MeUwyZWMwZEc1d3g3SWRNVjJlUUhaTEhkL2x4?=
 =?utf-8?B?UXRyOG5zbi9ybDlNMVNOK3hNaFROWm5GRmtUbzV1MEVWa05IMS95VWNrSXIr?=
 =?utf-8?B?OWJTeW9PZUY1TmppcWJoMUNGeVJnV3JxUFlTTzNka0krL1lMY3ExY1IxMm9J?=
 =?utf-8?B?TFdiYnZNUDhUNEg1WmdWUWErRkJORGxSbWYwd3JwWTgvR1A0VVZOMWhsTHp0?=
 =?utf-8?B?US83aGlOVmxQUk9XaVV2WW51bmxmYnc2RllhUUhsQkE2akZ6RUJmZ3pIOGgr?=
 =?utf-8?B?ZGZGeFJtdDZQOTR2TSttRDIwcnZsWjVMQXdLbjliUnZ2Mk1hOWdLdHJXRzR4?=
 =?utf-8?B?S3RWRlpjSUhhaHJaWEFzRFNzVDJhcFlDU0F1ZWpqdnMxQVJRRm9WcndzQUNh?=
 =?utf-8?B?L0RoT08ySVVla2traFpYaUNnYWQ5TDVkYzNsRUtDMkszOUh6eTVBdzAwWU04?=
 =?utf-8?B?eUxvZmxoVmVRQWFZTVVsWTVJWnYyQ0MzNCttY0dSZytvSUVFd2pyeHR0Lys2?=
 =?utf-8?B?QTl4MFBLbEtIbmNmMStyNEQ2T2xMTmY0cTJ1NFRHSlg4dzFsQWFWUDJKQWQx?=
 =?utf-8?B?aEpyS3FFOUYwSjh0bHFxN2xKNHJYK3EvbEtQa25yaHd5VzQxYkh3dnZXRjRX?=
 =?utf-8?B?SXdjMGswVk1LUmpIcHErcVUrYlhmVWRvM0ticWFaTVArRG5ud2FSNlhhL0o2?=
 =?utf-8?B?Nk1BRzNpdGdZclF0V0l5bkJiWnozLzhhNC83b25kdlllanNLR3IzM2ZkOGo2?=
 =?utf-8?B?R3Vwd00xQnAxb1V1MERxV0hmdURxbmltY3hqZW95QUNEeTkvbWNsUGgrVHNO?=
 =?utf-8?B?Vy9QTFJQbUdobWYydVpQdmxBMnZSckg5VVZpM0xHcStCaXBGaFlZT0R4dkJ0?=
 =?utf-8?B?eE11a2pWOGFpSGVNdTF0RXROOVhoQUhnNkRQck5LT3d5em5yVVAwS2NtdjV5?=
 =?utf-8?B?aG90c1VQWmdNNFpQTGZKUEN1eUVZdEsxLzcwMjNXeS9MNUZFdE56MllPcy9V?=
 =?utf-8?B?WEs1d2pFNFNNZ3k5V1RkaG9MZXNzbytWcTN0R3dkT2x0Z1JYUHVFdGtnUmpa?=
 =?utf-8?B?OTFXZ3JqZWdUT0R0bFZOa2IrYjg0QlN5YTFTWGJ4S2wrMGlFdWNibXFOL0Nv?=
 =?utf-8?B?WjV5bGRRWDN1YWY4eXowQWhXUGVwZndadTV3VWdyY0NWSHN2Z3pUZmw1clcy?=
 =?utf-8?B?Zk1SUnIzUkU1UWM1bm44ZTlhMjF6UzY0NmcvOE8zSDNuM1lRczlyM09Gckkv?=
 =?utf-8?B?YzFjYythT2ZTK1BwYmVlYUl0eC8xN3JoVnVHcDBERHdKU1k0djFIV093SDFv?=
 =?utf-8?B?RS9RTUhDQy9TTzJ3RkJnMHlQei9pVzZvNmdCLzdYWEx3L3NsZW14aW9JWTYz?=
 =?utf-8?Q?mEcNfX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG43ejRXeW9sSm5QOEg3ZGxwMDdTM3AzSGJqM1ExVUxSNWUvWStydEhDVktL?=
 =?utf-8?B?UFBvR2VCczZSMTFuS0pyYU8zSEhKSWEwU1B4dWdrSHpQOE9IY09JRWN1UzN3?=
 =?utf-8?B?R0tRNHJtZmpxQlI1TldsY2NJUEpudEdWMWdrYXpxTWFyZkJUYlljS3NJak5s?=
 =?utf-8?B?R283T0gzeTA3U1FwVlRIV0ZkRk4wNS96Z3BESnA1T0R6VDgyUmZ5VmR5OTlE?=
 =?utf-8?B?YkorQnhZS2htZ2V3eHNiS3JEVno0VER4cStXVjQ3TS9FZnRKd1VHNUFSdWNh?=
 =?utf-8?B?eEk4NThuN1pPcktQWnRNWTBleWhLSXVaYmgxYnVsbXc5SDVQYTYwZHVKRzY4?=
 =?utf-8?B?REFRankySjRGQ2s0SWhPRlFJQ29ucHpBODRVM3FOd1E5bG1hVnVyYjg3WVow?=
 =?utf-8?B?d1hJSHEvNC80NjJjdTl6K0pRbFZtaEpjeVhVd2hKM0dFZFNvNTJMWGhJemdz?=
 =?utf-8?B?K3FCWG9UUXR5ejZPUjFNUkdoSE50L2lUeG9VVGdFUm94YXdSd3N6Z2dGVmZk?=
 =?utf-8?B?aG5tcm41TWhzQnlnUXRYSzY4cDhDQzFJWXQ2RDRtcWFDNFREZDI3aGhORXMy?=
 =?utf-8?B?Zk92WDRuTEZ3RmJzdm5xV0ZoVWo5UGs5OFVYNEJSRTROVXZwNnlYQ1ExRS9x?=
 =?utf-8?B?emMyVENlUnFteFZoR3NKUEFaZmY3UUlxOGI1TTZESkJLYXJCM2pJcm9OMUYy?=
 =?utf-8?B?MXNVVGwwSlBrZC9pbDdZMHpzZjdPNFAyQ3ZQS2p2ZmticytReTVQVTB2ZEtz?=
 =?utf-8?B?VUpEVTNESlZpbEhLNmlwTkNCRUloVmFwbm1GTmVDSDZzSkc1UDlYQXJhcDFV?=
 =?utf-8?B?RWh2R0pnZllTdUZVSTlleURkUVZnWVlJV2NoSCtRZFdMWjRvemFWVTFmN3dU?=
 =?utf-8?B?dy9mRTh5NTBUbk93OWpZWFFUVWxCbHFWRUYvaDA2WXZVQnRVb0FsMEtKV21p?=
 =?utf-8?B?NmRvTEdoZUFmdkZ6TFg1YlBuTVo5RlJPUndNcjh5Mm9WbHM4OW1PeXdlWXJx?=
 =?utf-8?B?ZkN2VUQ1KzBGUnJ5QkJSTlhJanVybW9KclA5bC83R291aGRRL0RUSVAwRS8z?=
 =?utf-8?B?b1o1aDZJRkpYUVZlUjkzTFVkZDRZOFhEOEhRRlFjN2JrdVVtWjR5M21CTTQr?=
 =?utf-8?B?VmNUOG1XR1UyVG5OVStLVU0rNDFkUkFOL3M5S2VsQk5ORGYwKzhCWHV0VzJx?=
 =?utf-8?B?UFNkZ1kyMldBSzJ5WVRRZVZYZXI5V0RWdXViL1J0SkR6bjhxa0Z2RTAwT2R6?=
 =?utf-8?B?bnRhSkUxQkdHNFlhQmYxOU1hSGR1aktlTlhreHNWMHRIUUNuRWFOWmJxSWpk?=
 =?utf-8?B?Ym5POVI3dXpya2pIaURkdG1JcGc1TjNIdFZyTHcyaHIwdCtwSTIxRzhYQ0c2?=
 =?utf-8?B?ckFZMUlHb2dzSE54aXc1WmVScUI5SW5YS1pKaXkyMHRBM0d0MktkRUNxSG41?=
 =?utf-8?B?VHZPME1ObVg1SVAvektpTldaTWNZVXBBNTlRUlNXcVpDTG13alRSWG5xVTV4?=
 =?utf-8?B?MCt4eVBEVzYvZFJlRmN4Ykc3YXU4WHZYaHF0a01WVGhFaWRjNDBHcHUrRUdB?=
 =?utf-8?B?ZmVyaW4xU1hUZmpNd01HZktRWWNPbEJyN04rZFFKdi9qK0g3dzJWdERxOVcz?=
 =?utf-8?B?bW9reEgwVmd4dEpGcytUMkluUWRwN05KOUVVRnpOM3pTWHFDQW81ZHNKVkND?=
 =?utf-8?B?bHdERTUzdUlLa2Fxb3psY0NJZHFZMXNrczZramdKTDJ4SFpmdWxZWmxuSmtK?=
 =?utf-8?B?MnpVbytVd0F0MjFQVk13RHlDR3VlQk9sNXdDY0hyNkNLM2lPczFZYXl6M3hr?=
 =?utf-8?B?ZWtpa01KOS93OFA4RlA4eVJ5TzRwSnhFQVk1VjdSc2cvMEkvSUxyNXBEbUM2?=
 =?utf-8?B?UzlKUUlWTUs0c0M0blhOQndacm9NQTJnSCs4dDNmTE02bHRPMDVrT3RaRStS?=
 =?utf-8?B?UVdZS3Bud0pJelRvdDNzQXVEbFA4bXlWOEdIZExFajM4RlhMcjljbWVEdWhs?=
 =?utf-8?B?TEY2MWlycllkOFZWcFJCMkcyN2FwYXk3WTVDUXZ0ZDdRYzhDWXlLWlFVcUZM?=
 =?utf-8?B?Mk1CVGJKb3lvRGN4SXJNU21JUHNlK3EraFpXTmVhUjlMcU9IeGlSWXpsczla?=
 =?utf-8?B?cUlTZEpGMkVFTy9DUHkraFFmL0d4Yk1mdllVOUt2amw5d2p0TmRPc1c1QlMy?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4081E83E38E814448A467F4CEA10E2A0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4f1c3c-59e3-406c-34ec-08de0c236891
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 19:45:35.0461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K4SKrBNgDn6/516mYPo3AbSGexCK1khjp+w72UqwejNAm8psrdJlzvPEbrm4kTViE5TADhx/BDkKiTb9Vyoxr/bGKxtm5Y1UnOo1kvULyC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

T24gVHVlLCAyMDI1LTEwLTE0IGF0IDE4OjA5ICswMDAwLCBTdHVhcnQgU3VtbWVycyB3cm90ZToK
PiBDb21tZW50cyBhbHNvIGFkZGVkIHRvIHRoZSBjb2RlLCBidXQgaW4gdGhlIGV2ZW50IG9mCj4g
YSB3ZWRnZSBvciBhIGhhcmR3YXJlIGZhaWx1cmUgd2hpbGUgY29tbXVuaWNhdGlvbiB3aXRoCj4g
R3VDIGlzIG91dHN0YW5kaW5nIChlLmcuIGR1cmluZyBhIHNjaGVkdWxlIGRpc2FibGUgb3IKPiBj
b250ZXh0IGRlcmVnaXN0cmF0aW9uKSwgdGhlIGRyaXZlciBkb2Vzbid0IGF1dG9tYXRpY2FsbHkK
PiByZXNldCB0aGUgc29mdHdhcmUgc3RhdGUgYXMgaXQgd291bGQgaW4gYSB0eXBpY2FsIEdUIHJl
c2V0Cj4gc2luY2Ugd2UgYXJlIHRyeWluZyB0byBzYXZlIHRoZSBzdGF0ZSBmb3IgZGVidWcuIEhv
d2V2ZXIKPiBvbmNlIHRoZSB1c2VyIHVuYmluZHMgdGhlIGRyaXZlciB3ZSBzdGlsbCBuZWVkIHRv
IGdvIHRocm91Z2gKPiBhbmQgY2xlYW4gZXZlcnl0aGluZyB1cCBmb3IgdGhlc2UgZXhlYyBxdWV1
ZXMgc28gd2UgZG9uJ3QKPiBsZWFrIG1lbW9yeSBvbiB0aGUgRFJNIHNpZGUgKGUuZy4gTFJDIG9y
IExSQyBCTykuCj4gCj4gQWRkIGEga2ljayBzdGFydCB0byB0aGUgRFJNIHNjaGVkdWxlciB0byBo
YW5kbGUgYW55IG91dHN0YW5kaW5nCj4gbWVzc2FnZXMgb24gaG9sZCBkdXJpbmcgdGhlIHdlZGdl
IGFuZCBnbyB0aHJvdWdoIHRoZSBHdUMgc3RvcAo+IGZsb3cgdG8gc2ltdWxhdGUgdGhhdCByZXNl
dCBvbiB0ZWFyZG93bi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0
LnN1bW1lcnNAaW50ZWwuY29tPgoKUGxlYXNlIGhvbGQgb24gcmV2aWV3IGhlcmUuIEkgdGhpbmsg
dGhlcmUncyBzdGlsbCBzb21ldGhpbmcgbWlzc2luZyBvbgp0aGUgd2VkZ2UgY2xlYW51cCBjYXNl
IHRoYXQgY2F1c2VzIGlzc3VlcyBhZnRlciB3ZWRnaW5nIGFuZCB0aGVuIGRvaW5nCmJpbmRzL3Vu
YmluZHMgaW4gYSBsb29wIGFmdGVyLiBJJ20gd29ya2luZyB0byByZXNvbHZlIHRoYXQgYW5kIEkn
bGwKcG9zdCBhIG5ldyBzZXJpZXMgYWZ0ZXIuCgpUaGFua3MsClN0dWFydAoKPiAtLS0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgfCAxNSArKysrKysrKysrKysrKysKPiDC
oDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfc3VibWl0LmMKPiBpbmRleCA1ZWMxZTRhODNkNjguLjBiYmFlMzM2YzcyMiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYwo+IEBAIC0yNzYsNiArMjc2LDE0IEBAIHN0YXRpYyB2
b2lkIGd1Y19zdWJtaXRfZmluaShzdHJ1Y3QgZHJtX2RldmljZQo+ICpkcm0sIHZvaWQgKmFyZykK
PiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndCA9IGd1Y190b19ndChndWMpOwo+IMKg
wqDCoMKgwqDCoMKgwqBpbnQgcmV0Owo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgLyoKPiArwqDCoMKg
wqDCoMKgwqAgKiBJZiBHdUMgc3RvcHBlZCByZXNwb25kaW5nIGR1cmluZyBkZXJlZ2lzdHJhdGlv
bgo+ICvCoMKgwqDCoMKgwqDCoCAqIHNvbWUgcXVldWVzIGNhbiBiZSBsZWZ0IGluIGEgYmFkIHN0
YXRlLiBFbnN1cmUKPiArwqDCoMKgwqDCoMKgwqAgKiB0aGVzZSBhcmUgYWxsIGNsZWFuZWQgdXAg
YnkgZ29pbmcgdGhyb3VnaCB0aGUKPiArwqDCoMKgwqDCoMKgwqAgKiBHdUMgc29mdHdhcmUgcmVz
ZXQgZmxvdy4KPiArwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqB4ZV9ndWNfc3Rv
cChndWMpOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gd2FpdF9ldmVudF90aW1lb3V0KGd1
Yy0+c3VibWlzc2lvbl9zdGF0ZS5maW5pX3dxLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGFfZW1wdHkoJmd1Yy0KPiA+
c3VibWlzc2lvbl9zdGF0ZS5leGVjX3F1ZXVlX2xvb2t1cCksCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBIWiAqIDUpOwo+
IEBAIC0yOTUsNiArMzAzLDEzIEBAIHN0YXRpYyB2b2lkIGd1Y19zdWJtaXRfd2VkZ2VkX2Zpbmko
dm9pZCAqYXJnKQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJmd1Yy0+c3VibWlz
c2lvbl9zdGF0ZS5sb2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgeGFfZm9yX2VhY2goJmd1Yy0+c3Vi
bWlzc2lvbl9zdGF0ZS5leGVjX3F1ZXVlX2xvb2t1cCwgaW5kZXgsCj4gcSkgewo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBLaWNrIHN0YXJ0IHRoZSBzY2hlZHVsZXIgc2luY2Ugc29tZSBtZXNzYWdlcwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBtaWdodCBoYXZlIGJlZW4gYWRkZWQgd2hpbGUg
dGhlIHNjaGVkdWxlciB3YXMKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogc3Rv
cHBlZCBkdXJpbmcgYSB3ZWRnZSBldmVudC4KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NjaGVkX3N1Ym1pc3Np
b25fc3RhcnQoJnEtPmd1Yy0+c2NoZWQpOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlmIChleGVjX3F1ZXVlX3dlZGdlZChxKSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG11dGV4X3VubG9jaygmZ3VjLT5zdWJtaXNzaW9u
X3N0YXRlLmxvY2spOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX2V4ZWNfcXVldWVfcHV0KHEpOwoK
