Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C80CCA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 23:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E3B10E055;
	Fri, 12 Sep 2025 23:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfQ3LkzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD7310E055
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 23:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757721335; x=1789257335;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qoOHAJ3wI6mpCSJuOd79RJpeVwFR16/Vdo9WqGCsLIk=;
 b=lfQ3LkzTeVD3PsDU0N2jwzA/YcDMWktXgw9XlAwAvxGJRivKlSm0OjgL
 2eo8p2QOtkZDTcpf2Ydlkz3RbTOvjk9zw39tlFc3TIRxWQ80v6ztEkHNT
 oQC6r2SyzZn9Vlveqhe66j5gr1uXWSqyvi/l7uPsthBz4R0kqUFPfi7KV
 bIOHZ9J0JqXdP0mMLTVLxj6Wgf1g3niPMhMCBAokCf4yIHOhm1Uad7HDC
 d0s9ZkF2pMPsK8EgUWsYpg/lxH451MwHNvMaZkS3790Wy4i6Y0q46uqR4
 s2kTIIF7bxyTzdf/CG2J8Q/+Omc4I58FwZmaoken29sDosx0fR8vXahCg w==;
X-CSE-ConnectionGUID: BR0IkM4gSWaz5MsvF6wgoQ==
X-CSE-MsgGUID: sVfVJMI4TVWKnUviPDjWxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="70753577"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; d="scan'208";a="70753577"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 16:55:35 -0700
X-CSE-ConnectionGUID: wIMysdnjS1Ogb33qKqPeHQ==
X-CSE-MsgGUID: tFi+TnEES3WZ06qZXjjZtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; d="scan'208";a="179280526"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 16:55:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 16:55:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 16:55:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 16:55:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIFgLesgd9LayEQ+2307+kBKxfHQY52OqE5IgSXRp27T1pUGUQAzvZqkLvBYf9f7GJtQO1106jaMDaGwglbPHxldn8PQqsG+ozK2xg17J5yokfv8ITYt2QKpymQTCVOf3ULOzEnomEbkAuj7NO6/ykp+pmEY1k8lCe2kKLRkxsaefScBARUcg60/WJV03+1mRfKrNwWS1qnqYAjNR/xgdZakTPThdQ1LFQ87J/IqPl47gRVaa/vVu4irwcf8FuMnI2hspS83bnsoybcZ8E/fRZuj6E6TKlJkTK29mV0QeUe+C9UKsiG7M12Q//00I5yaETTGVGSU3ruqfMLj74T1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRUZmdTsmD3TkCyQiWMPfJ8lvXjrYynhK1g9h/jqE7Y=;
 b=ZP5iXhbKY8xNbLfuOEvrLtfNjywgoYdKTFsIBY5MUkqYVv8p8cg93NFqqlm3z4+TvqgeioKCYfaxhcsv+Hb63+b3vWfn8sAvWW8UDaQnWb6pW5YfC3hcnECQL45xFu+7ahS1GO3Xfly0sD1nXwFIZCU+ysOq60sfjW65qNltbjwPcQyrO9Axe871GtVqEkjTkpw1zsiparfVTT5NsSb3btdbWAM9rzF/pEoDmbDDQ9qclRB+e/CPKGCl4PIOy+bB3bhdK3UgNUT5DoOnlLp/eXUm3FtMRnbqi5ViX64g52J+5RORjdDfCr8kiqF8+X60LQXiQAmgrdGBS6cS36badQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Fri, 12 Sep
 2025 23:55:31 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 23:55:31 +0000
Message-ID: <dad2bb7c-892a-42d7-82ba-869ffaddc036@intel.com>
Date: Fri, 12 Sep 2025 16:55:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/xe/guc_pc: Use poll_timeout_us() for waiting
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, "John
 Harrison" <John.C.Harrison@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <dev@lankhorst.se>
