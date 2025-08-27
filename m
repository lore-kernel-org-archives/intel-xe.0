Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49AACA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 13:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA7C10E101;
	Wed, 27 Aug 2025 13:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVhVqfua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0D510E101
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 13:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756301415; x=1787837415;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M6wZEMidIe/Z8jyKARem5N6nilOdBzIz07qzrzt0QCo=;
 b=dVhVqfuaWwCkAZ5AVwf8E+eE8PxtUrI1wjJ27qBweMCUvbsSnsED5rhV
 2x8W2dWtuuIeb7svWKZ2Qwo5tz4yvyHuUX22rglT1yiiQ0mVzWypBwZwp
 c1riFVTz2jfAqlikRF86WXiD4dxXsvQbsEhHTckdsGFyueXocfeetXrp3
 g/JfuNk94ZBzuQixpAOVmWRqu46jXsJ1S7WvgfhPFpue9JMdZfyVXPhQ7
 Zsqsm+GWY/B3pj/Hz+JRYVtsuEmpty6OOCI6sWc0k/7FDlcHGZTqAX3m3
 Q3dC6I72xzh/OXHroqmhE7zEoy8f8xcVnWIKUkUIrht6HoRveStNKmEJJ w==;
X-CSE-ConnectionGUID: +j93oGTNT6yPiyUTtkWtKw==
X-CSE-MsgGUID: RVW9155KRt+7Ni4YnUYL4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81144660"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81144660"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:30:15 -0700
X-CSE-ConnectionGUID: a8UehxElRT2HHvJx2m6QXg==
X-CSE-MsgGUID: 8XDFfMHwTJmD04ANdsXhNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="207009659"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:30:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 06:30:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 06:30:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.72)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 06:30:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eADH0oaRxQJcWKMu1+3G3fGNXZvM1byQMIv3rfABPtFaubD76iVx7q94g74QKcaQzw/X646tYtKEdXhpwN9TP9gyiZI45N3SHbUC8P9gB+DGKd+ZekMc8wd4r3T7jlHpruB2ffJdB/tYx/r8N0sIdDu3fNmKlbGu2esVIhlU8yKnXYJrj6vyupMlVy4kT5riBSxjbdkT+NFPQoA+pifgUKfJWSU4tJ+K/WS9L9vB28g2SV9vYEz0lLrvzLmWE91dD63Pq6zw0Q0L1aqoWvNj21uQ34zYRJEKOXgggVR/FFFCl/V9MUwkSdFlLYRGvdY8I7RPFImbk/i+esqzM2Awcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VygYcoAsM26Zu9XNi/RMbuQ0CHFcaCB5E3vVSrA9slE=;
 b=J7dU5u9yENIW9t5tH213jevt/HJGGSxTgSK4s9qpISLokJ4AwminGfQy0diArD4XfHBMhTY5wMw2yvlHNLRZ2N6ByiA7bKyloReOIz1CkDb6uaAgzOoBrRizuZ8bTo6x9mX81v7wsQbjabb1s4rWNw9CQpPxdxhGMpeqloj9E2dk6YoeXwgbgov93K7SjAHUBPlhpRKPkwsSo1vkAb2N8OKjgKEkr9aGBO3IBQsqSXl+GjYpxoqj/7BzDg2lvkVRaK07ZwcBh/xQJ5K+4Eaqu8rgVDubE+MjPt6IjcD/PJ+6mWtZVBfrKKgkz1n38AaheXqngus7VHo0nZrWtoqn3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM3PPF9D56E7727.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 13:30:09 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 13:30:09 +0000
Message-ID: <624ddf38-3ef6-4ae8-ac87-3a3ee98e2cb9@intel.com>
Date: Wed, 27 Aug 2025 15:30:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/xe: Save off position in ring in which a job
 was programmed
