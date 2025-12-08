Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14DCD3B7E2
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 23:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAA810E458;
	Mon,  8 Dec 2025 23:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERE0PAOg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6559810E45A
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 23:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765237100; x=1796773100;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EwXCydESSOR/RfwndMepXUpPtA+0TFtb/96tDcDwie0=;
 b=ERE0PAOg4RlrMfBMKfLGMZbk8LxjJzjR9VqrrKHvAvvOo1a20UpF9Rgp
 b/l+mT/PJ0/d4WtrhAVXGE0oXZt9eSuF8KG5KkIcIo1K79l8NbFh8ChEr
 7iRbpAveSUPop9phGXKntLZczk6nON7Ucdn2VOMLUfS9ULpbNRVEAmGh0
 FnKXKUk8WH+Z7LNAVYdT3O+EA1HB0najkdKr7lsSrviOovPQoisLSD7T1
 tLH/cjIjDRnyH/2CGebJ2QTktvrasHx1DZNKMJh7kIkqj3Nq4NPEqXRn3
 ZGqP+E6z8RxvxbVBCs+OjgiNa0w0VQlx9a66nan3Jk6sswCWyYMpwjKdM w==;
X-CSE-ConnectionGUID: MvAVKtKcQF253S1HW5TlQQ==
X-CSE-MsgGUID: 9E3MQZ/IRq+3ZO6TN5WB2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66912034"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="66912034"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 15:38:20 -0800
X-CSE-ConnectionGUID: BauUR/0lRPOzJLtmWCx9ew==
X-CSE-MsgGUID: OiVHE07QS5ujePunVmQL1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="201186564"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 15:38:20 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 15:38:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 15:38:19 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 15:38:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsIhCY/hR6LB2YF79qcWjVoQR20RK0g+qA4yXtN+Xtk0aPbN/UUZrbAjyRgCAMcw/Z3buDmIo9O6bEZBe/dGADr1rfBDDasJkbdwkOZfX269RO7PaCcqNqZHSHrK3l27fI+VWFTN9TdT6kBYi0w87rgHrcVoxIR2irD2J0NFP9tWlIsXiLFwF1/2u7lmnJIv3Q5lq26fzd2gxEYGG5f66g/nOUrbjLStwyfMC2tQvIJixWbslS6zs1NhaMTH8y2tzU+a72MTBl83eI8dx3+0jumaymwKWXfwjPQEVnuTvE2d2aCF5ms2svW94viuCQd4x2reKUcvw0RFZHgdLm8mtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G3/h56uOXxNKS99mrwjdrHjhu3n3uMjMFFVgA73YXo=;
 b=xRTZjGOL3hjTek1VSx2S8VuoP1S6QIiRmauU1vZEgwYsfNG8Y5PIidatVErHB4NX6YBF57gQroGmJGMrjctPxo8U7Zz7iMOk/0SwTk7FDG84nWRtN574QJeposPtU/B9UVsasGZ3iuzfnNh8r+vfprKRqH2Wfv/pUjsq+/Y1qpJEfDYXxFByW/UMPHsXPQNFBxDfu3CvGAvQ9zx9PSNTPcZGmIM0SSrFipqm9iZfbW3YKHBMjGEo7APrXR52yuG4rMqOl5cBBSKnAUlG2vKtc8KE1YHnO73guT+p/1ot6BVTAWd2FolQbn23A5Gv0/fnDLmvv+BnSbUMZ+OUm7LZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB7345.namprd11.prod.outlook.com (2603:10b6:610:14a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:38:17 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 23:38:16 +0000
Message-ID: <a203d8b9-628f-4b5e-94ac-fadd45b1e9c1@intel.com>
Date: Tue, 9 Dec 2025 00:38:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] drm/xe/sriov: Add debugfs to enable scheduler
 groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-19-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251206230356.3600292-19-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::37) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6568db-a3dc-4a38-2795-08de36b2dc7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmxQV25wdXRxTFpHdXpuOUlPQlZLMW11RExiZGpQeFpLOFdYSTBoaGwvbE5w?=
 =?utf-8?B?ZDJ1RWdWWDhuTWQxNlllc0crRWpkaUx0U1ZLZGtNVWZTbngrN2lNd3JRRStt?=
 =?utf-8?B?RFd1Vnp6UmY5R2xlR3FSaFNHajdaY3grNm1TTnB1WnBEVlNndXJPazhFUWxY?=
 =?utf-8?B?TGN1WXJYalJ0VytTL3ZUQlBTT3dRRWJCa1hjd2xxaVFFdHpGNWNUMFlTeVFB?=
 =?utf-8?B?Rmo1am8yS3B2NjhZRXR6SC85YVdpYXdvRFJTUWtyNDNnUk81QTNoUzduYVR6?=
 =?utf-8?B?eWN4ZytuQURIdXBWcjQ0TytTTFFxU29Mb1luMFgrcUZKNDRscWxFVUdFYVpn?=
 =?utf-8?B?WmFvL1lva09WRnpRd2VRL2daVDhxbzRFZ245dG41WExtUWFqTWhndWZWeFJ2?=
 =?utf-8?B?L1IxVEd4WUtFR0ZvMDdkN0M3a1NGd05TU0VNbnF5L1NlT1g5OE9GVG81Qmcz?=
 =?utf-8?B?allzM2pWVW8vZjFPdUkvSlViTzZXOEhQN2Z4U0hhWjZablVEUDJNVkNDVHRN?=
 =?utf-8?B?NDRTeTRmem04Nk92MXMxbFduZ3FtNUN6ZmxYWTdXK0ZEWHdydFU5dDVLSlBi?=
 =?utf-8?B?Q2V3dzhIbGczZGoyRm16Wkw1UzRKSDZBNGFYK2FXUm9ZS0FUeHJ4azZXM040?=
 =?utf-8?B?VHU0K3VrV1JXRUhRNThKNktTQzlyN2JQKzM0WmhzT1ZzbzY2VFZkV0M4Q1Jm?=
 =?utf-8?B?RTAzQ3YxS01QL2REcTRGUHJnRWkzK0gyTDNvUWJOQ3kyMjVzSnk2d0RMNjd6?=
 =?utf-8?B?YmI3dGZ4TGtHNE8yZkFhZ0xjZ1FmZ3Nac0d6aTROaXZwbUVobXZva244eVBp?=
 =?utf-8?B?NVlodlJGRzZ4d1RPRExqb05CN2JKZnBHbE1uRDJlaU5ZNkNzMUttM1l4eExh?=
 =?utf-8?B?S20vQlJHQThTcmlwYkhYVlhoeW4xeExDZis3dnlURjRkOFZ6d1RRMHlyZ3Ev?=
 =?utf-8?B?WkNueTRRTTZZdFJZRUJlZWUzSVU4RGxnNXo2Mi9VeHhrMSttM1V2ZTUvSlJK?=
 =?utf-8?B?YzRMbXVNaCtkOXRlZW9OaENNb1BKU3NBVzREV284WVBwTWlSa2ZWUUFJb0JP?=
 =?utf-8?B?MTJJemRISlU4U0xmR1FzUm9sZnNGSHpRblB3ajRISHZFaFhaZENFbUpUQ29F?=
 =?utf-8?B?WmlQSWNGOUVlcmhaeS9jeUpWZjlXMlRHT3RxTm1VTWErbEcxaGhtU1VqeFY2?=
 =?utf-8?B?cDlnVHlhcXZ0UU5CcHBsV2dYdmZhbmQvZW1KOGxMSWx2cUwyanRkVHlueml4?=
 =?utf-8?B?ZTdLb3BSM0tmQkEzSUUwaW9WMnFVd0J5T0F4M0JFTHVraEZDWkU1cGx2VHlO?=
 =?utf-8?B?RjhtS1QrVHZJYUZrb2dPM0J4b3p0dHlaNi9KRXFNd3U1YklWODlWQXNvNkhZ?=
 =?utf-8?B?M01MalQ3QlVvMzBPTml0ZFdjZ1ExM3RpRWFmMkExdEF2dXZJd1h0bzJsKzlx?=
 =?utf-8?B?NC9FNGVTQ1Vxa1NrVlpDQnpSRVJlTU9UL1hxS0hRVnMzQjN6M25RaG5VRFZT?=
 =?utf-8?B?YTlKY1pGay9sTTFnc0lTeDRwdUVGRWJTbGlKbU9NOVRzV2U2cU5mM0t1R0tU?=
 =?utf-8?B?bjhVRS9CcDFFZGdVcDFmWTdPWGlMZGRqUWpLa0ZUTk5pSk5TdUd3MjNTcFd5?=
 =?utf-8?B?RkVJdnVHdmNxMU16a2xmd3YvRm9YaDU0N2hWTDA0aTVGZFpQL0g4YjBEVjIx?=
 =?utf-8?B?cEtwZ0ZPQkMxS0ZlL0NRS1RRRkk4cjNmd01hRUprWVBHRUpiWVNnK0xUeTFl?=
 =?utf-8?B?VnpQMkJPdTFDaEc0NFZJZVJwUFF1UnJIVG9VQytyRUEyd0t3bkJmaDZLOVQ0?=
 =?utf-8?B?bTRXbFdPamVQV2RaMWxTNk8zU1VxQWVtU3F4b0lzL0RORWZsbTNwM2N5eVps?=
 =?utf-8?B?Z2pHaUJJd1cvNHdtWFJVSEpDcHFFUk9rSzdBVGU3SHNCa04xaDNKazRRSkpm?=
 =?utf-8?Q?WYtRLATB3ThSByR/JwRfClrBAQNEcHO2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEJWa1BEQmUzaHkwOTZaRkpBZFdHaEdpUktwQnQvVmR6eWZKSjlWL1dxTXdT?=
 =?utf-8?B?c2o4dG9hS3VTMDNPNXNBcWE1YUJ3N0g4dnlqakIyNFExM3hEZHNxZkNuVnNy?=
 =?utf-8?B?NEQwbHdxL1hDdCtrSjNUNDZXWDdORTFSUk1mRENwLzJXMFg2eVJzL1Fsd0xo?=
 =?utf-8?B?QmQ0MWYxZU14YmhOVGdSdkNXN0o3aVF2NmFxSmtTZEozQzhWNVo4czRvTVVx?=
 =?utf-8?B?M2pHcEo2OS8zMU5sblhYdlRtQXcxU1VmakVsRXM0QzRsbTlVem5OS2J1VUox?=
 =?utf-8?B?NHJhaXR5ZU1wUmJMV25WOGNCTGc2bUZ1alUyL2gxY3NabU1Hbk9XRG51NkJB?=
 =?utf-8?B?ZWo1MGcyMWlENE1CMUF3YkFTcHUvaHY0OE1XTU9FZjFaQUZPZ0l6R2hJMVln?=
 =?utf-8?B?dXUwM2FoK0wrQVQyRm11bHZSYTc4WXRjN1BZTlZ5Tm4xbHdiQ2dObTM0R3NH?=
 =?utf-8?B?Mm9XSWRtNFZMMG9rcjlTbExpMnBYQmMxQk8wRDI0cTREY2ZVYzVBcXpOUG1I?=
 =?utf-8?B?VXMwb1U5ZGpPR2h6YmdIWHhTRHVpNEpjRENZRUxNcnhMVnJsWUZxVTMwWHJS?=
 =?utf-8?B?b3g0MHY5bW9QVEZwaXprSlpmVWZOaTdlT2I5ZEdlUSs3Uzdwc0RnaHRmeG1a?=
 =?utf-8?B?WTBiUkpWMjE1TkxvTlZvczlvQUNFbWNhVHM0YXQxeHorN0syc2hnMTdiSEtw?=
 =?utf-8?B?SmNtNWdzSnJ1Z2ZTUmZmSzJXakZ4OUw5MkcyN1hrTnJtK2ZHbWZqRmJlZldQ?=
 =?utf-8?B?OEFNYko2a1Z4VWhRSDN4QS9aYWIrQnd4S3JhTDFIbG5aWVZhaEdWVTQyc1Ba?=
 =?utf-8?B?OHR6aVFtOW10OHVvamo2L2hiS2xQUXNCaThRZWQ1ZG5QRE5ac0F5YmtIcHg2?=
 =?utf-8?B?Z1prTHdMUU1VN1dGS1NnNU1kR3dwaFhjbFNqWTZXU1VWOEgyNVpDWEphV0VD?=
 =?utf-8?B?OS9PSDIrVW5Qb2dkYUFwbnZBNjJYZGl4S3BNNFBHS3NGL1FmbzMxL0hmdVJ0?=
 =?utf-8?B?a3Q2dHhnRUVpaE8rSDM1R0ZoM2ZSYlB0S0ZXVnlOc21tMVBMcTNpa0VuelBi?=
 =?utf-8?B?SWkrcEV1VVAwYmRHUXloc1pYRXNZakczQ1M2NTIyNUFOODhXSTJaZkZQSmZ0?=
 =?utf-8?B?SHE3V1BBZSt3MmM5VXhSNXVmWkQwZzJ1WDc2TE5NWXFKSk1yL0E1c0grVHNa?=
 =?utf-8?B?N01BVW8xVXZ4YllVSGpFekVSY0tFNjRUUFBsUmRGb3huYVRCd2h1SWJTU0J3?=
 =?utf-8?B?bUtMR01mNEoybU5IWWNobG13WnAxZFFaY1VTMVpYcG40Z1JYZGVCZ0s0S2ZN?=
 =?utf-8?B?RFdyekNYcjV4YU02bmozNWlRYzJlSFZPanJxaHJHWmpscFBrTlovS2NqNlNV?=
 =?utf-8?B?bEVrTWplYUZENXdJSGgraHlWTjBaSWJnWFRBUU93MFc0d2Z6NjhaSjEvL1N5?=
 =?utf-8?B?Y2p1OTRIb1crY3pVVW1WTkxVcHRjZzJDbG8xZlVOK0tJd2w4RXJqRkhvaWxy?=
 =?utf-8?B?MkNqVi8wVG1jS2dGRjJaSFRVVG9jNGhGQkFkM2pNRjB0Y0djUGVNVjlHRlRp?=
 =?utf-8?B?U1hJbjFpVFE2S3pDQzhpTG1yc0U1TUQxWGJzN2dJZzl1eVhVSStxZE1TRnNU?=
 =?utf-8?B?NG42NXlvQjRFOFdYMzBDU3B1ZGRQR0h0blNQMlhPRm5zZmlXamI2cW03b1B0?=
 =?utf-8?B?UkRiRk5HM0s0aEJOQ3B0dU9qZ1pnSktuei81aHlLTmVBSTRtWTNra3NmOVFE?=
 =?utf-8?B?amhoUnJVUkhzc2YyRE5DYnp3cXhOS0ozczdybjB4akpIMzdlREkxNWR2Ti9s?=
 =?utf-8?B?RkRiRWtEa0REQXQwRCtYNnA4c0hmQjVLWXZjVjN6U2xobGNKM3dGTCtDRDFh?=
 =?utf-8?B?a1M0N3YycGk3Tk5iUjlGYjVsR1NsOFJUNWw2d21TSzBiMmhwejNTYVFFUThw?=
 =?utf-8?B?Y0tLRDJvbDJNYW5QdUlSMEthd2NYR1VkVU9aU1FpT01tZXNocnVlYWZIMy9Z?=
 =?utf-8?B?SzZaWU5EWGlmMFVZQnNDTUVrZmRHY1c1NFhIZE5YRkhNMllGUW5jQTRsdWxG?=
 =?utf-8?B?SHlPSlIrajlSUTZtWlVoUkFZckc0NDhYM3ZVQXk0Yk5rbDdia1VBS3lha2s3?=
 =?utf-8?B?aThpRWVYekdnS0VkdWZnOUNhZnVxdjJhQnRZUFZrUlI5Q3B6U214UkRnUlZV?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6568db-a3dc-4a38-2795-08de36b2dc7f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:38:16.7556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uE4xBTNi/nvfMGJysQrDHwN15cd0TifqJDEAj7tVxWBkPTxXN2srJdoarICO0Arqx2yqDpnBW3G6y7rmDywfiLOevG7UjNsT4L8MrTeDBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
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



