Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0394CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 11:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7989A10E380;
	Fri,  3 Oct 2025 11:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGqLLS5F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8A010E393
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 11:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759490237; x=1791026237;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1pbBqZDskkUHvLPVZJwJ83HnjcA26NZjLB85xoFUIMI=;
 b=DGqLLS5FCDYo1EPwxhXV/Jc90dnx5ssK8kn52croXSs1OLfmAKm6Gs38
 LSJAEWmdjFd74FJ9YvK9Apm5mWgVIPS7Cope81MyQwG2PQRIp152ssBGw
 StGzpozFWApS3g1CFJVyNswMUJ6a+WGl5Hze1t+RFoOkPVLfyOvMC1vB9
 aGw7jbtLKT6LJ+OBHnK4dOv4ts477BD6FP9ubWUMASq4yySWXl1vh1cmB
 wA9eLJOfunmfRu762/57fxPziHuqRYRLzXq/u1T3MrWe76QogmM9Cyo69
 dj0Ogj82rpGv+yAtkHXQk5SE2IIOdCeGiFUwfBZ908n1iaKBH1AKQEpr+ w==;
X-CSE-ConnectionGUID: r3NSp0WJRJeyu2Nr4fhL6g==
X-CSE-MsgGUID: FcJtjChsThiOWf2f1qrYhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="65621599"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="65621599"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 04:17:15 -0700
X-CSE-ConnectionGUID: t6vOvQf2TlSCKJsqSprJsQ==
X-CSE-MsgGUID: MGibECubSseEywBToKRiSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="179686354"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 04:17:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 04:17:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 04:17:13 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 04:17:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHZVn/XI8sS2OdY6X1Ao1e7XXAauwmtMmRxj/E8S7dKFiRSRunGD2s9EMYAsFs2INrEInBYYLJeZR4U9xmcNTPYnm6F8fYJJ849MaVanSqzgrh4cyB4jYvVfrrbDpf/7d1nWvB45ZesncuTRSAcp6QaVFS97aQzNm9XEOMYW5zX/ncMPyqzAaD8lQ4X5dBd9lNtrXB84bV6iNlp9WTN2/xCLNymu2WrfwVTnuEZxfQCIwR9R9tO4Fou8U664pcGGNRlkZKJUSFNUjjkP3uiaUqanGNNPmiGYXTQLvH9ZqqJ0r/fZQ3s3aV/N0Y6v0UQtScEUDEvDm6ZO/PB56qNvGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2T/DSGWRqSKMcTa4U+fWjUeGi8B+DTPWNfMeaXkqSes=;
 b=QngCBsiAKCWPlA0s3jnobRiTye+oV1B+9OAIp2sH0cA1okYcSScXTUrPXMOrM5vxkBhpn37NHE9akCkWttdhnpl0nHmKxzO+e48q16Mi+qvAi+IVPV71Sl2UgDcCZlYrDDlpyIWdvhKl7Pj7yuVv6FGYoR1AEI60G21NGNXtutbpgZGcalW1YPAX2M6YlyARwsLFHanJ4KXJbSkNZydu7ZcGAmWZ3itHr1KBesXtwnEQRj+WDDfUOOa9HbItmlghpziwRiI0NpcEyNhfm1lOJnSg0UBqaIEPwoncImjPiojv+lyzb7xxhGN87Ki521fkywM071vfgH+yyWe6A31J0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA3PR11MB7656.namprd11.prod.outlook.com (2603:10b6:806:320::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.20; Fri, 3 Oct
 2025 11:17:06 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 11:17:06 +0000
Message-ID: <39c6b59c-1427-4fc0-8440-ac75945bfc59@intel.com>
Date: Fri, 3 Oct 2025 16:46:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_late_bind_fw: Initialize uval variable in
 xe_late_bind_fw_num_fans()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20251002005648.3185636-1-mallesh.koujalagi@intel.com>
 <aN6Hy6JZRq-vi08T@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aN6Hy6JZRq-vi08T@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA3PR11MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 475b76ae-7646-45dd-5ccf-08de026e6289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2c1dmpWei84RzRiZjNOamdpSHZkUERZdDNTSmltM2pCL3htdW14Mk1IM3Fx?=
 =?utf-8?B?UjArZXQzWCtvUVViRTRhRU52b0pRL2MyWTA5OWJQNWJPV1ZVNjJFNlNNYm5F?=
 =?utf-8?B?REhWNHhhQ2xxWncwZ2EzdWJoa3pQVFR0NUtXdHc2WVJnR1Q4ejdoSTFNV3dr?=
 =?utf-8?B?cWNSWk1TclZISHcvcDVCTS9WUm1OR3FXVEhqNWU0MEkybXBXVFpaMFhUYzhT?=
 =?utf-8?B?bTg3RlpYeHo0azlqSXVTL0MrZkEwWEMyWTcxYkJmOWR1MjdNZmRoNWE2T3d3?=
 =?utf-8?B?QkdMc08rU01iYWh2TEV0RThLUWFJeVFIcjNXNnVaSE43Z0t6eHZVd213blFU?=
 =?utf-8?B?eFJkRDNjclg1VTgyajlvcVlOZTVzdEpQR2N4UHc2RWdnUEhsdmpDcnRlbHEv?=
 =?utf-8?B?Mm50YnhoWExhbWhqOENNN3djWlJqL0xGNmlZSUtSc3JZTnFJWjQxYmpScTVq?=
 =?utf-8?B?eUNKemFYbXgrczJKU1BMeEVrazFCUW1Rb24xdFc3QWNEaDRnZVBMK3IwZDEr?=
 =?utf-8?B?QitBeUxnQnVYZGltZjhodkJDaGVCeDdtNGlLMlNiRnhYRjJJem4xS1piWGJS?=
 =?utf-8?B?a01CNUx3S0hNekVvV1cwNk9GcTBwSi81S3Yzem40KzQ5eGMrak1nNlJjVklT?=
 =?utf-8?B?M1M2am8vdG5XSHhhSkRuQzUxOFJQOVl3Q21MOHA0TWxVUUc3WHJSbDRsNndh?=
 =?utf-8?B?V2I3bW5uNXpGQ2J2YjJwN3czZ1gzb09Nd3NENjJKVGtzc0JrSDNZODM2ZkdT?=
 =?utf-8?B?WHZXSHJXYnN4b1BMRkd6TnN5bUNmTFBVbGo0QVZwbzBZK1B3STljM1k3WGRx?=
 =?utf-8?B?NmI3Z2Z5UFJrNmF5SndQU2RvQWVZYTdBUXd5a2MyZ3N0bk4xR3R4TkFmKy9Z?=
 =?utf-8?B?cnpOOGp1cW56V21yMFNkWUcrZjVxYUloTVNiaHV2QUY4aVg3TndPL3FaVEl2?=
 =?utf-8?B?bWRBRy9QT1prRzRtNVJLY05tTEdqZVgwaFNOQysyVWpZcU1obU4xSFc3WC9p?=
 =?utf-8?B?cHNoN1hNaHM5Nk5EYmJ3N2R4Mm9lazdCeDBWQ1o1VnplTDF1K1gvUnBOMGtD?=
 =?utf-8?B?ODh1OE5IMjhTZ2M4dHdYV1dTaEUyVVZsY2owcWFEU1ZaMjNkUzVud2YwU2V6?=
 =?utf-8?B?ODV0K1RWZHJBdVdkUVMxUjdiL3RpZ2xVaUJnVWtmUTc0WWkxb09tdUY4Lzln?=
 =?utf-8?B?MWp3YlQxMFI5UGRtaEh2U1JiMDdnS3phN2tPQkI1OW1hRXRHYjEwaVZ4WXFt?=
 =?utf-8?B?cjh1RHRvRllqckJ3STlHdGlJUmdxZ0kxYUZVU0owL2Y1NjJqYlppVG9HR2tz?=
 =?utf-8?B?emVLQTltTlN6cDE4L3dUalNvSStrODdMbWVCaEN2SDB2TzZrWVFNVVZ2Z0hu?=
 =?utf-8?B?Um0rSXZPTHd0TTFFZGI5TWJhdVdDQkNlVlR2RmthNC9FN1B2aTRBdGZRV1gw?=
 =?utf-8?B?ZFFrU0VjWEN5SDNjM0hhWUR6K29NMWl3ZWw3bFRLNzMzSXhRWWw3TGZlY3hO?=
 =?utf-8?B?c0ZQNDJ0UkNJb0dZcjZPYURGRzBlY2JHNVo5R1UrTWx2YldoYnJsV1M4YWRt?=
 =?utf-8?B?ZmpFMU51bmtOaTFwYWJIN1pIZjFCNUNpZjhRdUM4R3A1ei9jbklFRFpwbXpE?=
 =?utf-8?B?Y0FJOU1FdVVIR3dyanRwckt2ekdXaUV0ZjNkeDBtaHljQVhxeTZ3RG5SMENx?=
 =?utf-8?B?N1lncWErYll3aVNGN1dEZUluenVTelEwV3NEdEJaOVF1R0JzTUg0a2pHSlU0?=
 =?utf-8?B?bHk5QVhmMkdId2V0MzR0a3dFenE4ZytmbDNrY1Joa0g0SjFMdkh5VG9HVHNn?=
 =?utf-8?B?YnlsZ3kzYmVpV0RkMWhMK1lFMUhMbjFNRTlHK2tNcGxYSDBCZlBVcmlJRkNR?=
 =?utf-8?B?a0d1eGR2eWZoSk1XQW9mYXk1bStETml4QW44SktqVStKdGptakl2NXdmMWhL?=
 =?utf-8?Q?1kkHHyTbq6HNAsqj47IYSSNMlpB/8kq9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnhsVXJFK0Q0TFhQbHNjcEkyOFhaQVVraFdyb0xocVJTMDE5S1pnMXl6emV0?=
 =?utf-8?B?TnZyUmJmWHdQcURpVEZXOWtsU29tSEZtMThkK28xSFE5ckFaVmdHT09pM2hB?=
 =?utf-8?B?SFQ1bDlqZUxnaXJGVEZoZHprd1hEUysxVjAzbUE5YW0rZm5FdCtScmp6NElo?=
 =?utf-8?B?dlNsTnhtRkE5K3JLZmF1bzZ3OXhtZFl2dXhxbnI5S0orMGVzWHIrdkY3clkw?=
 =?utf-8?B?YVRzY2F4Uk1rZTJwYWZrMUthcnUzZVNIMUF5ajFKeDdyTlFJcTYxVVFkUVRF?=
 =?utf-8?B?QStiZDA4U25YemtNZURET0U2QUIwM2F5bVUyRDIrU1lmSkVLaytZN0dMTFpw?=
 =?utf-8?B?OGVidnY3RCtub3Ewa0swQU0rUWV2Qk1UaXN6NytRL1YwdjlpSk9pUFFVdUNU?=
 =?utf-8?B?OFhGaVJiVzFhYXlxTndaSG01MXJoNmN2aWZkMWplMngxTXh3WkszcWt0UEYv?=
 =?utf-8?B?eGVqTmR6NXk0UTYzWWUxL2ZMYUpnYW8vbmxGZkFoS25ncUphajVUclA1TFpY?=
 =?utf-8?B?ZWJvWWhsNUJvU21xS0xoN0s3VVYxR1FmTThhR0V5NHM0Zll3MTQ3di9MNmxw?=
 =?utf-8?B?OEkyMDBLQkp5SDZRa21tL0FHQ3lPc2dnU1dUODVxSW1Ja2ZJMXNoMklIcWoz?=
 =?utf-8?B?aE5VNFY1UGVkWnIrMjBBZHlZSFlQWkYwbjVrd1YwYWR4Q0RtTTBtNjBUbXB6?=
 =?utf-8?B?STZpMU85cXBnUHcyaHJ5cmR0QjMrS3RBQy9UZGNmdkdjMlpudndCTUY4Q2x3?=
 =?utf-8?B?UlZwcGdDamE3UVZTN0ZWN0l6bUU3aGZsOWdVV0c4aHBSbG0vd1dhL0JPZWZl?=
 =?utf-8?B?UXFiVnhLbVkyVENMYTA3R21hWC9wdkh5dEpSU2ZWTzRrWlRja2g1eDdNbTls?=
 =?utf-8?B?SXBxNVc3Q2FxZ3oyUlR5eGZUVktVN3pNeHVaNmdONUxKYStSSll0S2o3L2hS?=
 =?utf-8?B?Q3VVU1ZDTkVOV2ZVRWo1NUpwdkpCM1ZTWmtoUkc5dUhESEV6R2lDeEVreTcr?=
 =?utf-8?B?Y1VCQytQWTk1SHR0eThKYU1UdTJBdXpJY0lPVkxsWUxwOWpmbm9NOVU3L2V2?=
 =?utf-8?B?TGV1YzV0eS9WWDlQUXFhdS9RUjRZdHhVWDB0NzFvYzlhbzd0R1lxUVVGNWEz?=
 =?utf-8?B?SnR0WjRHLy9TQ0dDbXRrZTkzWVp2YlJJOHlNakZCSDg5dUs1MWREcFZaTkY4?=
 =?utf-8?B?R3dxY3BtUm1LL2ZIU2hjNkZRQnhXdlAyay80cFpjU0pIczdIRm45RUpUVkVo?=
 =?utf-8?B?N3NkRElNL0xFUXRDNERmdnQ4ZEVOR3ZQY2xIWWQyemhCdUtRcGFUakZEdVQr?=
 =?utf-8?B?OHI3c2k3N0FlY0M1M3BKamhJY0tpU3RVTFFNVVR3QVlmS2JuQVpkZHVxbFhB?=
 =?utf-8?B?Z2FtcVlaZm5tOUdtbFdhYm1hcE1iV2w5ZjJaT2xMR3g3TUZlZWJFdzlkNm5K?=
 =?utf-8?B?U0FFNTBDeHhhSzE4VW1jWGlyT2RPVnd1Zmg2V1h6TGgrcnBsY1FkRitBZElK?=
 =?utf-8?B?akhTdmtTVzdXZXVVdDl2UW9MZHJhMFRZSENnSkZDRUhKay8xalJ2MFJRcFNG?=
 =?utf-8?B?S1pNUUUrMnlIS2RQckphNUViemFjeEkyc0F5VVpFVVIvcEF0dTVsTkFBTGtQ?=
 =?utf-8?B?TCtsRnJWMDJ0VkNCVE8wZTJaVUVleE16RDk5UzR2STVEaC9rdTcyZklJSWtr?=
 =?utf-8?B?R0ZyQ1k4MThXR1J3c01mVndpUGFNaENPRmc1WUNZTHBJRFhNZ0tJbnQ0RzN2?=
 =?utf-8?B?YU1QbDNxV3d6WVJCRjFEZTU5azhkUmlBMXlFblRVZ0phcXo5bWsyUnBQUGFw?=
 =?utf-8?B?ZUpqaTVXWG02T1d3MVU4RHhJczU1QkY4YmhGaFNEdFdPY1JDSVBwdk0yRTdH?=
 =?utf-8?B?MW5xQWVJMGtMRE5HTkFZNXg3OUpZUDVrRThFQzZURWdiK3hJaFdsVWdSS1dT?=
 =?utf-8?B?azIzUGdqUXF5UGxYdUFVTUZUV0NRa1lKcDBobkNvKzdmbFZlNlVNbXdZTEd6?=
 =?utf-8?B?d1NjRFZoKzNpU3FUWUFZd1VSOTJvTUFBT1NpV1B2MEtoMGJYNGUvaFYrdzFC?=
 =?utf-8?B?VGhRMGVPKzlweXl1cExCWmlvci94WXhqelRYRm9jYTVnN3FWRWdkYThpTFl4?=
 =?utf-8?B?NWtudzhtRUtNQ2IzY2MyS0pGYXB3WUpXMm02TUpsdXl6VEdCZGhXSG5wVEMr?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 475b76ae-7646-45dd-5ccf-08de026e6289
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 11:17:05.9890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRxD/oIZc4ercdjaSzvaOD1dNrmhv7QpLGVdUoXeQx3HpYmyxhT57WAVlXhJ+Sm2l5jBMogMSAdJoeSQp2x3Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7656
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


On 02-10-2025 19:40, Rodrigo Vivi wrote:
> On Thu, Oct 02, 2025 at 06:26:48AM +0530, mallesh.koujalagi@intel.com wrote:
>> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>> Initialize the uval variable to 0 in xe_late_bind_fw_num_fans() to fix
>> a potential use of uninitialized variable warning and ensure predictable
>> behavior.
>>
>> The variable is passed by reference to xe_pcode_read() which should
>> populate it on success, but initializing it to 0 provides a safe
>> default value and follows kernel coding best practices.
>>
>> v2:
>> - uval = 0 which serves as both a safe default and the fallback
>>    value when the pcode read operation fails.
>>
>> v3:
>> - Handle MMIO failure (Rodrigo)
>> - The function should probably return the error and make the uval as
>>    pointer-argument, like the pcode_read.
>> - Change the caller of this function to propagate the error
>>    upwards if mmio failed.
>>
>> Fixes: 45832bf9c10f3 ("drm/xe/xe_late_bind_fw: Initialize late binding firmware")
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> and pushing soon

Is it pushed? The patch is no more using uval as title suggest.

Thanks,
Badal

>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 8f5082e689dc..768442ca7da6 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -184,17 +184,13 @@ static const char *xe_late_bind_parse_status(uint32_t status)
>>   	}
>>   }
>>   
>> -static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>> +static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fans)
>>   {
>>   	struct xe_device *xe = late_bind_to_xe(late_bind);
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> -	u32 uval;
>>   
>> -	if (!xe_pcode_read(root_tile,
>> -			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
>> -		return uval;
>> -	else
>> -		return 0;
>> +	return xe_pcode_read(root_tile,
>> +			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
>>   }
>>   
>>   void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
>> @@ -314,7 +310,11 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>>   	lb_fw->flags &= ~INTEL_LB_FLAG_IS_PERSISTENT;
>>   
>>   	if (lb_fw->type == INTEL_LB_TYPE_FAN_CONTROL) {
>> -		num_fans = xe_late_bind_fw_num_fans(late_bind);
>> +		ret = xe_late_bind_fw_num_fans(late_bind, &num_fans);
>> +		if (ret) {
>> +			drm_dbg(&xe->drm, "Failed to read number of fans: %d\n", ret);
>> +			return 0; /* Not a fatal error, continue without fan control */
>> +		}
>>   		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
>>   		if (!num_fans)
>>   			return 0;
>> -- 
>> 2.43.0
>>