To: <intel-xe@lists.freedesktop.org>
References: <20250818172243.2649863-1-matthew.brost@intel.com>
 <20250818172243.2649863-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250818172243.2649863-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM3PPF9D56E7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5755e5-d787-4068-b573-08dde56dd7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEFabVU5bXRMMFk2cklnLzhwZnREZUFWZWVucXNWYmZuSXo0VzhTVStQaVI4?=
 =?utf-8?B?K2NpNXhLWjU2ZmZUcHhISFVjTUNkdGUxeHpOSVg1MXVEU2NpSFgzb0E2c2R0?=
 =?utf-8?B?QVVVUnlVSksxTmdxa25ZZ1NXL2NwZnpNSS93SkRLTXV5V1FSSWN4ZnAycHZQ?=
 =?utf-8?B?cHArQndscm5JcUE5UTlMQ2RNNE9JNVhjc0pLV25pVW1CZHpadEJFeUtqMlh1?=
 =?utf-8?B?WFlGU3lhelBNVGJDTStQWEZ6TENWTVdDYnVyY0pYUDhYTHVCQ0dObzZYNXhh?=
 =?utf-8?B?Z20yNEFVeDhQZGZkd1hXNS9FRTNxdTVVRXVVZVdtaWwxVkJkdWNxUnF4d1lQ?=
 =?utf-8?B?MWtXWmFwTFNYejF2WWlWejAra2lIYUtiMCtJeW5wNTNwcitNc3psWjRsZE9P?=
 =?utf-8?B?cDdpdG4vUzNBNVN3Z0tsSEs3eHgyM2Jmb0s1VXYvcVEvdzc1c0ZreVMzZlR1?=
 =?utf-8?B?VTVTNjZUWjlmd0xIVDV3MXc3aXZQcmdGQTFLRlo5T2k0UUJmWStPRkg5R3dM?=
 =?utf-8?B?YzRTU1dvS1RhcURLYWtBbVRoWDFZQ1pHZWREa2I5eDVVSUgySmxjZXFhUGUw?=
 =?utf-8?B?TzdSU1FoVWZ3d3dSQTR5ZDgrK1ZFV05CRGxmYXVKeSsyV3hsKzJwUkxlb1h4?=
 =?utf-8?B?dGhBZjlMN2JoMklHS0srT1MvYXdxZEt3NDgrU2J2UWRLcUdJYWhEb29mQURM?=
 =?utf-8?B?b0pYOVFnYjFaVFE4VTEwSWtWUkZubktTYVNML2RuaEllMFBiYkw0OHhHc21V?=
 =?utf-8?B?YXptUHVWMWFDaFZDV0tzc3dYalg5WWJ0QkZ2MVcyMzhZelYvWW4xNE0vdG5C?=
 =?utf-8?B?T1ZKcGZPRGlBc2RwcUlQOC9BZTFBYlhsYlFlekNZR2IxemNEVTlLazlZRmpo?=
 =?utf-8?B?V2E2UkRGcWdNa2lzKzhaVDVBRXg3akNMVTE2YVhVRStpcjkzM0xCQVZFN1Bv?=
 =?utf-8?B?ZmZvTFQ2QnRqaXJRNHNmd0FiZFp4NmRUSUNRTTZvQ0VIKzNEUGJybFZaa2lt?=
 =?utf-8?B?d3BGK2QrdWd4cEpweWpLTDZqOWhsWi8reDZGcXkyZFRla2FSNDJwWDR4MGpK?=
 =?utf-8?B?dmdFMmxUVS9yZEpRb1Nlb0M2TmZKa0VpdmVsdUpBVGlZYW05VXNaeVBWZU1Z?=
 =?utf-8?B?ZWdiWW5WMkEva2NHOWxKRFJWSEFBVnF2UU5hSE52cGU1andUTVBZeVgvV2xE?=
 =?utf-8?B?MThrMEVLaXlob3ZEeFJTNHFBeHVvZ1I1enBEY0pqc0huQkpaeStHZVQxODdl?=
 =?utf-8?B?SXQrTEUyMGxYa0FNZVl0NFVRUG5IRXJRMFUvUTExdzlYZCtGUzM4OVRTSWNU?=
 =?utf-8?B?YlZCVVk0Qk94a3l0dUNVTU9kT2dZZmRTN1pXbEY2V0JBKy9ycC91VzNsVWps?=
 =?utf-8?B?Ui92cjBKdUVZaWp4R2w5d2RKSHF6WGl5b3FoRFpUK1VaaHJGakpwQUpmNlA2?=
 =?utf-8?B?eUNuNnRFVG84MmlYNVA3RW5DdlRRbDJOSG0yd1YwOWJjekJlYzhDZ1YvUUVr?=
 =?utf-8?B?VXNEaERqUWx3eWlBeTR5aHQzOGNDc24vV0dsTG1zK0pPZnNmMTR1ZW44WGMv?=
 =?utf-8?B?NWd3QkNjb21FYzY3UUNSTFR0SVBBK2Y3bFRwcHZLcjdDVHM5K3Z0Wmp3bWhZ?=
 =?utf-8?B?a3pLT2F0eEd5cSttZ2dFa3pvRUhsUnpWdkdKelVPV1Z6REVtMGZJZGk1WVY4?=
 =?utf-8?B?MXk4WEY5YTBHeWVNR1puVVNxZHN6aXJZalR0Q0R1KytFRVV2SEhDai8zMHNH?=
 =?utf-8?B?UFluTzRvVTBKV2lBV3E3Q081TS8zMk5xd0FUQmZDQkxIRmpVQ2hQWlBTcXJ1?=
 =?utf-8?B?NitTZTF1c0k2QitsZGt0dS9kYjFOQzJvRmJNQk1zZDRKcXVHV0VFTG1jbnlB?=
 =?utf-8?B?RmRjVWE0ZlMvZzlpeklEZnZyek15YlB6cjRxakZqMnIza3drOEtnVktmeVR1?=
 =?utf-8?Q?9+dhJjt3cmg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW95UXFvUEtqS2FTVFNLMWVTSk1mZTZUM05KVlh5RmRnOVNKVXZZVDA4VWpR?=
 =?utf-8?B?K1M2bDVNbmNod2FVcHZ1WGdGRTFjeWpFSkZ3My94S1o4dnVVY2tLV1o5WE5p?=
 =?utf-8?B?QnIrdnpveDNCWE44dWFMRnFwT0MwZjMrODREWDZ0bGRkcXRYVzVlTkhMeTdO?=
 =?utf-8?B?Y3JiK21JNHpLSzllb3dMblg3SjlkcUpEbitNL2R3MUJJOGRRZ2hvcC9HTEoz?=
 =?utf-8?B?Z3piVDh4SGtmZmJnNUZqUXRTRkxEeGgwMjhjcEJseklwSVluUXBGcm5iTSsy?=
 =?utf-8?B?QUhwbkJaYnNiQUJRQkV6WEtndWhBb1pBQTRLTDdaRWhHK05yRDFRcDlQV1hk?=
 =?utf-8?B?UVpzN3J3dlplU2dLcmZrMlc4Zk5JdWdUdFg3OFV2TFhvZU9QNTlWN0VFVEUr?=
 =?utf-8?B?Y1p5RXF3a1phbnczeGdyRS9hSFBTbXdvQjYwRnlDNVNtcFByQnZ4Q29BSXRD?=
 =?utf-8?B?RmZhaE9MOFRQa2ZWdzVSQjdiQkcwWExPZG81NFY2dHZlN0FmeEtrZ1docktC?=
 =?utf-8?B?Nm8zemxzb1BMa1dxQzVXYXRKY29XQmhieXVUbW83Mmg1ZFJZeWc5RFpzZGtD?=
 =?utf-8?B?Q3FCQytOeHN2WWNvU2FHZmR3a2pITWtranR0MWRJOFgzay9RaUo1STJHOEhz?=
 =?utf-8?B?eFJyVkM0NmlGOWdmcGVqZGMzd0FxUWkvd1FwdU9yNWlXWTNTRmFpOFpCY29W?=
 =?utf-8?B?Z2hnRVFJV1ZvUDEweEg5NElkcGxkMWR3L0FMcGRBYVY0NUo5YUcrR3dVdGFI?=
 =?utf-8?B?ZEtGd2tueHNOei9zeFh2RDNyTDdBdHJIR0J6dEpnOXBQQW1iQm5WS0RJcEpR?=
 =?utf-8?B?Tlh6SWxNeDlNY1NXWGNheDllOVg1blFKby8xanh2TTQyMjNyaTdyWGZKdVRL?=
 =?utf-8?B?UW8yRDZJUW9mNlVVQ3BUQ3ErTUlva3YrbUVxeWRoa0hPVlFxS2VsakUvZ2pV?=
 =?utf-8?B?aUdMcHM4UmFLQXpsRkhFYk5VdUNyVDIveElSK3lCN2JJdG93VGZwRm96UTVG?=
 =?utf-8?B?VmZsYlVNU05saW1Gb1YzSTdtcXkvUUszSDJWRUxCNHhDazkwR25kemk4SGxE?=
 =?utf-8?B?RjdyajJRN0g1aFBZMFV6OXhUcTB4WlJJUkJuaDJzSlFpYit6ZkNTWk9lTTNr?=
 =?utf-8?B?RkZyeG5TYm53bytIWmN3T05ObmllYW10ZDlSQ0FHV0hYbVV0b0pETm1rL2JC?=
 =?utf-8?B?MTRDRDZkdDQzNWFQQU1wZC9ibmpJM25udmFkcENIU2kxbG1TNGxPUE1PRFA2?=
 =?utf-8?B?MEgxNFVZaHp3dWRPb3BrZHRIU21EckRoMk1zd1lkK3pveUxiYmxSbmIrRFdz?=
 =?utf-8?B?R2tOaXV0cDZkMFpTUlRwQUhIajdQM0dHeXEwdlZTamRKTERBUkliNFFnT2VE?=
 =?utf-8?B?ejNrS1c2azY1Q1FSamVpSW0xc0dhcWV4VDRXMUxRM21ibXVTcWN6REVtb1Z1?=
 =?utf-8?B?Wmw3SFhOYTNpNlRMTjhTSG1ha3RDYXAwNWVBS0NrYk13VER5ZExHWE9YY0Rj?=
 =?utf-8?B?TVRQTitrbStpdkRqN1NWNGx5VHRLTEVndEhjaEVaa3JNUzAzSk90LzcwQlNE?=
 =?utf-8?B?eDlxNnZZZHF1QmpFQm84UmN5VU1oODE2Wmpmak9rcGtCVG1neU5HRHJIZTBq?=
 =?utf-8?B?UDkwWjRBR2RUSjdqN21HeWpPQmNVd1ZSRXR2L0owY0w1RFBiMUxVODlPY015?=
 =?utf-8?B?OHJaL0tpTXpaRzJRbk1Gd1loR0k5QnRlcUNvMnlocjFWWlllcXAyNG1odGQ1?=
 =?utf-8?B?ZCswOFpRWURsQjQ5cE1jT1IxZGREMGVnSkxVV2hOQkQ2Q1ZWUVM5bi9ZUHUw?=
 =?utf-8?B?eVlaVUNDaDBHNFYyL2NaMEN1SFhuaDFHSnBYclkzYzVoUExZM3c2b2d5SGtV?=
 =?utf-8?B?bTgxaXdQTVlYTE1wZzdPWUM2WWJOcE1VZkYrcVZmYThJZnpDZEVYanAwNS8r?=
 =?utf-8?B?YTdiN0JJNHE2VmgydGpJL1lDbjlpTDEyaFBPYjdkNkpGODRISHBaTDdhVU96?=
 =?utf-8?B?dHg2czdSMHIvdWU4QmtwbHhyUVl0RnNpU2s2djhiR2FrajlMM1Eyd2V5a2NX?=
 =?utf-8?B?TjM1QU5wYTJVS2h3V2JIVkxkeFh3YUVYb2dHQW5jT2cwMEgwTTBwS09DWDBk?=
 =?utf-8?Q?9BbxO4mK3ZdCJiYgKWHcBGpyi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5755e5-d787-4068-b573-08dde56dd7e9
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 13:30:09.5637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qp6lLLhPlP5ihzZUBr1BZ5fwvCRCkyb8b0xiPf7zQRKJzHvoH2ZxIvu1IxsSdkyrK2RydR4CKsqNtZhVof46fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9D56E7727
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