On 12/7/2025 12:04 AM, Daniele Ceraolo Spurio wrote:
> Reading the debugfs file lists the available configurations by name.
> Writing the name of a configuration to the file will enable it.
> 
> v2: don't print anything if the feature is unsupported (Michal), add
>     TODO for reworking init order to know if there are valid groups
>     when we register debugfs, check for basic feature support.

btw, recently in Xe we started to follow core kernel rule and put the
change log under the --- line

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 126 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  19 +--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h  |   1 +
>  3 files changed, 139 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 5123ff1fb116..1be23809e624 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -156,6 +156,131 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>  	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
>  }
>  
> +/*
> + *      /sys/kernel/debug/dri/BDF/
> + *      ├── sriov
> + *      :   ├── pf
> + *          :   ├── tile0
> + *              :   ├── gt0
> + *                  :   ├── sched_groups_mode
> + */
> +
> +static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
> +{
> +	switch (mode) {
> +	case XE_SRIOV_SCHED_GROUPS_NONE:
> +		return "disabled";

maybe we should be consistent and use either:

	"none" / XE_SRIOV_SCHED_GROUPS_NONE
or
	"disabled" / XE_SRIOV_SCHED_GROUPS_DISABLED

> +	case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
> +		return "media_slices";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static int sched_groups_info(struct seq_file *m, void *data)
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct xe_gt *gt = extract_gt(m->private);
> +	u32 current_mode = gt->sriov.pf.policy.guc.sched_groups.current_mode;
> +	int mode = 0;
> +
> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
> +		return 0;
> +
> +	for (mode = 0; mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; mode++) {
> +		if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
> +			continue;
> +
> +		if (mode)
> +			drm_printf(&p, " ");

nit: drm_puts() ?

> +
> +		if (mode == current_mode)
> +			drm_printf(&p, "[");
> +
> +		drm_printf(&p, "%s", sched_group_mode_to_string(mode));
> +
> +		if (mode == current_mode)
> +			drm_printf(&p, "]");
> +	}
> +
> +	drm_printf(&p, "\n");
> +
> +	return 0;
> +}
> +
> +static int sched_groups_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, sched_groups_info, inode->i_private);
> +}
> +
> +static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
> +				  size_t size, loff_t *pos)
> +{
> +	struct xe_gt *gt = extract_gt(file_inode(file)->i_private);
> +	char name[32];
> +	int ret;
> +	int m;
> +
> +	if (*pos)
> +		return -ESPIPE;
> +
> +	if (!size)
> +		return -ENODATA;
> +
> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
> +		return -ENODEV;

maybe we should drop this condition?

if we don't have multi-groups, we will still display:

	[disabled]

so for consistency we should allow:

	echo disabled > sched_groups_mode


> +
> +	if (size > sizeof(name) - 1)
> +		return -EINVAL;
> +
> +	ret = simple_write_to_buffer(name, sizeof(name) - 1, pos, ubuf, size);
> +	if (ret < 0)
> +		return ret;
> +	name[ret] = '\0';
> +
> +	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++)
> +		if (sysfs_streq(name, sched_group_mode_to_string(m)))
> +			break;
> +
> +	if (m == XE_SRIOV_SCHED_GROUPS_MODES_COUNT)
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime)(gt_to_xe(gt));
> +	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
> +
> +	return (ret < 0) ? ret : size;

