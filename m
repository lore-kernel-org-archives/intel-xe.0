Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD6BD12668
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41A610E68A;
	Tue,  2 Dec 2025 18:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqLxd2xs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BB210E68A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764700518; x=1796236518;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o+jxtipEjALXnmxwYAsDbwBbDEg79CLHv5xrXVNqaa0=;
 b=LqLxd2xsAB4TbXXfP5pccenWYZXt4E1fP/p8yIb2rhmg9OBA4w2n5p3c
 fSr20zLqtomMF/eBl3cSh72UDdjHa8VNSR06HnGui5FSBY3vLx82XB1Bf
 gw3IZssooz3G26NzZSI5nbEsrH3oyzBmn75e1hZCAVFYRHKRELUGq04MS
 hO7o5L+qGn2Q5AjN0jOHpkUAYalSN8ox9xZSnvRiHw0cL9Ns+hpXbzTVr
 nnUWne1vNSE2SUnqOInfO5eNyxVqbLe2jQc1M/k2R1/dTQ2bDZHk6FknC
 zklpgbGA98xYj9WFe4PqctFiKUXiC5/ZzIskh0ymljPMhNegSVFyIhKnU w==;
X-CSE-ConnectionGUID: vOf8fCQlTuW1/9huXCK1VA==
X-CSE-MsgGUID: ZKYkSNb7Tn6bUuUwmeHCMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78027417"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="78027417"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:35:17 -0800
X-CSE-ConnectionGUID: 8osPeRZNQ0u7aCYNxXDjsg==
X-CSE-MsgGUID: r5+G8EdsQTKBeGUYrtRW5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="225139607"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:35:18 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:35:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:35:16 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:35:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYDfiq8GijbxQ6F2B3Ncw5Kbe++0S5mMSj9cn39F4Ee7NF1VLy5Uu2SH3BuxHjvKW8o9SOzyfvYB7d61Bcfrxnf0hIcMb4LZWNFK/Ict6DE7mg45kzboAWrX2RBup1YbDTxrZgNVUe9pqACPAPPv5gJJ28fAX3N63tByIReD+u0RKrDn7P7ByyitJfGzOTNTBF1bEtBMBrk2c8CB5u5mbWSio4VEtWHxMG2SfugdlMuV3hOVJCa0OTuGTAdz3zRMvIgZnDwLwzzHkYfDYQaKeiVdlaAHPsjaYLxSHZEcD0/y+R3PsoeplrAk0/bOKvFFjz4mgwf42AeLpXTSTfBzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gh0gnWHIiqyhPgOSr5DNL4slNlgstMIO68CE9aFAEWU=;
 b=Ph2K+QxYGCe/t6q9uMY9a3liYUOdfZ/e1aFQrFoAHuYKkQjD0jM3Hl/FaGDbesPiUNQGCj6wXF4u35niHYVDJlxjKQJ4kMKb8XxIWWiVxJa8VXcfQLJ4eI2mgSukTdBWCcrhC/MH24iVXTrXOkBbdlIuFJISkyacV5yWBdNn5efAFqPSW59rnFr4oFtzF6bZT1YstFF1TJ7SbeH1ViqMehZYuWYMRJFWpb1s+eBUKXvpRaq+TdH9CFlD9GrfYXBJz7/uVqQy9a83uYFGwYWgC65FbZVVL32s8Qa28xd3Ry6m048Rivd/vKxAbd/2/i9CVu/uS6idrzAE6XmsdBOA2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8474.namprd11.prod.outlook.com (2603:10b6:806:3ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 18:35:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 18:35:14 +0000
Date: Tue, 2 Dec 2025 10:35:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 3/9] drm/xe/bo: Prevent purging of shared buffer objects
Message-ID: <aS8xX70o8DSYs7eM@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-4-arvind.yadav@intel.com>
 <aS4geyZDuwlcyc9R@lstrano-desk.jf.intel.com>
 <6c3ed737-3dd5-49ca-a78e-593d8e187220@intel.com>
 <d5fd4f75e084f4e8d0e3eb7e542d8988fab87449.camel@linux.intel.com>
 <aS8C/lCla/NdL43q@lstrano-desk.jf.intel.com>
 <bc69e7ef-a8de-4aed-b271-c97e3f39b323@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc69e7ef-a8de-4aed-b271-c97e3f39b323@intel.com>