On 8/18/2025 7:22 PM, Matthew Brost wrote:
> VF resume

VF restore / VF post-migration recovery

The second option is more precise. VF resume sometimes needs to update

GGTT addresses as well, but I don't think the update of jobs is required

in such case - no jobs are emitted to a ring during VF PM resume.

(though during VF resume we will probably re-use the fixups implementation

from VF restore, so the same job fixups will be called, they will just

do nothing due to no jobs emitted)

No remarks to the actual code below, it is good and it is required.

-Tomasz

>   needs to modify the ring with updated GGTT addresses for
> pending jobs. Save off position in ring in which a job was programmed to
> facilitate.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_sched_job_types.h |  5 +++++
>   2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 5f15360d14bf..4dad28f0614d 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -245,12 +245,14 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
>   
>   /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
>   static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
> -				    u64 batch_addr, u32 seqno)
> +				    u64 batch_addr, u32 *head, u32 seqno)
>   {
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   	u32 ppgtt_flag = get_ppgtt_flag(job);
>   	struct xe_gt *gt = job->q->gt;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	if (job->ring_ops_flush_tlb) {
> @@ -296,7 +298,7 @@ static bool has_aux_ccs(struct xe_device *xe)
>   }
>   
>   static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> -				   u64 batch_addr, u32 seqno)
> +				   u64 batch_addr, u32 *head, u32 seqno)
>   {
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   	u32 ppgtt_flag = get_ppgtt_flag(job);
> @@ -304,6 +306,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>   	struct xe_device *xe = gt_to_xe(gt);
>   	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	dw[i++] = preparser_disable(true);
> @@ -346,7 +350,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>   
>   static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   					    struct xe_lrc *lrc,
> -					    u64 batch_addr, u32 seqno)
> +					    u64 batch_addr, u32 *head,
> +					    u32 seqno)
>   {
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   	u32 ppgtt_flag = get_ppgtt_flag(job);
> @@ -355,6 +360,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>   	u32 mask_flags = 0;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	dw[i++] = preparser_disable(true);
> @@ -396,11 +403,14 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   }
>   
>   static void emit_migration_job_gen12(struct xe_sched_job *job,
> -				     struct xe_lrc *lrc, u32 seqno)
> +				     struct xe_lrc *lrc, u32 *head,
> +				     u32 seqno)
>   {
>   	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
> @@ -434,6 +444,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
>   
>   	__emit_job_gen12_simple(job, job->q->lrc[0],
>   				job->ptrs[0].batch_addr,
> +				&job->ptrs[0].head,
>   				xe_sched_job_lrc_seqno(job));
>   }
>   
> @@ -443,6 +454,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>   
>   	if (xe_sched_job_is_migration(job->q)) {
>   		emit_migration_job_gen12(job, job->q->lrc[0],
> +					 &job->ptrs[0].head,
>   					 xe_sched_job_lrc_seqno(job));
>   		return;
>   	}
> @@ -450,6 +462,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>   	for (i = 0; i < job->q->width; ++i)
>   		__emit_job_gen12_simple(job, job->q->lrc[i],
>   					job->ptrs[i].batch_addr,
> +					&job->ptrs[i].head,
>   					xe_sched_job_lrc_seqno(job));
>   }
>   
> @@ -461,6 +474,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
>   	for (i = 0; i < job->q->width; ++i)
>   		__emit_job_gen12_video(job, job->q->lrc[i],
>   				       job->ptrs[i].batch_addr,
> +				       &job->ptrs[i].head,
>   				       xe_sched_job_lrc_seqno(job));
>   }
>   
> @@ -471,6 +485,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
>   	for (i = 0; i < job->q->width; ++i)
>   		__emit_job_gen12_render_compute(job, job->q->lrc[i],
>   						job->ptrs[i].batch_addr,
> +						&job->ptrs[i].head,
>   						xe_sched_job_lrc_seqno(job));
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index dbf260dded8d..7ce58765a34a 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -24,6 +24,11 @@ struct xe_job_ptrs {
>   	struct dma_fence_chain *chain_fence;
>   	/** @batch_addr: Batch buffer address. */
>   	u64 batch_addr;
> +	/**
> +	 * @head: The tail pointer of the LRC (so head pointer of job) when the
> +	 * job was submitted
> +	 */
> +	u32 head;
>   };
>   
>   /**
