Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845A3C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 16:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B4D10E041;
	Fri, 13 Jun 2025 16:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SizrWpYJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E88D10E041
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 16:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749830925; x=1781366925;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SF4OP9Uwpvcvd1XqPwwXCuGgTXMfNh+nosU96EjUpfI=;
 b=SizrWpYJHvm7iU1jOVBnR5OhPPmVpaPweteD/ekD1EJu8cC9X42Mv9Ag
 zNpsEA79ek5yn1H/7hMUO2M6lcIfDRWt25u2aZkP92iAme0l3x5yewGRl
 lPnUngdl0RDkNLQt3IIngZInaRGQu/AZfm16j46Im2iA2ilcUmnDNrcch
 D55fwQb8vjbhcdiAqb4CAvqJaPp3GrvI44wmGeL/N7PzqmGhOSAyto7D5
 MyIkrl+ejoAjjaYTVrVzCh+qHefhU+Qac7MGW0rHWmgL4FkWeZQNAQYsL
 Alb7+WHcmc4aN/OETi5gx3+rV4wZ0SYgPQX8ppiNO15lPC4M3tlHPgiZq g==;
X-CSE-ConnectionGUID: WmmBqVWTQZOnVYNqsOQPJA==
X-CSE-MsgGUID: fd9pgsszSLCcbjQgxcY9Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="77443178"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="77443178"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:08:45 -0700
X-CSE-ConnectionGUID: IHVWlYf2SEmTPy/+cO6+Sg==
X-CSE-MsgGUID: wruG27JjQTmrIftZUXivDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="152755401"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:08:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:08:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 09:08:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfsY2HRPLJZ1iS79Rzxn3MRL7tQ5Yloq11qf6lfv2UlQy7UxgFlttmTg8V/0AayOCHP7O5/lq2IqAjP9pJZw/uS92wTo41nKMsXQyoeju92X5BQJUXaOczmIc+QXdiYYTonamjr03YrYpUiQ+a1mr752ELht3Asr9jSBryhlGU+H9MNl/nb/vE9qqJ9ZcAN7k2xx032J4MK8Ahx7A7UEdTKcnPWDE8mb1jZKJWKh+J/aJkgIuxOCeTaXQMFzSQBdGdQbDE2d8Dd4OS496PcjKL//2TksHi6Peoah1gqjUJqre8heyOsFEEfubTXqyZNNcz3HGuXbJ0I5egigOg7/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6q5iz5PGBID4fZE+sgNK6rIyl3zVKoBE6DvXbxIwpuo=;
 b=ph46evSu6YuY4qNp2VxQ4ChCIIzXOp2+pJXQUZj3ssWOhWxNi4bZqvZD4lA27Dgf0h1vOn+rma5BLrSJDcSC1U4KVRc4wJSXAN/+m+0GFLB0797Nu5B5kkW9IHw2lGt3G9StuJBE+GB1Rpc4LtDL3qFREE73WGujK465oOdiZZYeLzZLpw44iZ1PuMjYbCNCcAsT8t5L9KLMAy9lj9Ct17WpvTljSm9KelcmZ7qbvx+PJo+BlBAiqPHizqL+YvRguWQbf0P+9KBmsnP1RzvdgHDDcZyRDVH3JFejD1ee+nkFe3ozv3iEW9ZkGyl+D0gCAn5hCMNGAhO3b++ygbeeZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4736.namprd11.prod.outlook.com (2603:10b6:806:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 16:07:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 16:07:50 +0000
Date: Fri, 13 Jun 2025 09:09:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Use TLB innvalidation context for invalidations
 issued from bind queues
Message-ID: <aExNNmqE8eoem00O@lstrano-desk.jf.intel.com>
References: <20250612214041.235258-1-matthew.brost@intel.com>
 <8beb96d239da664ecb2289ec6ae4369fd6c92685.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8beb96d239da664ecb2289ec6ae4369fd6c92685.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:303:b8::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4736:EE_
X-MS-Office365-Filtering-Correlation-Id: 489429ed-2a3f-4a32-166e-08ddaa947242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUh3L3dRcGNiYjBraEp5RW8vSVhjKzZOV2QzSUgwZEFyZytFSFNpanBRRVh4?=
 =?utf-8?B?YjJlbWhlSW15dzRLQ0s5SFlzK3VSeW5rcmNjQ0NJSUVhcUxqRHIrTTdnT0F3?=
 =?utf-8?B?Zzhidkx0WXUzWjYyVjdYTHJDRXRUSENKLzFjREQ2RkdtOWtlREZndkVZdWx6?=
 =?utf-8?B?WGV2WnB6UXB0MEhXWjY4QU5LRm5nVWVkdFpBdDBBam9xVmV5Wk1HYi9oM0I4?=
 =?utf-8?B?aVkweWl2R3JXZFk1UTFzcHBHTzhjdmtQS21TM2d3QWpaMndmcldlQ0svQ1pl?=
 =?utf-8?B?WDVVSUVWKzRTR0NJREpZa2N2UVFXdEpZYUh2ejhNdFo3Zm9xYXM2a3BXaVlI?=
 =?utf-8?B?bGV2V05ZRGVwTkYzdllFdllOOGY4azlqeWdvbENnWGxXTEJyK1dHbXRmSHYz?=
 =?utf-8?B?YjQ4bUZqQWxuaVFwS1c0YkZCT3lkdTZuaU4xM1doVWNRQkVyaDdaQk9pZzZ5?=
 =?utf-8?B?aFd0VzVEZkEzc0NWblhTOEpLc0dONVlNQnNNTkVwamNVVTd1eW1CaG02YmtM?=
 =?utf-8?B?dTRNREs1RFU3YzB2bXBhMjkrZEJ3Zmx2cjZnS3psK1ZYdnROQW0zNVc0SzNY?=
 =?utf-8?B?NEp1TFVsOHN6S2hsRlQwZkp6dktxR2NJS2huVUZvck1oOU1yQ2lyZjFtaFRn?=
 =?utf-8?B?dEhrajZnY1JubGg5Tm5HRUg5Q2JhSDVIZ01jQTd6UDBLUkdmTFZVK3ZFY0tQ?=
 =?utf-8?B?WCtzZGVJTm5vZHE0Tk9OdmZ0NzJ0Si9EYlFNM3hFeFBCWXBZL28vUjV1U0Fx?=
 =?utf-8?B?K2tJMXhEY0ZTZCtkT0VYUTNhajU4NmJVRS9sd2ZlYkJHempPMGJCSkNINUZ6?=
 =?utf-8?B?YXd0T0x2TFVGbzUxU0FXZzJ4OHRUVjFwWlpHZWg5aTV2RkZQbjB1a0FBaEVm?=
 =?utf-8?B?OExZS3BsL3lSRCs3TXZJU1FSSlJUMm5LT2cza2RMd042dHpCanlmOGd6Vit3?=
 =?utf-8?B?amZkVit1SGI4czh1WXlTcUxjUUwzOTlmN1VoWERTenZJcGNJZjJUNWZyOE5n?=
 =?utf-8?B?eXZmRzNqdzV3SkR4cll3ZnJHUUQyazhiR0FPSUcyNERqd0JsMUZaZzlDcWxD?=
 =?utf-8?B?cmRRRm9uQWhmSTNaYjI0N3hzc0lhRlV1VWNFNVAyZ0UvMktsTy8yaVdacGFs?=
 =?utf-8?B?YXNHcHJpZmZZMFFmamV2SjhVdWJxMjdlZ3ZCeitDNEJWOXFPa3FTUWJmaUda?=
 =?utf-8?B?Uk12ZmR5ei83VnBGSnpDVmNZa1BGOU4rV01rQ1NiT09IMUVyY01IZTZva0lt?=
 =?utf-8?B?OGNuVkwybE9EaWpDd2taOVlqSEVaOXFCejViVWVmRzYwNGV6WWo3akplZGxI?=
 =?utf-8?B?L29vUW02aytSQ2t1bkFscFVXS3V3K1huUitLM2lTS2UxM2FHakw4elU4ZThi?=
 =?utf-8?B?SG83cnRLYTlGeFl5VitQR285WDA0S1FuNjBrblZRUUNGeFVtUzlSWXJiVGxK?=
 =?utf-8?B?RXN4aHFROHlTbFRQME5rQkdNbkRUc2E4TXc3azJ4ckFKNXBNQU9CZzBhVGRO?=
 =?utf-8?B?SWVDZFF1Z2dXQXh1MHQ3TGxqL0NYdXBJd2wwd28wSVJFOW5ZWnpYWkpFRmJW?=
 =?utf-8?B?em83WUZmMHpEZDBRdjhER0tRdU8xeGlnRmpvUVRDZkVSTFNDOEN3TGc0WmZS?=
 =?utf-8?B?MlEycFpGSWZlcmpCVmU4WXoyQVRPcWZUL0syc1k4a0U2V3Irc09xYXorYk5j?=
 =?utf-8?B?R0dqdW9oTWxaellaek5RZjhVWWp3MjJ0K0JmUHZnanV0M3UvMHlZd1NjOUZr?=
 =?utf-8?B?ZVRlNkpyQWdGKzA4a00yNStHWXgyOEt2TjdaZ0huS05UajhuMDBWR1NpN2J5?=
 =?utf-8?B?Y0F3SXVNVWw5QU9rc0R2ekZwemYvSzQvbE5SK3JvRlFGOXluU2loVXRWTjY2?=
 =?utf-8?B?U2xCU0ZrbFZ3bE51eW04Z2c3UURoc2Y3QVI4eU5JTnZscnU5Yk5GSis0ZGJz?=
 =?utf-8?Q?RuDkHbkEFvQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFBESDFNSjRucUFVcHR4endiVUt6OS9VeVJlWVNSQzlWTFl4UHk2aFlLdlZo?=
 =?utf-8?B?RExUcnUxSVZxdUZGNWtKd3dvNzMwblErcGlaenRGd2FTSUI5bjRjTWs5QnIx?=
 =?utf-8?B?WUFhcW9IUXppemlHbHhLamM4a205cFZEKzhxQ3cxaUF0NVB3eXRFUFY4U1Bp?=
 =?utf-8?B?UGV1dTkwNWdhbit5ODQ0elhiUGRCSkx4RE1zSnl4UXY2L0tYY0lGSUg3aEdm?=
 =?utf-8?B?Zzl4NTlteGMwaTFjNE13ODB5bVlkaG1CaFZIRHh6eWZmc29ZWmFmdy83NUM5?=
 =?utf-8?B?U0xveWVpMmpjbWU2NmpPaU5BZzVqY0NPeEhKWHB3aGM3TVJZbUZHTFUva2Jj?=
 =?utf-8?B?VTJoYW1qaFp6c3haWnZLV2FLNEZMMUErVVRJVEl5UGt2T0tEMXQ4WjF1VGRI?=
 =?utf-8?B?K0NUd0E5ZWlZRWYveEdnem55RmlKcFhEaklHODhCYXJnR0ZRNTBPYnlMRjRa?=
 =?utf-8?B?ZTBwTGRqS056VVFGcmJtRDFJeWpremhrRklxZTlQdnpvdXVJRk9UVytUZm9z?=
 =?utf-8?B?eHlNVUtLQVJyRkV2aUM1UTJ6SzVjd2N5aVRBM2oxTEczSmNNK3psS2ZVYUVo?=
 =?utf-8?B?dXROaEoyMThHb2ZueUVEcTRNczB3UTVJcms2d3NjZ3p1ZVF0YjdwcjRiOXB2?=
 =?utf-8?B?MG9sa3hJbitNcUdLamdPd3Z1aXpJMlF2cTRGTjNGbTZXMEhLOGhpTFJnMGZz?=
 =?utf-8?B?SVFFb09LQlhiak5NZW8zWlNCaHU0TVcvdlZUM1hhbkQxb2xmUkFHVFJrR1Zk?=
 =?utf-8?B?bjkwbURHSk9NR0VCVGtTeUt0aHNLbmlEMHVjSDM5SWZnTFUwYi84Ulk0STJr?=
 =?utf-8?B?c2xucXdCazhOSWhVbDlDS0E0a1p5SjlpR29TaFgzVWJNK3NPb001SDZ2bWZ1?=
 =?utf-8?B?NFNGMW5scnJWbW1zMVpBU0VOTG03YnNVUEtEZ1NXVVF6WVQ0UEg0N29QU0dk?=
 =?utf-8?B?eU1iRWRRUzNIVzEwL3M5VDU4MkJid0ZiMDdyZ3FHQkFrSDZKeHUxeVRpZjRQ?=
 =?utf-8?B?anEwT2o4SS91dXQrRW42YkFmYVM0TDQ1RTlIbVJCZ3JKdDQ5NGF5K3dRb2lU?=
 =?utf-8?B?bWx1c0ZlTUZWUEhUM00vckhFSWNScE9CTU9NUmh1ek9hR2dONU5VRFVhdWhM?=
 =?utf-8?B?VE5BUS9VQ3FOcG1hZnlHUXlYOFJuM3cwN1FwWndYQitSRndGSUp4dW1ETlY2?=
 =?utf-8?B?dDlkTGdqUExHdjU4bFozYnA0UlZ0dklXWitBNWtZWFJLRnlYcTU3Vk93RFlJ?=
 =?utf-8?B?blNWZ2Z3NEFPWG5WZ1AvWlE0bG5XMHk1cm9IK2M5T1JnRXc2ZzNPQXN1UHVF?=
 =?utf-8?B?Rm93ZnZWQ1k5dDZKUE93eUFLR1VseW1ZVlByc3dtUEUzOGN6Q21SQ0E0VXVL?=
 =?utf-8?B?eXRzU3dDOVZaa3pRekttV3pKektucktFcm14cnpPOVM5UHpOd2RJQ1VVaFIv?=
 =?utf-8?B?SjlSZnRoTzZwamxaNVlJbmNaaVlGV0x4OVNnSzJJWmI3N3YydnJBUy82Qktj?=
 =?utf-8?B?b0Rua3VWSjIveHg1V0toTUs3TVI0UiszQkh4blhqT2xycE5Ubkk4dCtnUGpH?=
 =?utf-8?B?NTFxTSt2RWFEZWlVS2kxbnNxM3FGbko4SVFMZWZkb3l6aUZiMUdQZ3hHQVNp?=
 =?utf-8?B?Y2l3bm5SQTYvcnJ3NTZteERkTXgzR2RZRmxIWTV5NksyOVA5c1lCc2UxM0dZ?=
 =?utf-8?B?b3VEMTlTUmFuMGNBdGI1R2h0VmFmYWlFMm1VYno4OWVBUCtqODg3SzRYZkpt?=
 =?utf-8?B?Z2gxMUtnc1F0YUFmdWNQSHQ3MkdQN3p3V0w4ZEhGVmNBSi9WSGU4NzdrZlhy?=
 =?utf-8?B?T2ZsMVlGVTM1eW5SSHcvYU4yMmpselZMcjFibjdnTzU0Sk5zdUVOc2hMNjdq?=
 =?utf-8?B?ZHhlN3k3c0R5d0RENWVwSjhqU0FsMERRZzB4clVXYWRKa3AzSzVXODNXd3ZI?=
 =?utf-8?B?MVdGR3hxTkdKQ2pPSDFQRzFHZXZFOFJhbVg3T0FLZzBTb1lMMlZwa2FkVmhh?=
 =?utf-8?B?WXRNeElLajNieWJjMCtvY3NqNUN5bjJERStlNkhhUGp5bGtKZkRVRm5leEZG?=
 =?utf-8?B?RlVoNWRPZ09yRWo4blUzYkIxZDQ1OGs2QVp6ZFVWcVl1SWFkNkRKUE5wUkdn?=
 =?utf-8?B?cFZVOGM0dlBXbDFoeHgzYm5hcVRreG0yby85U1BzRWdkbjk2SXlma2lsa3lT?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 489429ed-2a3f-4a32-166e-08ddaa947242
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 16:07:50.6856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOUX3JEZZ3ActfVX9J4j6yP2EmFGlY7HgmcWN3aQDzPK9BBamR2A6qvM7vU2CHA++7lVQxAgsW1u+A+uPR6ENw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4736
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

On Fri, Jun 13, 2025 at 10:40:19AM +0200, Thomas Hellström wrote:
> On Thu, 2025-06-12 at 14:40 -0700, Matthew Brost wrote:
> > In order to avoid adding tons of invalidation fences to dma-resv
> > BOOKKEEP slots, and thus jobs dependencies, when stream of unbinds
> > arrives (e.g., many user frees or unmaps), use a dma fence tlb
> > invalidation context associated with the queue issuing the bind
> > operation.
> > 
> > Two fence contexts are needed - one for each GT as TLB invalidations
> > are only ordered on a GT. A per GT ordered wq is needed to queue the
> > invalidations to maintain dma fence ordering as well.
> > 
> > This fixes the below splat when the number of invalidations gets out
> > of
> > hand:
> > 
> > [ 1661.638258] watchdog: BUG: soft lockup - CPU#2 stuck for 26s!
> > [kworker/u65:8:75257]
> > [ 1661.638262] Modules linked in: xe drm_gpusvm drm_gpuvm
> > drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper drm_buddy
> > drm_kms_helper x86_pkg_temp_thermal coretemp snd_hda_cod     
> > ec_realtek
> > snd_hda_codec_generic snd_hda_scodec_component mei_pxp mei_hdcp
> > wmi_bmof
> > snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep i2c_i801
> > snd_hda_core i2c_mux snd_pcm i2c_s      mbus video wmi mei_me mei
> > fuse
> > igb e1000e i2c_algo_bit ptp ghash_clmulni_intel pps_core
> > intel_lpss_pci
> > [last unloaded: xe]
> > [ 1661.638278] CPU: 2 UID: 0 PID: 75257 Comm: kworker/u65:8
> > Tainted: G S                  6.16.0-rc1-xe+ #397 PREEMPT(undef)
> > [ 1661.638280] Tainted: [S]=CPU_OUT_OF_SPEC
> > [ 1661.638280] Hardware name: Intel Corporation Raptor Lake Client
> > Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS
> > RPLSFWI1.R00.3492.A00.2211291114 11/29/2022
> > [ 1661.638281] Workqueue: xe_gt_page_fault_work_queue
> > xe_svm_garbage_collector_work_func [xe]
> > [ 1661.638311] RIP: 0010:xas_start+0x47/0xd0
> > [ 1661.638317] Code: 07 48 8b 57 08 48 8b 40 08 48 89 c1 83 e1 03
> > 48 83 f9 02 75 08 48 3d 00 10 00 00 77 21 48 85 d2 75 29 48 c7 47 18
> > 00
> > 00 00 00 <c3> cc cc cc cc 48 c1 fa 02 85 d2       74 c7 31 c0 c3 cc
> > cc
> > cc cc 0f b6
> > [ 1661.638317] RSP: 0018:ffffc90003d9b968 EFLAGS: 00000297
> > [ 1661.638318] RAX: ffff88810459b232 RBX: ffffc90003d9b9a0 RCX:
> > 0000000000000006
> > [ 1661.638319] RDX: 0000000000000009 RSI: 0000000000000003 RDI:
> > ffffc90003d9b9a0
> > [ 1661.638320] RBP: ffffffffffffffff R08: ffff888197a0a600 R09:
> > 0000000000000228
> > [ 1661.638320] R10: ffffffffffffffff R11: ffffffffffffffc0 R12:
> > 0000000000000241
> > [ 1661.638320] R13: ffffffffffffffff R14: 0000000000000040 R15:
> > ffff8881014db000
> > [ 1661.638321] FS:  0000000000000000(0000)
> > GS:ffff88890aee8000(0000) knlGS:0000000000000000
> > [ 1661.638322] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [ 1661.638322] CR2: 00007fc07287fff8 CR3: 000000000242c003 CR4:
> > 0000000000f70ef0
> > [ 1661.638323] PKRU: 55555554
> > [ 1661.638323] Call Trace:
> > [ 1661.638325]  <TASK>
> > [ 1661.638326]  xas_load+0xd/0xb0
> > [ 1661.638328]  xas_find+0x187/0x1d0
> > [ 1661.638330]  xa_find_after+0x10f/0x130
> > [ 1661.638332]  drm_sched_job_add_dependency+0x80/0x1e0
> > [gpu_sched]
> > [ 1661.638335]  drm_sched_job_add_resv_dependencies+0x62/0x120
> > [gpu_sched]
> > [ 1661.638337]  xe_pt_vm_dependencies+0x5b/0x2f0 [xe]
> > [ 1661.638359]  xe_pt_svm_pre_commit+0x59/0x1a0 [xe]
> > [ 1661.638376]  xe_migrate_update_pgtables+0x67f/0x910 [xe]
> > [ 1661.638397]  ? xe_pt_stage_unbind+0x92/0xd0 [xe]
> > [ 1661.638416]  xe_pt_update_ops_run+0x12e/0x7f0 [xe]
> > [ 1661.638433]  ops_execute+0x1b1/0x430 [xe]
> > [ 1661.638449]  xe_vm_range_unbind+0x260/0x2a0 [xe]
> > [ 1661.638465]  xe_svm_garbage_collector+0xfe/0x1c0 [xe]
> > [ 1661.638478]  xe_svm_garbage_collector_work_func+0x25/0x30 [xe]
> > [ 1661.638491]  process_one_work+0x16b/0x2e0
> > [ 1661.638495]  worker_thread+0x284/0x410
> > [ 1661.638496]  ? __pfx_worker_thread+0x10/0x10
> > [ 1661.638496]  kthread+0xe9/0x210
> > [ 1661.638498]  ? __pfx_kthread+0x10/0x10
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c          |  8 +++++++
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h    | 17 +++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 23 ++++++++++++++++---
> > --
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  4 +++-
> >  drivers/gpu/drm/xe/xe_pt.c                  | 10 +++++++--
> >  drivers/gpu/drm/xe/xe_svm.c                 |  9 +++++---
> >  drivers/gpu/drm/xe/xe_vm.c                  |  6 ++++--
> >  7 files changed, 64 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index fee22358cc09..71e354c56ad9 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -94,6 +94,14 @@ static struct xe_exec_queue
> > *__xe_exec_queue_alloc(struct xe_device *xe,
> >  	else
> >  		q->sched_props.priority =
> > XE_EXEC_QUEUE_PRIORITY_NORMAL;
> >  
> > +	if (q->flags & (EXEC_QUEUE_FLAG_PERMANENT |
> > EXEC_QUEUE_FLAG_VM)) {
> > +		int i;
> > +
> > +		for (i = 0; i < XE_EXEC_QUEUE_TLB_CONTEXT_COUNT;
> > ++i)
> > +			q->tlb_invalidation.context[i] =
> > +				dma_fence_context_alloc(1);
> > +	}
> 
> Hmm. If invalidations are ordered per GT, why don't we just allocate
> one invalidation context per GT, rather than one per GT per exec_queue?
> 

TLB invalidations are only ordered per bind queue and GT tuple. Consider
the case where two queues issue binds and TLB invalidations—if two
individual binds submit jobs with no interdependencies, the order of TLB
invalidation can vary. This breaks the assumption of using a single
dma-fence context per GT.

The fence for the TLB invalidation needs to be allocated and installed
in the dma_resv or as an out-sync ahead of the initial bind job
submission. Allocating it on demand at a later time is not an option.

> Also, moving forward, this seems like a fit for a one-per-gt
> invalidation drm_scheduler?
> 

I think this is a good idea. xe_pt.c essentially duplicates the DRM
scheduler functionality through open coding—delaying the TLB
invalidation until the associated job signals, then kicking a worker to
perform the invalidation. This closely resembles the DRM scheduler’s
dependency tracker, run_job worker, and run_job vfunc.

Let me see if I have time to refactor the TLB invalidation code to be
job-based, using a DRM scheduler with a backend that issues TLB
invalidations. I suspect this approach will be cleaner + pay in in the
long term. As mentioned above, we’d likely need a scheduler per queue
for optimal usage.

For now, I think we should land this with the correct Fixes: tag to
ensure a stable code base.

Matt

> Thanks,
> Thomas
> 
> > +
> >  	if (vm)
> >  		q->vm = xe_vm_get(vm);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index cc1cffb5c87f..81d240e561ee 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -132,6 +132,23 @@ struct xe_exec_queue {
> >  		struct list_head link;
> >  	} lr;
> >  
> > +	/** @tlb_invalidation: TLB invalidations exec queue state */
> > +	struct {
> > +		/**
> > +		 * @tlb_invalidation.context: The TLB invalidation
> > context
> > +		 * for the queue (VM and MIGRATION queues only)
> > +		 */
> > +#define XE_EXEC_QUEUE_TLB_CONTEXT_PRIMARY_GT	0
> > +#define XE_EXEC_QUEUE_TLB_CONTEXT_MEDIA_GT	1
> > +#define
> > XE_EXEC_QUEUE_TLB_CONTEXT_COUNT		(XE_EXEC_QUEUE_TLB_CONTEXT_MEDIA_GT +1)
> > +		u64 context[XE_EXEC_QUEUE_TLB_CONTEXT_COUNT];
> > +		/**
> > +		 * @tlb_invalidation.seqno: The TLB invalidation
> > seqno for the
> > +		 * queue (VM and MIGRATION queues only)
> > +		 */
> > +		u32 seqno[XE_EXEC_QUEUE_TLB_CONTEXT_COUNT];
> > +	} tlb_invalidation;
> > +
> >  	/** @pxp: PXP info tracking */
> >  	struct {
> >  		/** @pxp.type: PXP session type used by this queue
> > */
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 084cbdeba8ea..0a2fcaaf04fc 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -7,6 +7,7 @@
> >  
> >  #include "abi/guc_actions_abi.h"
> >  #include "xe_device.h"
> > +#include "xe_exec_queue_types.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_gt.h"
> >  #include "xe_gt_printk.h"
> > @@ -294,7 +295,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> >  		struct xe_gt_tlb_invalidation_fence fence;
> >  		int ret;
> >  
> > -		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> > +		xe_gt_tlb_invalidation_fence_init(gt, NULL, &fence,
> > 0, true);
> >  		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
> >  		if (ret)
> >  			return ret;
> > @@ -431,7 +432,7 @@ void xe_gt_tlb_invalidation_vm(struct xe_gt *gt,
> > struct xe_vm *vm)
> >  	u64 range = 1ull << vm->xe->info.va_bits;
> >  	int ret;
> >  
> > -	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> > +	xe_gt_tlb_invalidation_fence_init(gt, NULL, &fence, 0,
> > true);
> >  
> >  	ret = xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm-
> > >usm.asid);
> >  	if (ret < 0)
> > @@ -551,7 +552,9 @@ static const struct dma_fence_ops
> > invalidation_fence_ops = {
> >  /**
> >   * xe_gt_tlb_invalidation_fence_init - Initialize TLB invalidation
> > fence
> >   * @gt: GT
> > + * @q: exec queue issuing TLB invalidation, if NULL no queue
> > associated
> >   * @fence: TLB invalidation fence to initialize
> > + * @tlb_context: TLB invalidation context for exec_queue
> >   * @stack: fence is stack variable
> >   *
> >   * Initialize TLB invalidation fence for use.
> > xe_gt_tlb_invalidation_fence_fini
> > @@ -559,15 +562,25 @@ static const struct dma_fence_ops
> > invalidation_fence_ops = {
> >   * even on error.
> >   */
> >  void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
> > +				       struct xe_exec_queue *q,
> >  				       struct
> > xe_gt_tlb_invalidation_fence *fence,
> > +				       int tlb_context,
> >  				       bool stack)
> >  {
> > +	xe_gt_assert(gt, tlb_context <
> > XE_EXEC_QUEUE_TLB_CONTEXT_COUNT);
> > +
> >  	xe_pm_runtime_get_noresume(gt_to_xe(gt));
> >  
> >  	spin_lock_irq(&gt->tlb_invalidation.lock);
> > -	dma_fence_init(&fence->base, &invalidation_fence_ops,
> > -		       &gt->tlb_invalidation.lock,
> > -		       dma_fence_context_alloc(1), 1);
> > +	if (q)
> > +		dma_fence_init(&fence->base,
> > &invalidation_fence_ops,
> > +			       &gt->tlb_invalidation.lock,
> > +			       q-
> > >tlb_invalidation.context[tlb_context],
> > +			       ++q-
> > >tlb_invalidation.seqno[tlb_context]);
> > +	else
> > +		dma_fence_init(&fence->base,
> > &invalidation_fence_ops,
> > +			       &gt->tlb_invalidation.lock,
> > +			       dma_fence_context_alloc(1), 1);
> >  	spin_unlock_irq(&gt->tlb_invalidation.lock);
> >  	INIT_LIST_HEAD(&fence->link);
> >  	if (stack)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > index abe9b03d543e..8440c608a0ec 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > @@ -10,6 +10,7 @@
> >  
> >  #include "xe_gt_tlb_invalidation_types.h"
> >  
> > +struct xe_exec_queue;
> >  struct xe_gt;
> >  struct xe_guc;
> >  struct xe_vm;
> > @@ -29,8 +30,9 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> >  int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32
> > *msg, u32 len);
> >  
> >  void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
> > +				       struct xe_exec_queue *q,
> >  				       struct
> > xe_gt_tlb_invalidation_fence *fence,
> > -				       bool stack);
> > +				       int tlb_context, bool stack);
> >  void xe_gt_tlb_invalidation_fence_signal(struct
> > xe_gt_tlb_invalidation_fence *fence);
> >  
> >  static inline void
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index f39d5cc9f411..feab4b7c7e70 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1529,7 +1529,7 @@ static void invalidation_fence_cb(struct
> > dma_fence *fence,
> >  
> >  	trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
> >  	if (!ifence->fence->error) {
> > -		queue_work(system_wq, &ifence->work);
> > +		queue_work(ifence->gt->ordered_wq, &ifence->work);
> >  	} else {
> >  		ifence->base.base.error = ifence->fence->error;
> >  		xe_gt_tlb_invalidation_fence_signal(&ifence->base);
> > @@ -1551,13 +1551,15 @@ static void
> > invalidation_fence_work_func(struct work_struct *w)
> >  static void invalidation_fence_init(struct xe_gt *gt,
> >  				    struct invalidation_fence
> > *ifence,
> >  				    struct dma_fence *fence,
> > +				    struct xe_exec_queue *q, int
> > tlb_context,
> >  				    u64 start, u64 end, u32 asid)
> >  {
> >  	int ret;
> >  
> >  	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt),
> > &ifence->base);
> >  
> > -	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base, false);
> > +	xe_gt_tlb_invalidation_fence_init(gt, q, &ifence->base,
> > tlb_context,
> > +					  false);
> >  
> >  	ifence->fence = fence;
> >  	ifence->gt = gt;
> > @@ -2467,10 +2469,14 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> >  		if (mfence)
> >  			dma_fence_get(fence);
> >  		invalidation_fence_init(tile->primary_gt, ifence,
> > fence,
> > +					pt_update_ops->q,
> > +					XE_EXEC_QUEUE_TLB_CONTEXT_PR
> > IMARY_GT,
> >  					pt_update_ops->start,
> >  					pt_update_ops->last, vm-
> > >usm.asid);
> >  		if (mfence) {
> >  			invalidation_fence_init(tile->media_gt,
> > mfence, fence,
> > +						pt_update_ops->q,
> > +						XE_EXEC_QUEUE_TLB_CO
> > NTEXT_MEDIA_GT,
> >  						pt_update_ops-
> > >start,
> >  						pt_update_ops->last,
> > vm->usm.asid);
> >  			fences[0] = &ifence->base.base;
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 13abc6049041..2edd1c52150e 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -227,7 +227,9 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > *gpusvm,
> >  			int err;
> >  
> >  			xe_gt_tlb_invalidation_fence_init(tile-
> > >primary_gt,
> > -							 
> > &fence[fence_id], true);
> > +							  NULL,
> > +							 
> > &fence[fence_id], 0,
> > +							  true);
> >  
> >  			err = xe_gt_tlb_invalidation_range(tile-
> > >primary_gt,
> >  							  
> > &fence[fence_id],
> > @@ -241,8 +243,9 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > *gpusvm,
> >  			if (!tile->media_gt)
> >  				continue;
> >  
> > -			xe_gt_tlb_invalidation_fence_init(tile-
> > >media_gt,
> > -							 
> > &fence[fence_id], true);
> > +			xe_gt_tlb_invalidation_fence_init(tile-
> > >media_gt, NULL,
> > +							 
> > &fence[fence_id], 0,
> > +							  true);
> >  
> >  			err = xe_gt_tlb_invalidation_range(tile-
> > >media_gt,
> >  							  
> > &fence[fence_id],
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index d18807b92b18..730319b78a0a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3896,8 +3896,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  		if (xe_pt_zap_ptes(tile, vma)) {
> >  			xe_device_wmb(xe);
> >  			xe_gt_tlb_invalidation_fence_init(tile-
> > >primary_gt,
> > +							  NULL,
> >  							 
> > &fence[fence_id],
> > -							  true);
> > +							  0, true);
> >  
> >  			ret = xe_gt_tlb_invalidation_vma(tile-
> > >primary_gt,
> >  							
> > &fence[fence_id], vma);
> > @@ -3909,8 +3910,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  				continue;
> >  
> >  			xe_gt_tlb_invalidation_fence_init(tile-
> > >media_gt,
> > +							  NULL,
> >  							 
> > &fence[fence_id],
> > -							  true);
> > +							  0, true);
> >  
> >  			ret = xe_gt_tlb_invalidation_vma(tile-
> > >media_gt,
> >  							
> > &fence[fence_id], vma);
> 