X-ClientProxiedBy: MW4PR04CA0254.namprd04.prod.outlook.com
 (2603:10b6:303:88::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bae845-b5c2-4428-7ca3-08de31d188a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZldUVlR1SVRvNTZZaWh0Vzh5eFFsaWdWZ250MzdsdElXdXp1eFFveFd2bkh4?=
 =?utf-8?B?U0srWGFFa0VsRktBbjJUZ1hxSzQvc3YyWmY2SlV5Nkp6bDh6aDE3bVkzR0xF?=
 =?utf-8?B?Y3NMZ2d4Q2lKNkFtREhWRE5rMC9UMDRZSFhnUS9RVFh5R2JkRlFyWElYNmUz?=
 =?utf-8?B?bXlwK1NMZGtxUUtmNlZZVlMvRnoxY3pIdUNGcE9lQWEycXhtcklraHZjbHdS?=
 =?utf-8?B?czRnaWw1bjk4MmJ3Zm9ZK0tTTEVvcVNucVM4QkZMdWl0aFZPQ3VjQllpWngy?=
 =?utf-8?B?Q3ZKM2R6T1oyaXdEREZ1NVFOcHdtWmNYSVVaZ0JRMms4UkZzOXgxU0ZOQWRP?=
 =?utf-8?B?ZDlybitsL2U1b2VrMDlvVTBncjlrUlU0MjhuajdkQzN5anpFcmI4bjZDK216?=
 =?utf-8?B?VG1ib2dTMWk4UEtSNkd3ZGZsamlaRENuV1UwWHkyVUFvTWNHQkF5Y21wNE9k?=
 =?utf-8?B?YXIyNWIzRHM5QjBib1NrRkNSWXJoT0Q1WHkvSnMxd0VJbjFmMmdNcjRKWWN5?=
 =?utf-8?B?ZVlidDJoQVR3S2JhRTdVTWQ4QzBvQzZ2bU9DcDlyUG1UNWNZaHovOC9YU0hn?=
 =?utf-8?B?bzVjSjRFdW9KbHZBcXZISnIxOXhKME9BbldvMnIyRStmOGZmSlpZQVpkaG84?=
 =?utf-8?B?NXR0WFJybUw4Ykk5Z2trMnFTUXE0ck1MSUY2bWRJNnJpbzc0OHJKQ3RjMVM2?=
 =?utf-8?B?d0xxVXhrTVNKZjd1bjd0ZHRrSk1wWERIKy9ZVG1FYjIrcHREY2t4NnlFMjdu?=
 =?utf-8?B?KzVsS2ZmS20xZC9TMmlROXo2Sks3aWZ0N2pYOGdMVC8yNDVtMGZvQ3lFL0dx?=
 =?utf-8?B?WHlJcWoweHl2dEVzelNEYlJqVUlGNDkvMTFCMjVlNThMVkJTUll4S0pYYVB0?=
 =?utf-8?B?YUZqRysrOXQ3dTgrZmZzOXVjdUtHclREenlUQ1ZZZlpJcmwwSk1rc3JMRmc4?=
 =?utf-8?B?NHR4K0Eyc01CMUpGZ0tnVmZrVnQvY3oraVR1bzhqOE8xYWpNSU05OXNUY1kr?=
 =?utf-8?B?Wm9aOE8rOWxRWFlYVGxKMTNlbWszSnpmdXdQM2R3b1hrWWJzU3pWekRob1RN?=
 =?utf-8?B?Ny9JQitRa2g5Wk9BckVnNUtGL3RYTmZIcFg5MFR2RW5jaytmUTZRd2N5a0Qr?=
 =?utf-8?B?RDdZSzBFaFJEVS9vZm5OMytZR29pL3BWK1htdE5oOCtla1N0V3U4RUZrb1dq?=
 =?utf-8?B?aXJ0bDRjNnBhU3U5V3k4Z1RNMVI5SERjRHBUZFRKeStxMk1zN0NCTlN3TURi?=
 =?utf-8?B?bFV5N0ozMTRHT1ZxS2ZHRVdqVGVpdU5JZWtCelB1YzJ4N1hwcWpxb2JWKyt1?=
 =?utf-8?B?MWsrcldzeXdUaEE5Y2JuclFtUUJ6UmFRQk55RzYvYUdkUXdGZ0hUZ09PODRZ?=
 =?utf-8?B?L0dsM2RacEtPZ0t4ZTJGNUdlOHRjR29qVC82eldLZEJRajhQYktzQ0pDekYr?=
 =?utf-8?B?d3dnRlVPWWdaR0dwUzdBUXVnek5CRWtMYkl2MCtxNTlJWkpkclBnZmRlR3dn?=
 =?utf-8?B?djJTWGM3ZVRFZUdkQ2ZuY3RoY1Z6clF3czZ1Z3JXc0hTS0NRdkRtOHRWcUZU?=
 =?utf-8?B?Z3VIOFluQkpXOHNCd0Jpd2h5MExYQ1ZibGxXZS8xOUw1R3hSZG1IM1JXQTRE?=
 =?utf-8?B?UjRwTzlyYUNsZFowTjB2OXFQd2ZZNXdmU3JHR284cUtxRHYwQWkwbnB2MmZG?=
 =?utf-8?B?QUZVQU1odFdYNWNIQzIxTEZQYkx0YU9sWnlNN2w3WXRwVVRnT3QzTTFNRlVC?=
 =?utf-8?B?ekFBdnFsSGFJWFhHRWYxNGgvZXkwQTVLQmZEZng2bzNPeng4MVBIRmVXRmFW?=
 =?utf-8?B?SENSalFBRjNXM2RqZEZxTXJqaHVRdjdyVEUzYnd4Z1hUcklWaG00dHBUWGx4?=
 =?utf-8?B?cFBJOVhnakRiS3NhUGRZME5TdWZQbWdTM25hMDlsdjQ1K1VCYTJON1FzSHFj?=
 =?utf-8?Q?YtI6mkandYBT4j9Zs3S5PMsuAbjJmXpP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDFScGRoNE9iOElmWWVMWDZmdVRCUW1Ia3dVdEVCSU1QWWhzS1pGVEUzcTJZ?=
 =?utf-8?B?Kzg5Y1FZTmxxY01jOVE1OGdSeDJJRGNnTXhVdmEraVBvNXcrdHdZS05oODRs?=
 =?utf-8?B?YXRlKzFjakM2L0MvUGdXRDlkbnFodE5XeUxCOTFudmE1UDdnTGl1a3p0aFp4?=
 =?utf-8?B?cm43M3RoL0szV1J6ZCtsWURWc2RXa0FIaWJWR0hJZi82d3VMR0VJSEVVWSth?=
 =?utf-8?B?QzcwVWd6L0U3VVZUeFowbENWYmNqaks0UWxsblJzTUhIL242ZjFjYyt4Q0xq?=
 =?utf-8?B?cUtEWjJoY0IwUENCMksxRTluZGNGanQ2RkpkcytsVWpQbTZxSlRSSFc3MjAr?=
 =?utf-8?B?ZlIrYjM1Y0dDNTNYbWdpVkhmR0h6a2l1RE1vNkl4WittZnlpY255NnJ4amVS?=
 =?utf-8?B?NWdCOVhSWjBsM0NYQUYwcGtxQWZBN2hTZzZNcVVaUDBTbE85RXVNdWY2UFR1?=
 =?utf-8?B?TXVJcVZZZUxSZitpVXkvSlFmdDUybWQ3dGxKYmxLOXZKRjJLdnIyZjI3SDhv?=
 =?utf-8?B?VWhlMi9FKy9haEtlU29SWUJQNXgrWnpEQ2NhbWppVFZFTTZZOEQyWjF5aVE1?=
 =?utf-8?B?N3RCSEVRZUx1NkNIQ2k5dEI0cE54Mjd0cEgvVmhKbENFTVpTV0JWV1FuVGZt?=
 =?utf-8?B?T2pMa0tCRGZUbFpZYkFWbnRmbG5wRUQ0VGxhcXlZUENabmY3a0xLZHRtQTBM?=
 =?utf-8?B?cisxNTVGZDBsS3JTL0R4MTVEOVpMOTgyR0wvN1R0OEFFZ2VwYTNrSW11TXMw?=
 =?utf-8?B?eU5aRlg1cFk0c2dYVTMyaDBVaHUxVG1JNE9NT2FjdXBzTXUvZWdGSGl4UTB5?=
 =?utf-8?B?ZncvZ0trTWg4dFVKbGwyK2N5ZHY3TXlyTytteTNkazl1Q0o3MFQwNWZseVRK?=
 =?utf-8?B?aDQwd1puU1d0NE9GQ3pYbGRaK1UzNmN6WXpYd1g5ckthN2xlNW9UMzhvSlBS?=
 =?utf-8?B?dWNaS2ljOURuVmZuVFVCend4cEFYOE03d2hKQ29kaFhSRmJZQlVUK2hUYjNI?=
 =?utf-8?B?OENtQnFwY2ZRWGFGTTNNTERidklTUHFWWnlzTFFETnRoZElBQXFTeTFEYzM4?=
 =?utf-8?B?SkNaQmRwKzZSSENqMGw0VlNaL1JhOVM1RnVGL3ZZNkFhU1ZiY3dpUVJwZVlq?=
 =?utf-8?B?Z2U4Q0ZZMDBOMnpYOE1QS3hJaXpsa1dqb0RTMndjdWVZWVFkYVlmUXVhaVBM?=
 =?utf-8?B?OFlHbWR6cGpldENaRC9WRlhXNUJRQUVhMktDS2NkTFhMcUNTSThCRk8wRnFh?=
 =?utf-8?B?NWV6OVh2NUNMSnhJNWtiRFVHWVhwMXhodzViQWZlczl3Q3ZCR3RYU29NTWFz?=
 =?utf-8?B?TmtPZjNjaHVPcXVKaVJRTUJ3YnRjUERMbldHUUFSRExObWh2OWJ3eWQ1TWE1?=
 =?utf-8?B?NW5MN2h1cnJGZUswVUF5Zkg0SktDNUUrRXZQTjFRMTNZd3dsMUxvclJWc2ow?=
 =?utf-8?B?dTR5dEJ4bXRSckNYV2NIWXViL0dXRlRKcnZkbHN5cGJEalc1ZDhKR0dzcWVw?=
 =?utf-8?B?VUdwRmtLN0FJZzlPN2gzTWhiaDN2TG9VUGs0dTJTMmZNNnBnUGUwTElEdkdx?=
 =?utf-8?B?YzRxZWl6Rys5TlBRSVdoMm5SMEJIcTJqa3FjZ3oveTlldU5WR0ZqOXVlNHJn?=
 =?utf-8?B?WDhJajdDcnBYdWljOEF4Qlk5YzdjTDVvQkFxNGdISTlkY21JbE1vNG1qUmgv?=
 =?utf-8?B?czRETHYrM3dSUU5SbXlqTWhWVVI3Y1cwYlpxc1JuVmJ1RlRxeEg5VHNxeldY?=
 =?utf-8?B?T2s3Qk0vZlUwVmlvd293WEh0alk1SnhIa0xpTFhVMUFDWElyb1JkT3ppMEor?=
 =?utf-8?B?d2dyckI1cHZGZjFqRWl1a3VYWVlvUVNrS08yZlJCTFJPdlp6Z0dibHlsV1Bl?=
 =?utf-8?B?dS83VEQ1TG5zNGJwUktvUUlhWDdkOG1rVVllakhqa0prY0k0ZGhWL2E2cE1i?=
 =?utf-8?B?cEFTbWd1NkZRVXJLR1JOR3F4SGUycjFIS2ZaOWNSVXN3OGdydXNlWmZpQjlh?=
 =?utf-8?B?Y29Zb0wvdXNtd3I3MHQ3NzdEeFcxYU5qVkZLM3lvUHhKR0wwRlRWcnZuYU1L?=
 =?utf-8?B?M0M2RzVsRU43bWdnZHA0cVBTN1NXeS9veTlWUW9XcFFGMkpkVlBPV1ptVGhB?=
 =?utf-8?B?MksxeWdwcW85MHM5M3IyckMyTWM1TTROSWxBK2RJL2hZOFVWQVZTZ203emV1?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bae845-b5c2-4428-7ca3-08de31d188a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:35:14.5071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sji3FPNbrSkWo4CKuGOTaLBJWidFhWjWsN8AjOU4BtAA6hcsxYx1rOwfKFMdZcMhbzmyRO0dMODjoTo9hWdsIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8474
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

On Tue, Dec 02, 2025 at 11:52:13PM +0530, Yadav, Arvind wrote:
> 
> On 02-12-2025 20:47, Matthew Brost wrote:
> > On Tue, Dec 02, 2025 at 10:42:07AM +0100, Thomas Hellström wrote:
> > > On Tue, 2025-12-02 at 09:12 +0530, Yadav, Arvind wrote:
> > > > On 02-12-2025 04:40, Matthew Brost wrote:
> > > > > On Mon, Dec 01, 2025 at 11:20:13AM +0530, Arvind Yadav wrote:
> > > > > > Introduce the `xe_bo_is_shared_locked()` inline helper to
> > > > > > determine if a
> > > > > > buffer object is shared across multiple clients or drivers. A
> > > > > > buffer is
> > > > > > considered shared if it is exported via dma-buf, imported, or has
> > > > > > a
> > > > > > handle count greater than one.
> > > > > > 
> > > > > > This check is critical for safely implementing purgeable memory.
> > > > > > Purging
> > > > > > a buffer that is shared would lead to data corruption for other
> > > > > > clients
> > > > > > that still hold a reference to it.
> > > > > > 
> > > > > > The kernel cannot safely determine when all clients are done with
> > > > > > a
> > > > > > shared buffer, so shared BOs must never be marked DONTNEED or
> > > > > > purged.
> > > > > > 
> > > > > > The new helper is used in two key locations:
> > > > > > 1.  In `xe_vm_madvise_purgeable_bo()`, to prevent userspace from
> > > > > >       successfully marking a shared buffer as `DONTNEED`. This is
> > > > > > the
> > > > > >       primary safeguard against incorrect usage.
> > > > > > 
> > > > > > 2.  In `xe_bo_move()`, as a final safety check before the kernel
> > > > > >       initiates a purge during eviction. This ensures that even if
> > > > > > a
> > > > > >       shared buffer were somehow marked `DONTNEED`, it would not
> > > > > > be
> > > > > >       purged.
> > > > > > 
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_bo.h | 30 ++++++++++++++++++++++++++++++
> > > > > >    1 file changed, 30 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > > > > > b/drivers/gpu/drm/xe/xe_bo.h
> > > > > > index b0a31c77e612..97edb38bf1ed 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > > > > @@ -478,4 +478,34 @@ static inline bool xe_bo_is_mem_type(struct
> > > > > > xe_bo *bo, u32 mem_type)
> > > > > >    	xe_bo_assert_held(bo);
> > > > > >    	return bo->ttm.resource->mem_type == mem_type;
> > > > > >    }
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_bo_is_shared_locked - Check if a buffer object is shared
> > > > > > + * @bo: The buffer object to check
> > > > > > + *
> > > > > > + * Determines if a buffer object is considered shared, which
> > > > > > includes:
> > > > > > + * - Exported via dma-buf (obj->dma_buf is set)
> > > > > > + * - Imported from another driver (obj->import_attach is set)
> > > > > > + * - Referenced by multiple clients (handle_count > 1)
> > > > > > + *
> > > > > > + * This check is used to prevent data loss on shared content by
> > > > > > avoiding
> > > > > > + * certain operations like purging on buffers that other
> > > > > > processes or
> > > > > > + * drivers might still be using.
> > > > > > + *
> > > > > > + * Return: true if the buffer object is shared, false otherwise.
> > > > > > + */
> > > > > > +static inline bool xe_bo_is_shared_locked(const struct xe_bo
> > > > > > *bo)
> > > > > > +{
> > > > > > +	const struct drm_gem_object *obj = &bo->ttm.base;
> > > > > > +
> > > > > It seems like everything below here should be a new drm gem helper.
> > > > There is a DRM helper 'drm_gem_object_is_shared_for_memory_stats()',
> > > > but
> > > > it's
> > > > specifically scoped for fdinfo memory accounting and doesn't check
> > > > import_attach.
> > > > > > +	dma_resv_assert_held(obj->resv);
> > > > > > +
> > > > > > +	if (obj->dma_buf || obj->import_attach)
> > > > > > +		return true;
> > > > > > +
> > > > > > +	if (obj->handle_count > 1)
> > > > > So this covers the case when we prime fd to handle but we resolve
> > > > > to a
> > > > > BO (i.e., we don't do a dma-buf attach, rather just take reference
> > > > > on BO
> > > > > as the BO is from the same device)? I just want to make sure I'm
> > > > > understanding this part correctly. If so, maybe throw a comment in
> > > > > here
> > > > > or update the functions kernel doc a bit with a better
> > > > > explaination.
> > > > Yes, that's correct! The handle_count > 1 check covers exactly that
> > > > scenario:
> > > > When we do prime fd-to-handle but both processes are using the same
> > > > xe
> > > > device,
> > > > we don't do a dma-buf attach. Instead, we just increment the
> > > > reference
> > > > count
> > > > and handle_count on the same xe_bo.
> > > > I will add and update the function with comments.
> > > Arvind, Matt
> > > 
> > > I think the correct way to check purgability support for shared buffers
> > > is to loop over all vmas attached to the bo and check that they all say
> > > WONTNEED? If they don't, the bo is not purgeable. This will also need a
> > > check at VMA unbinding.
> > > 
> > I think this makes sense. I haven't fully gotten through this series
> > yet, but will consider this during the code reviews. I probably should
> > apply this series in full before providing feedback.
> 
> Thomas, Matt
> 
> Agreed. I will reworked the purgeability logic exactly as you suggested.
> Instead of relying on a “shared BO” helper, the driver now keeps a per-VMA
> purgeable_state,
> and a BO becomes DONTNEED only when all VMAs attached to it report DONTNEED.
> 

+1, let me get through the rest of the series today and see if I spot
anything low hanging that should be fixed in the next rev.

Matt

> ~Arvind
> 
> > Matt
> > 
> > > /Thomas
> > > 
> > > 
> > > 
> > > 
> > > 
> > > 
> > > > ~Arvind
> > > > > Matt
> > > > > 
> > > > > > +		return true;
> > > > > > +
> > > > > > +	return false;
> > > > > > +}
> > > > > >    #endif
> > > > > > -- 
> > > > > > 2.43.0
> > > > > > 
