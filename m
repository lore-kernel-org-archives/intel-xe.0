Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D886D0E6FE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 15:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E99310E43D;
	Tue, 25 Nov 2025 15:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEi8hcJy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B7910E439
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764084701; x=1795620701;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YgyoWP/CIoeqN5dr0OFaoCVk7O85+EvkdUCXZjE/Jmc=;
 b=TEi8hcJyy8FL6upewZsirowfkv2QYgZhHE12McwUYjXw1z36j9dXJ7/D
 1tol5GhHHZF6XdzpnJtA9sACCD6mVpsoDacEMXlwuxZueUK55/DFeWK7K
 InQbivdUg7AmO2kD8SlmzIVib7208h82o7ABv/082XUmkpuSJoy94k7OP
 T4G/gyYAGpNVNS51MLdaQMrLIMgSdAif5zTxjCL+L68LKb1SYVWtVPMr6
 +EgiyWH9lC4OG+qnkcizGrfv6fQ2XDjEIwcLAl1llgX908/g/Dtpn8NaG
 Uw8M7jgdjM2AYiXIPhf36PwE3tEo0/6XUHJ4xe/uALzNZcEDE0wQnKUCs A==;
X-CSE-ConnectionGUID: ZoTJ5zfCTnSnVmMS5As7ag==
X-CSE-MsgGUID: sSReFD07ShOcijqePBILXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="69731476"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="69731476"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 07:31:40 -0800
X-CSE-ConnectionGUID: EToIepk7TpSP9sESvBBNXQ==
X-CSE-MsgGUID: 5+3AH6FHSIm5Lpod1RDqmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192309358"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 07:31:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 07:31:39 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 07:31:39 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 07:31:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZnCD98Efz24hxq91iMD4S7vmgruGhiv4M1Mckf25062M4ezFjF3YKud0WNFpsfHwhbufYLYsAkXPFm9K4tjWTGK9hUxl1NlRZLnw2Yj32JAjkCiVR2i6srrpwEWdAI5mWF7YQEZjaz6tvFfTT3IE59B2CC50fmTkcdzJhqL45zXRGhI6nGoEIGWn9CddlERYphNxf1hgotglUalhBJrPlKYuC6Lsy0eQQHcc/Q7xNY/ClfmyR4c3SDlfbInIZ5mf66Ct03Gdy3zSSYJdEF8H5kLs4/s/Og1XZdoKPZcMf0FyBDVrmufvuBnf6TlwdL53WMQi1rWhtmXmksEhfU3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgyoWP/CIoeqN5dr0OFaoCVk7O85+EvkdUCXZjE/Jmc=;
 b=ApBqOiWBGvTPpo4t//Mab2knunpHyIOR0+MY+H2lkppdygePYvISkLRPfDXQsCCzqtCLrsuIaDOBeRm0iSwhrtBERl8qTt2nJ3R3YAIJ5Ipogy1Wb1yqAUo+WQpe72DI/06ga+opiPR0X9y+EaphG11NnFGY8nmz98KU0MOYe+PMY2OfMTCFVvmi3SlxBg/0tCpg7eXHaMbGeUWnqrQANvg+sPSjc9wcHc+zj5bBrThB1EO2y+D11aFhC+zDFzmuGiF+vwDmPr7rL07LBFKngK2t7BSEet3BiSARnMbxWUGvfZzykpT7fTG0AQhA5HY+3KxOVFlYntwoy2Hg+nET1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 CH3PR11MB7893.namprd11.prod.outlook.com (2603:10b6:610:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 15:31:36 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::94d6:d249:877b:756b]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::94d6:d249:877b:756b%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 15:31:36 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo cachelines
 manually
Thread-Topic: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
 cachelines manually
Thread-Index: AQHcXfAM3hIQJ/l3hkq8NE843rc37bUDflQAgAAFwMA=
Date: Tue, 25 Nov 2025 15:31:36 +0000
Message-ID: <DS7PR11MB6197137365666F3474A80D0881D1A@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20251125094335.12028-1-tejas.upadhyay@intel.com>
 <20251125094335.12028-2-tejas.upadhyay@intel.com>
 <e3b54213adab24d5620241ec9e701ced2c1f4f85.camel@linux.intel.com>