References: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
 <20250911-xe-iopoll-v3-2-6a95f1cc3b0b@intel.com>
 <6934c194-9d1b-44ba-aee5-3ce106143144@intel.com>
 <6pt5o6cgres5n3argefbocisccmfbjpawk5s6cts2k5fm3ropr@xmbnve5zwltu>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <6pt5o6cgres5n3argefbocisccmfbjpawk5s6cts2k5fm3ropr@xmbnve5zwltu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::37) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: 8717bcf1-1cb1-4814-0688-08ddf257db1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEtKMXMrS1Nqa3FpdzlpMjlpa24wYkViSEhwYVljT1pZcUpPQ1krOStQajc0?=
 =?utf-8?B?K0hHRWVtZHErK0hMU1BBMFN0STJuaVF2djVURHlvcjB6Vmh3bFJjRDMwbDBs?=
 =?utf-8?B?WGhYWWgveGxpckk3Y0hvQzZCclB1RU1pZTQ3L1AyUEFFeDZQbUpNcEdYenNH?=
 =?utf-8?B?SStQUFp5eVd1cVB6SEJ2SkVwOE9GY1FrRDdlRk04czVOTkpqSkM4RCtXN2V2?=
 =?utf-8?B?dmE2aHBTV0ZpM1pKM3NMd2Q2V0ZYdVNiYi9JOVhYZ3NKM2pDcmoyeDA2NnNw?=
 =?utf-8?B?OGwxTW1IYml0U093VHM0Qmg0aGtYMHBBaS9DSjdkcDd3L1ZlWEtxQlpEaHBr?=
 =?utf-8?B?cGxmWWRHWW5EaE5BTnFXZC8rc2dHYU1PVFFQMi9XZU9WZTV1YVVPYU5vaVA4?=
 =?utf-8?B?T05POHhIVlhpZ1RzVEVLNVd0Z1dNOXdlWjhXV0RFQ3JtdUNIQ0REclRNMmF1?=
 =?utf-8?B?NWNHc3ZmQ2ZHRHRubE9IZkszOS92TDIvZ2JtMDRDdEV6WHdCV3dJb016YTBj?=
 =?utf-8?B?SHpIbVp0Y3hmM2NJNVppb3ZVS0dMTTFkSnJpeHNMYWVRKzVvUzUzL2RYZ3pH?=
 =?utf-8?B?ZUNaaVVvR2s4aFdmKzVDN3ZUMm0rTDdCRlh2SG9NMCtaTXZrd0xYOE9kaHdB?=
 =?utf-8?B?djhlWFZJZ0paS0JxSGpwbmRNM0M1MWZlRGNhaTJRWkxLQ0NJOVFVcHVtRlo0?=
 =?utf-8?B?VGtPUjRVQXYxM0FCSkE4OFJlZXR5UlFpWTFwb21NSkg4emttVXAzb2h4cUF3?=
 =?utf-8?B?UmhNREEvY2pjcmN5akErdkVGcTZLRXRhaFhIempNRXY3cWNOOW04LzhYRG9k?=
 =?utf-8?B?ZmxmNTNEdGIzNW5EblVSRjdoVzJWQkVGSzc0Y2d3S2NtVVpxakpIVHB4N0Rm?=
 =?utf-8?B?R1VmQnBCSVBXbWpVclRGTlZYK0FadzZnZVJMSms3T2dIWkh0UmVKTThOdklB?=
 =?utf-8?B?Y0pJZGxsbndNNEVncEd6MTRIbHhmMTJOc05YWkRVb1h2MVQ5dFZONklMcmJZ?=
 =?utf-8?B?WGdDNkRaVks5dUJYakNES290MHZUQjZiWkpHaUxXK09DRlIrUDFMSHBTVVBQ?=
 =?utf-8?B?TmM4VVlDemNmUnlkMnNkeWFLc0NOUXJEendNMnprQkFlSDJvSWNreVBiUjI1?=
 =?utf-8?B?THdxanlJOXcrL25zOGc1ZHdqcjd2V0tFYUJ2YXN0c0NKQ0ZBajZBWGVjMkNF?=
 =?utf-8?B?Z1haTXJ0RWJjL0EzZHpERGlSaWdoM215cFZzd3VWWkpCVlVtaDRQMkozOFFZ?=
 =?utf-8?B?YnpJZS9Ccm51UHFBRm9DTUxTOVVGYzJncTlrUkRKZmowZVFiNW0yOCt5STV2?=
 =?utf-8?B?OXJBYW5DWWluNndsSkNjeWw5MWdlaDFNa01TT0Y0Mmt0MStPcU1Rb3BJODg5?=
 =?utf-8?B?WURaV0x6RGVlbW5uRGxIN2tkbDE3dXpMTGZMVnpLNnZPOW9ETGtPV081SlU3?=
 =?utf-8?B?T2d3QW5QWFltRnFLMXdUeDkzL1lZM0Y1U1RTWExVTE53S25YNDJUb01KLzNX?=
 =?utf-8?B?eHI5MFlhWUZ2dFdPNVFpUDVpL0c0NkU4YTNMKzBTeWJHL21tUlhYSW9oRm05?=
 =?utf-8?B?SER6eUZOejExbDNlN3BreGtGSDcyaFNRdGE5RUg3UjJUWWIydGJkdStzbnl3?=
 =?utf-8?B?b0JOemFJK2xRWWtOSjdDNS94N1RyZ3lEaVZxRkkrS1UzOUNYTEIxbDBJbHhW?=
 =?utf-8?B?WnA0OGVPRlF1czhHUGw3KzJtTkRsTk9Nb2FIeGlUd3hQOGZkTkViZVlrK3lN?=
 =?utf-8?B?dDBkUzhnVld2NlZQR3hwUDgwY2JBSGFCckZleldJeHk5U1ROeTNCQTBDaEx2?=
 =?utf-8?B?UmZNQWJBU3BqUGR4ZEhNK0xXR0sxZ2ZHUmc5ZERDZ2tNaE51NWZ3MGNFVXk5?=
 =?utf-8?B?cDBYSk4xdjB6cEJtMHdjVC9NTXJKZjZBSCs0dUpqYUpEcmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWJTMEMyQlUvc0MzbS8rZCtza2Y0WWlqcFpCbUJ5U0pkaFRyVnp2ZUZBVG01?=
 =?utf-8?B?T1RmSGtsdzU4bFh4U3hnVk5CZzNqK09OOE9xUEpEcytSYkg1TlI4T1VCTzJp?=
 =?utf-8?B?ZkhKWG1la0w3Q2pqWnUvb1poSDJPVUg3c1lROG5DMzlKNmx4aWRPTlV6S2Np?=
 =?utf-8?B?UExzVUFqVVhOMDRVOExFdVJPWGU3M3JLcmVUcmI3WDdONEhiNk9RYzc2TllW?=
 =?utf-8?B?Qzd0UVBiNXd3bDdhZ3l0bG9KMFpIOWFnb0FudVZqWGRPcGhCOS9lcW5IdGEy?=
 =?utf-8?B?ajVPNm5yL1BibGt4ZHFtZ24zTU1OcFladitUYzFXUFRMZ3AvbXM3a1Uva0lN?=
 =?utf-8?B?RG92cTRhSnRxTDN4Mlp6aDhBeXN1a3k4Ym1MdWFrTFB0eWpGL1JkNlIwa0Vy?=
 =?utf-8?B?TXZxSzZWZ2lXclRGWVFHc0k3Q3V4TFBYRjJwTnFhWVZwVC9TVkVmaU9WdElO?=
 =?utf-8?B?YmVwWlk3REl6WkJOdDlVZGtGRGRFbW8zWVd4QXRPL2tWVVdoNUZVZitEQzlW?=
 =?utf-8?B?ZGtnUGFxTGRnaWRJZUFiTFdyRXg5MHErT3NjTHg3cUV2TVNMbWMxcFhWOU1I?=
 =?utf-8?B?SjlBVmkvTHorcHYvNGhZdVZXcTNpM1lSK0NaS0s4SlREamRzdVNqbGRtUVM5?=
 =?utf-8?B?azV6WWNiY2FMWUJkVHdBWFdQVW5Bc0xjeUxKOFJ3QWtBRjRwVmY3ejJTbC9r?=
 =?utf-8?B?STVjV2pISlh1cEFqeHBMdml2V3MxUEZuOHhjVEVuelV1QjBCakMxN0hQQnNP?=
 =?utf-8?B?NU44VC83NFdGWFlPUWc1UFV6SytPSEY5SHVGSk1yYUYyZ3pBSlE5VU5nTm1a?=
 =?utf-8?B?cktSckFEL2wzTUlLTzJOb1ByWHBTamNQOER0QWZCN3FVN1crVnhJZW5oc1V4?=
 =?utf-8?B?aTVmVUsvM3RDQmdvV0tiL1JuOEJESzN5a1g0STRxc241ZkN6UE1HajNiVnpM?=
 =?utf-8?B?UmlFNGRpVGhjNkJjamkyTldFaDd3TGd4QzZQd1BiN3VZTDJQVk1NYTlPeWM0?=
 =?utf-8?B?NkJ4Vm1KNUU2bnM5NHJXN1paU251aVM3RGtud0VHdTlwNUxwRzNnMXVqZE5u?=
 =?utf-8?B?T2J4NHJFMDBxSkJzbXAwbG14WG1kUjBZNjhwSnVGSDlLWUxGR3lST2xoUzNM?=
 =?utf-8?B?Ym1xU1I2V0xkN2pSMitaUWZzS2FnK0x2bGJuYWF5VzNIL0JhL2tPQmxQSDNU?=
 =?utf-8?B?R2VVTVljYXpNaDRDbWZKdjl5Y2xlS3lpWjZZRzI0YXJwTXhIVU1yUDdmcmhW?=
 =?utf-8?B?OG81dlhxeSsxQ21iOGhtZHFPMlFqYzVjb3duNFpJSC9IajNranNNYzV2T3Fv?=
 =?utf-8?B?emlHMlJtYy9OcFRNZnN2MmtTSFdTeThxTU4rWDNJbVVHZnphbkpkc1RsKzU5?=
 =?utf-8?B?d0UwL1U5bnljTmpyaFBrVm5CWFdtOGRTQWpHMU1JZHNheEJrSG5Qc2R4YzVX?=
 =?utf-8?B?cmtYa2RzU2hKMDdER21UQWprU1FSQ2MxVFZyRk9TTE1ZY0NvZWtUUFN1RHIx?=
 =?utf-8?B?OEVhWGtsSGpLQzV5cVR2ME0rZkdock4zNEpkVDVNeG1wd0dNSnZvcTdJNmZy?=
 =?utf-8?B?OEdiNU5tUU82OENjSXpMOUVObEFFUDVUY0RLYlhObHZOcHNDcjE2WXlpMWIx?=
 =?utf-8?B?M29KOHlXdnVEK0VIakYvOW0wWEt2L0FsbmM1TmtiWC9zMnVrZjhuQS9scXJM?=
 =?utf-8?B?YkRCTmdUSUgvM3RqRVk4YlZJWVRIZnRpM1hXbGZJeDREb3FkUS92NGpaeGlN?=
 =?utf-8?B?ZVFTTmtRaGhHb1RRZUV1TTQ5YnRjREpUU1RaalZzcnRKdVI3WUIyZnBOOWRu?=
 =?utf-8?B?S0tWZnRpYzNjazNwM3FaYkpXMDFnalRpRHErSC9KT1hEQURwMXJibWhsbFJ6?=
 =?utf-8?B?UE9mYno4THdQQzYwbjJQMzJLTjZHc3pja05kamNJRW12cUZrYUQzbkwwNWNq?=
 =?utf-8?B?V3hheFU1bVFIdUtxODdJelg2R0RHRmgvdVpBbmRMNENFUUdDNnZxdHd1cnIv?=
 =?utf-8?B?eWdJejIrMTc3dGM2eU5Oa0NHelBwN29wZTF6emp5WjZiL1hSSEl2OVdzYTFG?=
 =?utf-8?B?Zlp6dEdzdXo4UW9KZmtmQ3YrR3Rnc2Z3cHdScmtCaDRPSXpjTG9jdm5MakF6?=
 =?utf-8?B?VlU5NjhBS3BHdWF0Sk8rU24yYmZVb05Wc2E5TmZFSXNqRjJ1ME1acWI1bHNE?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8717bcf1-1cb1-4814-0688-08ddf257db1d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 23:55:31.0431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHHi4rV1HMzjzdmwgS14hNBouJh4pQ6kASCU/WI3dx5T83EqHMiLKLVij3bdLN3zpAf3r9dQ9kNjEPvpOL+tcRkWb1/bk7Bm4RQ391I54wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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