we can drop ( ) here

> +}
> +
> +static const struct file_operations sched_groups_fops = {
> +	.owner = THIS_MODULE,
> +	.open = sched_groups_open,
> +	.read = seq_read,
> +	.write = sched_groups_write,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
> +static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
> +{
> +	xe_gt_assert(gt, gt == extract_gt(parent));
> +	xe_gt_assert(gt, PFID == extract_vfid(parent));
> +
> +	/*
> +	 * TODO: we currently call this function before we initialize scheduler
> +	 * groups, so at this point in time we don't know if there are any
> +	 * valid groups on the GT and we can't selectively register the debugfs
> +	 * only if there are any. Therefore, we always register the debugfs
> +	 * files if we're on a platform that has support for groups.
> +	 * We should rework the flow so that debugfs is registered after the
> +	 * policy init, so that we check if there are valid groups before
> +	 * adding the debugfs files.
> +	 */
> +	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
> +		return;
> +
> +	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
> +}
> +
>  /*
>   *      /sys/kernel/debug/dri/BDF/
>   *      ├── sriov
> @@ -531,6 +656,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
>  	} else {
>  		pf_add_config_attrs(gt, dent, PFID);
>  		pf_add_policy_attrs(gt, dent);
> +		pf_add_sched_groups(gt, dent);
>  
>  		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 6a682d788b02..2cafacac5d8e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -451,19 +451,24 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_
>  	*num_masks = GUC_MAX_ENGINE_CLASSES * groups;
>  }
>  
> -static void pf_init_sched_groups(struct xe_gt *gt)

missing kernel doc

> +bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt)
>  {
> -	int m;
> -
> -	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> -
>  	/*
>  	 * The GuC supports scheduler groups from v70.53.0, but a fix for it has
>  	 * been merged in v70.55.1, so we require the latter. The feature is
>  	 * also only enabled on BMG and newer FW.
>  	 */
> -	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 55, 1) ||
> -	    gt_to_xe(gt)->info.platform < XE_BATTLEMAGE)
> +	return GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 55, 1) &&
> +	       gt_to_xe(gt)->info.platform >= XE_BATTLEMAGE;

and maybe we can introduce this function in patch 2/11 to avoid this diff?

> +}
> +> +static void pf_init_sched_groups(struct xe_gt *gt)
> +{
> +	int m;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
>  		return;
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index ceaf797ca21b..f5ea44dcaf82 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -17,6 +17,7 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>  bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>  u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
> +bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt);
>  bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
>  bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
>  int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);