In-Reply-To: <e3b54213adab24d5620241ec9e701ced2c1f4f85.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|CH3PR11MB7893:EE_
x-ms-office365-filtering-correlation-id: aeef2367-284d-4cd8-df0c-08de2c37b8d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZnFuL3h0c29ZTVJLZFlmMVMrb2ZPV25Ia3ZoTGhRdG5TS2tFZlh2QkRtMHpW?=
 =?utf-8?B?TVF6emYzd3llZFd1UTZ6NDUzL3hnUGQrRDRONDkra0t2V2p6N2UvS3pKa3B6?=
 =?utf-8?B?aTllYW55ZXpPcGpFb3VhK0JvL1lmWjJJUW5VZXc4R0gxTHVIYkh1NTFETW9Z?=
 =?utf-8?B?elp6Y3FIWUVXWHdsMDB0dHEwa2hVUnZnaGwzZzVxS1hNUHNRQmRCTXRTYVJB?=
 =?utf-8?B?dTFZUm1iM3hNdFhSTXVib3M5T1dQdWxaTy8zdUpGVW1zOWJtSnZvTjRBS245?=
 =?utf-8?B?aXB5VnVRMXRpMFh0bHJkNEozR05DRFEzSks3WHo5QnB0Qy85dlJEK0NJcDNC?=
 =?utf-8?B?TU51RFZxWFJrcExnWUdzRUlSbExDdG5HbVcydUlVM29hYit6VUN5THJMZW00?=
 =?utf-8?B?Y29iTS92ekkxL3V5dldrRGZXTURyS1QrNWQ5bzJYZFBwZWtWMkNZVXFvZk93?=
 =?utf-8?B?STVBcURZTWd0dDdzNDdtQ296eGU2bjJrVURacGVxVUNRNWwwV0lDNGxwWWdU?=
 =?utf-8?B?OGQ1cUNqNGt1OEdmSkhFVU91K1BWRnhSWkpBdlNLZ2xuN1FEMFhLdmcvZFpB?=
 =?utf-8?B?dWNZd1JjbnhXNzl0UVNSWUhHVDhGUWRyMVI4OUI4bEpYYllZOGI0VWNZSEhJ?=
 =?utf-8?B?L1p2T3VwMTFXZW9uVWwvc1hBQURTTzllY2FMTm5VOXkrUUVmaW5yZzlWRnNw?=
 =?utf-8?B?clloQkNEd2ZwWlNVYnVDZ1BpQ3N4YzNPOWcvRTBISkorWFQrbFk1anNROXpO?=
 =?utf-8?B?d0ErckxpMFNDa0VqRkw4NXRzZ0JYVWhidkdGUUVnUEpqK0dNektsVmptRHVK?=
 =?utf-8?B?ZW5WWjduVEtoMm1aL1hWT043QUpOYm8rRVoyRENzMWlHWk5pZlIrbldaQ1lT?=
 =?utf-8?B?cjNwbjNkTDUxeXdDWHRQL3NsN1M5clEva281akFwOG9RczBCVTJkL2NhN2dt?=
 =?utf-8?B?NFRlWXVSNTFjNnZRSHlxcml5Y3h1bUxMbEdzY3ZiTzlrTlRacXlYS0IrRVZV?=
 =?utf-8?B?OGtWeGxPNjQ1QlFTYVJvNWR6TzJqNk9NelNoNUw2NTJ0alJXejh6L3Y2RXUw?=
 =?utf-8?B?OFRIcDg4VFMxZCtCQUt0Q1FzS1dvKzhLSjA2c1JNKzNMVWdHZVJQUkh2OVpk?=
 =?utf-8?B?d3dKdmQzMDBiaUpnNXI0cWFHQ1k0OFhLTTI5UEZ0RzJ6RjhkMzFoL0l6dmdE?=
 =?utf-8?B?dW1xcTkyS1ErQXc1dWM2YTQ5UmRZcllCMVhlVFd2QTRzMG1nV0dMTUU1bGpy?=
 =?utf-8?B?R3VkY0lZM1JxZXRGdllmUUJjNFE2dkFFSC9YZ3BETVpCMG1BRWsxOStUWVdU?=
 =?utf-8?B?UVduTm1mZVFzOU5yMzhwaVBxTWJvSXZtd2E3RVoxWEZ1YzlTTlRZUFRSWTVQ?=
 =?utf-8?B?WmZCMmt4Y2R4YnBQRUV4cGVtMHVHY1djRWcraTNhR0wzSUFNNDlxNlRBemJK?=
 =?utf-8?B?UnF5RU1VN3FkMExxVE1DRjV4R2gxSW5wQkVZZUxybnVKTC9BOG91QVpzM3Q2?=
 =?utf-8?B?SVFzTDQxQTArT0hta1BtRXJ5eU1ta3F3L3hRNTM3emFaSTB2MlhZVmFkREZV?=
 =?utf-8?B?VVUxNHY5UGw0OGdhU0FMZjNKcnZLTGJ0Y3h6elF0K2p4bEZaQ3FhRE5wNG0z?=
 =?utf-8?B?c2t2eXNhem5OL0srZU53enl5QnZ1ZkZ1ZlRnRVhmSTdPc3NGMVprZHduL0Fx?=
 =?utf-8?B?d0E1NlcyMzdWVUpSdzEyUm9ZYWY5bEhqMElqSHI0L0lmTmpBT1U5UCs4UUZq?=
 =?utf-8?B?Vkt2UllKUDRybE11eXVpb3FjRFkxdUZMV05lTGdTK1FSNW5IOHdDV3YxT0ox?=
 =?utf-8?B?eVNxdWJxUjZQcE1iRG9zb1hjMm9yOTk0dFFYQXdCY1RZVWRhZHEvM0UvMzFB?=
 =?utf-8?B?czh4akIvUXp4cGNiU0NqeTBKSFp2ZXFFZlEvaW0rQy8zMXlzbEJyRFF2cC9R?=
 =?utf-8?B?WUlmNmJvVndTczNucENTSmxVY3ZHRDBRVXBhUCt1QkpEYTFnSExJTXBYdmpV?=
 =?utf-8?B?RUh3WlBUbW51VjJBRElxR2JualhiWmhnSGI1Z2VJMFd1NXo0NVFOYVFVeG5H?=
 =?utf-8?Q?gskSU/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2hpbWRBKzYwTklmR3MvVEdEQnN0SEtPdmJwQkkwRUVXNWpiRW5KaDVvT09C?=
 =?utf-8?B?cVd2Y1JubUF3NU1KaDcwdTFlQmk4bDRERlZYcUVYZ1FHQXhBY2VBTkJNWkoz?=
 =?utf-8?B?ZDlzTFZrTDhtT0tzSjZvWFZJRjNzT2VPVkJNcnFsM1FNQ3ZYU0VlUGx5VFo2?=
 =?utf-8?B?TXJjcUJLVTR3Uzd4aVVaWTBkbmFvTjFiTnRVdmFMc2cxRXRYa0FTQ3dtUm9n?=
 =?utf-8?B?T2YrcnA4R0VwTGRFMVFGWG5iMzRBMjhqTUN6Mk1IOFJPYmhwL2p5dkJsU3Nh?=
 =?utf-8?B?QU5wb21GTi9iZTBVMG0rcWd0ajhOT3BUc3ZYWEJFUXdDcUk0NzBZaDVBNk1v?=
 =?utf-8?B?bXpNbGYraHp5dklEVkpuOG5saXByN001L3FLMTcrWlZ5MzBVeFlya21iYi9i?=
 =?utf-8?B?MkpzU2FjN1FVNDFrMEZad016Q0s4U3U1OUtHOFJHeklac3VHTlp4ZkliMVU3?=
 =?utf-8?B?ZVBNNTJBZDc4aTdoV1ZCRjVTbThHYS9VYW4rdnlUb3FoSld4RUZjQ2kyY2tR?=
 =?utf-8?B?RWk3dEVFS0VMVFZ0Q3MyaVp4a0pENlg5TkFVMjNlLzlJbHFWTjRzNlBHbGFn?=
 =?utf-8?B?eUNSb2lSWDJBckUybW5oZjVYQm1NTm1adkpkT2p4d09qdEczalJMV3hWL25K?=
 =?utf-8?B?UHYxTFlEUkczb1pSdlFUM2pmTG13WmcvSkp1SEpZN21wRzVYY0Q2Q0lwVllw?=
 =?utf-8?B?T1BweTB0Y041KzdMYXg2MkowNEFYN01HdVNTSTFNd1c1UXVSSy82SHRMenh3?=
 =?utf-8?B?eGpWSDhJWTg5RTZBOUlieWFCNit0WWhTQlllVDhjS2VRYUdsaVE0WG9ZY0RC?=
 =?utf-8?B?cGM4S0ZYZUsyUXF1R3phNzhKWkpHdVBrWm0vMHh5STZDMjBwdWQwOUpSZS8x?=
 =?utf-8?B?Y1dqK1Z6Qndsd1dNZlZ6c205dHpNTnRFcWpnaWpycmdYbU5wNlRxY3VQemVt?=
 =?utf-8?B?dElKeWdhWE14OGpUcHJ5V0F5emw0UWZYU2F2V0JPY3laMjgyTFc5cXU2YXY1?=
 =?utf-8?B?TzBreWo5NHR6RkFuV3E1MFVOSGZUaUxEc2tZR2d6NW9kaVVMMWlnd1JBd1hi?=
 =?utf-8?B?Sm1TQ2I4ajVJMzhrdGZsSnM4SnV3MHNhZCtONUVaMzduYW9HTG5zc2dFWEsr?=
 =?utf-8?B?eithcXN4di9KdWppVmd0TjdJOW80MXNBdnlLUGpxSW5IaTducmZPQVUxRzRT?=
 =?utf-8?B?bnNrUUhqYUVURkNDTDFXL2hxalNHM2lNbFBnVXQrRkxSdk1pYm1lTENMTTF6?=
 =?utf-8?B?T3BLR0Z6ckVTSTluMEtuWDBSMy82dzZiUzBiRUw1M3lHNTM2REFMS2laaGRk?=
 =?utf-8?B?UmR4ajZRNzlIbk9PdkIzNk1BNHlqZUczMVRYdUtXdGlkK0l5VEdES3R5Wi9M?=
 =?utf-8?B?STFHbXU0RUNscFRiZ3d1THhTQnlrSmZJa3BQMGJ1Qzk1S01TaWpTdXlOYXMv?=
 =?utf-8?B?cWk0N3d6Sm1yelVBUVZyTVB3V1ZqSVUzUThYUlZvWkIxaGVGbmxFNW1nS1B4?=
 =?utf-8?B?ZkVaTDYvRksrZm1YV0hncmFjQjMvbGtjNlNNUE5NdEJJWlU4aFF5WFRLYkJy?=
 =?utf-8?B?VDNBbUMrb3F5cHVWdVBHL0lKWWFvYU4yOVJmbkNjSm51UzJ2RmZZenA5Z1lF?=
 =?utf-8?B?WWNxVStvL01YQzA0RkZobkVBcnhhMXNEN3V3RmpDUTZRcjhsSGJEWFdEVVlp?=
 =?utf-8?B?K1VSYk9xS1pLNHNmRUxIY29LWFp0QUpvYTc3VjdDL2tuR1dwWEdVU2thaWJn?=
 =?utf-8?B?eXEzRUw4YnpnVVhzdHVzNTBMZGpyWmR3NUJnNHVZQ0VVczYxWlk2dDYxbmhY?=
 =?utf-8?B?WTFtVXNzVVNlWGx6WDQ2WWltU0NOa0hlQnVoL1VSQk5RT1Fma204MXZuSjh0?=
 =?utf-8?B?UCtIV3RLRjBsb2s0engybE1zR1BheVFpWFl2K3BCUmdEVUtBQVNGRGZsUlNx?=
 =?utf-8?B?NGlQWWVZdkZQQVY5K0MxNTBDYUsrQTJwcTUyTnJkTnkvU2RmQ0dpQXVERU94?=
 =?utf-8?B?SDZxMWlSN0llYlFJaWFUZFZXS0VuankxeFRHU1JnVmFvTDhvajhGY2dxZmls?=
 =?utf-8?B?aGw2SWxKdFUvaTE1RUlwZHJJcXdLRU5QZGgwRmFaeXMxdWg0NTBIbHZwUWZ0?=
 =?utf-8?Q?rKehPwdgl7rPEsnidPrnJG6Nm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeef2367-284d-4cd8-df0c-08de2c37b8d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 15:31:36.7955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bB3o5cNA8sR2fEzRQENzW+g7BN0be0z0x0tMAJeNHHiUqO2lBuLsb+UT8BXbpnbCX/hc8emszVPmuZ5+KjOWgWzYnaX0IU2KjSQ1ck/hPpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7893
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAyNSBOb3ZlbWJl
ciAyMDI1IDIwOjM3DQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVs
LmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEF1bGQsIE1h
dHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8z
XSBkcm0veGUveGUzcF9scGc6IGZsdXNoIHVzZXJwdHIvc2hyaW5rZXIgYm8NCj4gY2FjaGVsaW5l
cyBtYW51YWxseQ0KPiANCj4gSGkuDQo+IA0KPiANCj4gT24gVHVlLCAyMDI1LTExLTI1IGF0IDE1
OjEzICswNTMwLCBUZWphcyBVcGFkaHlheSB3cm90ZToNCj4gPiBTdGFydGluZyBOVkwsIEhXIHdp
bGwgZmx1c2ggY2FjaGVsaW5lcyBtYXJrZWQgd2l0aCBYQSBvbmx5IHdoZW4gbWVkaWENCj4gPiBp
cyBvZmYuIFdlIGhhdmUgZmV3IGNhc2VzIHdoZXJlIGtlcm5lbCB3aWxsIGhhdmUgbm9uLVhBIGNh
Y2hlbGluZXMNCj4gPiB3aGljaCBuZWVkcyBtYW51YWwgZmx1c2ggYXMgd2UgcG9zdHBvbmUgdGhl
IGludmFsaWRhdGlvbi4gRmx1c2ggYXNhcA0KPiA+IGZyb20gY29ycmVjdG5lc3MgUE9WIHRvIGVu
c3VyZSBub24gYWNjZWxlcmF0ZWQgQ1BVIGNvcHkgdG8gc3dhcC9zaG1lbQ0KPiA+IGZpbGUgd2ls
bCBzZWUgY29oZXJlbnQgdmlldyBvZiBtZW1vcnksIGJ1dCBhbHNvIGZyb20gc2VjdXJpdHkgUE9W
DQo+ID4gd2hlcmUgbGF0ZXIgZmx1c2ggY2FuJ3QgY29ycnVwdCB0aGUgbmV4dCB1c2VyIG9mIHRo
b3NlIHBhZ2VzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFz
LnVwYWRoeWF5QGludGVsLmNvbT4NCj4gDQo+IEkgaGFkIGEgbnVtYmVyIG9mIGNvbmNlcm5zIGxh
c3QgdGltZSB0aGlzIHBhdGNoIHdhcyBzZW50IHRvIHRoZSBsaXN0LCBub25lIG9mDQo+IHdoaWNo
IHNlZW1zIHRvIGhhdmUgYmVlbiBhZGRyZXNzZWQ/DQoNClNvcnJ5IGZvciBtaXNzaW5nIHRvIGFk
ZHJlc3MgeW91ciBjb21tZW50cy4NCg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvaW50
ZWwtDQo+IHhlL2QyNTE3ZDY2ZjU3MWUxMWE3NjBjYjE0Mzk4MWI3Y2EyMzhmNWNkNTguY2FtZWxA
bGludXguaW50ZWwuY29tLw0KPiANCj4gVGhlIG1haW4gY29uY2VybiBpcyB0aGF0IHRoZSBjb2Rl
IGluZGljYXRlcyB0aGF0IG5vdCBhbGwgR1BVIGNhY2hlcyBhcmUgZmx1c2hlZA0KPiB3aGVuIGFs
bCBmZW5jZXMgYXJlIHNpZ25hbGxlZCAoYm8gLyB1c2VycHRyIGlkbGUpPw0KDQpYZTNwIGlzIGlu
dHJvZHVjaW5nIGZlYXR1cmUgdGhhdCB3aGVuIG1lZGlhIGlzIG9mZiwgb25seSBYQSBtYXJrZWQg
Qk8gd2lsbCBiZSBmbHVzaGVkIG5vdCB3aG9sZSBjYWNoZS4gRnJvbSBVTUQgcGVyc3BlY3RpdmUg
d2UgbWlnaHQgaGF2ZSBub24tWEEgYnVmZmVycyBjcmVhdGVkIHdoaWNoIHdlIHdvdWxkIGxpa2Ug
dG8gZmx1c2ggYmVmb3JlIGJ1ZmZlci91c2VyIGdvZXMgYXdheSBkdXJpbmcgbWVkaWEgb2ZmLiAN
Cg0KVGVqYXMNCiANCj4gDQo+IFRoYW5rcywNCj4gVGhvbWFzDQo+IA0KPiANCj4gDQo+ID4gLS0t
DQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uY8KgwqDCoMKgwqAgfMKgIDMgKystDQo+
ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmPCoCB8IDIwICsrKysrKysrKysrKysr
KysrKysrDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmjCoCB8wqAgMSArDQo+
ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdXNlcnB0ci5jIHzCoCAzICsrLQ0KPiA+IMKgNCBm
aWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2JvLmMNCj4gPiBpbmRleCA0NjVjZjlmYzdjZTkuLjk3ZTFlOWQ0MGU5NiAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9iby5jDQo+ID4gQEAgLTY4OSw3ICs2ODksOCBAQCBzdGF0aWMgaW50IHhl
X2JvX3RyaWdnZXJfcmViaW5kKHN0cnVjdCB4ZV9kZXZpY2UNCj4gPiAqeGUsIHN0cnVjdCB4ZV9i
byAqYm8sDQo+ID4NCj4gPiDCoAkJaWYgKCF4ZV92bV9pbl9mYXVsdF9tb2RlKHZtKSkgew0KPiA+
IMKgCQkJZHJtX2dwdXZtX2JvX2V2aWN0KHZtX2JvLCB0cnVlKTsNCj4gPiAtCQkJY29udGludWU7
DQo+ID4gKwkJCWlmICgheGVfZGV2aWNlX25lZWRzX2NhY2hlX2ZsdXNoKHhlKSkNCj4gPiArCQkJ
CWNvbnRpbnVlOw0KPiA+IMKgCQl9DQo+ID4NCj4gPiDCoAkJaWYgKCFpZGxlKSB7DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZS5jIGluZGV4IDkyZjg4M2RkODg3Ny4uNmU4MzM1YjQ5M2U4DQo+
ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gQEAgLTEwNzksNiArMTA3
OSwyNiBAQCB2b2lkIHhlX2RldmljZV9sMl9mbHVzaChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4g
PiDCoAlzcGluX3VubG9jaygmZ3QtPmdsb2JhbF9pbnZsX2xvY2spOw0KPiA+IMKgfQ0KPiA+DQo+
ID4gKy8qKg0KPiA+ICsgKiB4ZV9kZXZpY2VfbmVlZHNfY2FjaGVfZmx1c2ggLSBXaGV0aGVyIHRo
ZSBjYWNoZSBuZWVkcyB0byBiZQ0KPiA+IGZsdXNoZWQNCj4gPiArICogQHhlOiBUaGUgZGV2aWNl
IHRvIGNoZWNrLg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm46IHRydWUgaWYgdGhlIGRldmljZSBu
ZWVkcyBjYWNoZSBmbHVzaCwgZmFsc2Ugb3RoZXJ3aXNlLg0KPiA+ICsgKi8NCj4gPiArYm9vbCB4
ZV9kZXZpY2VfbmVlZHNfY2FjaGVfZmx1c2goc3RydWN0IHhlX2RldmljZSAqeGUpIHsNCj4gPiAr
CS8qDQo+ID4gKwkgKiBTdGFydGluZyBOVkwsIEhXIHdpbGwgZmx1c2ggY2FjaGVsaW5lcyBtYXJr
ZWQgd2l0aCBYQQ0KPiA+IG9ubHkgd2hlbiBtZWRpYSBpcyBvZmYuIFdlIGhhdmUNCj4gPiArCSAq
IGZldyBjYXNlcyB3aGVyZSBrZXJuZWwgd2lsbCBoYXZlIG5vbi1YQSBjYWNoZWxpbmVzIHdoaWNo
DQo+ID4gbmVlZHMgbWFudWFsIGZsdXNoIGFuZCB0aGlzIGlzDQo+ID4gKwkgKiBvbmUgb2YgdGhl
bSBhcyB3ZSBwb3N0cG9uZSB0aGUgaW52YWxpZGF0aW9uLiBGbHVzaCBhc2FwDQo+ID4gZnJvbSBj
b3JyZWN0bmVzcyBQT1YgdG8gZW5zdXJlDQo+ID4gKwkgKiBub24gYWNjZWxlcmF0ZWQgQ1BVIGNv
cHkgdG8gc3dhcC9zaG1lbSBmaWxlIHdpbGwgc2VlDQo+ID4gY29oZXJlbnQgdmlldyBvZiBtZW1v
cnksIGJ1dCBhbHNvDQo+ID4gKwkgKiBmcm9tIHNlY3VyaXR5IFBPViB3aGVyZSBsYXRlciBmbHVz
aCBjYW4ndCBjb3JydXB0IHRoZQ0KPiA+IG5leHQgdXNlciBvZiB0aG9zZSBwYWdlcy4NCj4gPiAr
CSAqLw0KPiA+ICsJaWYgKEdSQVBISUNTX1ZFUih4ZSkgPj0gMzUgJiYgIUlTX0RHRlgoeGUpKQ0K
PiA+ICsJCXJldHVybiB0cnVlOw0KPiA+ICsJcmV0dXJuIGZhbHNlOw0KPiA+ICt9DQo+ID4gKw0K
PiA+IMKgLyoqDQo+ID4gwqAgKiB4ZV9kZXZpY2VfdGRfZmx1c2goKSAtIEZsdXNoIHRyYW5zaWVu
dCBMMyBjYWNoZSBlbnRyaWVzDQo+ID4gwqAgKiBAeGU6IFRoZSBkZXZpY2UNCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlLmggaW5kZXggMzJjYzYzMjNiN2Y2Li4xNWU2N2RiNDRiNTYNCj4gPiAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPiBAQCAtMTc5LDYgKzE3OSw3IEBA
IHZvaWQgeGVfZGV2aWNlX3NuYXBzaG90X3ByaW50KHN0cnVjdCB4ZV9kZXZpY2UNCj4gPiAqeGUs
IHN0cnVjdCBkcm1fcHJpbnRlciAqcCk7DQo+ID4gwqB1NjQgeGVfZGV2aWNlX2Nhbm9uaWNhbGl6
ZV9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQgYWRkcmVzcyk7DQo+ID4gwqB1NjQgeGVf
ZGV2aWNlX3VuY2Fub25pY2FsaXplX2FkZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBhZGRy
ZXNzKTsNCj4gPg0KPiA+ICtib29sIHhlX2RldmljZV9uZWVkc19jYWNoZV9mbHVzaChzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSk7DQo+ID4gwqB2b2lkIHhlX2RldmljZV90ZF9mbHVzaChzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSk7DQo+ID4gwqB2b2lkIHhlX2RldmljZV9sMl9mbHVzaChzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSk7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Vz
ZXJwdHIuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VzZXJwdHIuYyBpbmRleCAwZDkx
MzBiMTk1OGEuLmE5M2M3ZTg4N2NjYQ0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV91c2VycHRyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdXNl
cnB0ci5jDQo+ID4gQEAgLTExNCw3ICsxMTQsOCBAQCBzdGF0aWMgdm9pZCBfX3ZtYV91c2VycHRy
X2ludmFsaWRhdGUoc3RydWN0IHhlX3ZtDQo+ID4gKnZtLCBzdHJ1Y3QgeGVfdXNlcnB0cl92bWEg
KnV2DQo+ID4gwqAJCQkJwqDCoMKgIGZhbHNlLCBNQVhfU0NIRURVTEVfVElNRU9VVCk7DQo+ID4g
wqAJWEVfV0FSTl9PTihlcnIgPD0gMCk7DQo+ID4NCj4gPiAtCWlmICh4ZV92bV9pbl9mYXVsdF9t
b2RlKHZtKSAmJiB1c2VycHRyLT5pbml0aWFsX2JpbmQpIHsNCj4gPiArCWlmICgoeGVfdm1faW5f
ZmF1bHRfbW9kZSh2bSkgfHwNCj4gPiB4ZV9kZXZpY2VfbmVlZHNfY2FjaGVfZmx1c2godm0tPnhl
KSkgJiYNCj4gPiArCcKgwqDCoCB1c2VycHRyLT5pbml0aWFsX2JpbmQpIHsNCj4gPiDCoAkJZXJy
ID0geGVfdm1faW52YWxpZGF0ZV92bWEodm1hKTsNCj4gPiDCoAkJWEVfV0FSTl9PTihlcnIpOw0K
PiA+IMKgCX0NCg0K