On 9/11/2025 9:56 PM, Lucas De Marchi wrote:
> On Thu, Sep 11, 2025 at 02:21:28PM -0700, Belgaumkar, Vinay wrote:
>>
>> On 9/11/2025 10:25 AM, Lucas De Marchi wrote:
>>> Convert wait_for_pc_state() and wait_for_act_freq_limit() to
>>> poll_timeout_us(). This brings 2 changes in behavior: Drop the
>>> exponential wait and fix a potential much longer sleep.
>>>
>>> usleep_range() will wait anywhere between `wait` and `wait << 1`, so
>>> it's not correct to assume `slept += wait`.  This code is not really
>>> accurate. Pairing this with the exponential wait increase, it could be
>>> waiting much longer than intended.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>> v2: Simplify functions by removing helper variables and changing break
>>>     condition on poll_timeout_us() call (Maarten)
>>> v3: dial a little bit back from v2: better to have some helper vars
>>>     and avoid the weird syntax (Jani)
>>> ---
>>>  drivers/gpu/drm/xe/xe_guc_pc.c | 42 
>>> ++++++++++++------------------------------
>>>  1 file changed, 12 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index 68a5bf8e39462..ecfe37836692f 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -7,6 +7,7 @@
>>>  #include <linux/cleanup.h>
>>>  #include <linux/delay.h>
>>> +#include <linux/iopoll.h>
>>>  #include <linux/jiffies.h>
>>>  #include <linux/ktime.h>
>>>  #include <linux/wait_bit.h>
>>> @@ -130,26 +131,16 @@ static struct iosys_map *pc_to_maps(struct 
>>> xe_guc_pc *pc)
>>>       FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
>>>  static int wait_for_pc_state(struct xe_guc_pc *pc,
>>> -                 enum slpc_global_state state,
>>> +                 enum slpc_global_state target_state,
>>>                   int timeout_ms)
>>>  {
>>> -    int timeout_us = 1000 * timeout_ms;
>>> -    int slept, wait = 10;
>>> +    enum slpc_global_state state;
>>>      xe_device_assert_mem_access(pc_to_xe(pc));
>>> -    for (slept = 0; slept < timeout_us;) {
>>> -        if (slpc_shared_data_read(pc, header.global_state) == state)
>>> -            return 0;
>>> -
>>> -        usleep_range(wait, wait << 1);
>>> -        slept += wait;
>>> -        wait <<= 1;
>>> -        if (slept + wait > timeout_us)
>>> -            wait = timeout_us - slept;
>>> -    }
>>> -
>>> -    return -ETIMEDOUT;
>>> +    return poll_timeout_us(state = slpc_shared_data_read(pc, 
>>> header.global_state),
>>> +                   state == target_state,
>>> +                   20, timeout_ms * USEC_PER_MSEC, false);
>>>  }
>>>  static int wait_for_flush_complete(struct xe_guc_pc *pc)
>>> @@ -164,24 +155,15 @@ static int wait_for_flush_complete(struct 
>>> xe_guc_pc *pc)
>>>      return 0;
>>>  }
>>> -static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
>>> +static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 max_freq)
>>
>> Nit: rename to limit_freq or something instead of max_freq in order 
>> to avoid linking this to gt max freq.
>
> problem with "limit" is that it gives no clue if it's limiting down or
> up. wait_for_act_freq_up_to() or s/max_freq/max_limit/ ?

true. Either one should clarify it a little.

Thanks,

Vinay.

>
>>
>> with that,
>>
>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> thanks
> Lucas De Marchi
>
>
>>
>>>  {
>>> -    int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
>>> -    int slept, wait = 10;
>>> -
>>> -    for (slept = 0; slept < timeout_us;) {
>>> -        if (xe_guc_pc_get_act_freq(pc) <= freq)
>>> -            return 0;
>>> -
>>> -        usleep_range(wait, wait << 1);
>>> -        slept += wait;
>>> -        wait <<= 1;
>>> -        if (slept + wait > timeout_us)
>>> -            wait = timeout_us - slept;
>>> -    }
>>> +    u32 freq;
>>> -    return -ETIMEDOUT;
>>> +    return poll_timeout_us(freq = xe_guc_pc_get_act_freq(pc),
>>> +                   freq <= max_freq,
>>> +                   20, SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC, 
>>> false);
>>>  }
>>> +
>>>  static int pc_action_reset(struct xe_guc_pc *pc)
>>>  {
>>>      struct xe_guc_ct *ct = pc_to_ct(pc);
>>>
