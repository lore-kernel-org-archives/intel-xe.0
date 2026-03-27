Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868A410F286F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 21:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B88310EFAB;
	Fri, 27 Mar 2026 21:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgjH5Fs6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3B710EFAB
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 21:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774646796; x=1806182796;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GvtKnR1nuJcCRU6Avp9oNJd+Y3wZdcMfVIO1ogsyQR8=;
 b=jgjH5Fs68LhpDO38cw4TUXltylgJ7OTCZyTLg7+tDwxR6L69GotJpoJj
 9sxfq0kOWfPBBm0IHUyA6PUhOsFuLHqvdjMCplV1l0NEPEbpyZuGFw0Al
 UN+ZAuggQ1tgA7a4r1eqXz6X44lyFLFhBSYvIpPqPRufZiWL9UeiPkA92
 WYzERKAgOU5gWpczJCBekvrwVN3KDLpgkefNmA4US1YKqt0jSmZLSMXMv
 kGZNKSZUJe8LhPE5G6oSJzUMZW9CSK09EhOCTkYFipUK+Lh+a1VkIK+y/
 ncKrwXZuCp5vuNtNm7i41Mqz2hTy+Lw5nLFzGzW71ZMXbyhPkhERru521 w==;
X-CSE-ConnectionGUID: eioD1kd1SByM9nhbCa08xg==
X-CSE-MsgGUID: YCqShP+2QkGmFsD/JoTwFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="98342020"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="98342020"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 14:26:35 -0700
X-CSE-ConnectionGUID: js4C3DppROmGckq9GRlViw==
X-CSE-MsgGUID: 2Mf0mSnaTayM+t6IJwpTwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="222552539"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 14:26:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 14:26:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 14:26:34 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 14:26:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENqSlZkn6zqWTyiWVdFlg5LgcGdE5krrENEhrvIcvpS0UpBXHDy2MXiHpiYzVSxqOc9ktaDrQBElp4DFS70nOr2aGe1yi/LcqiZXpwum5ajfR0J3MCR7RPkaeXqhPMGfgKYQ9sJQiHdwdwzIIitHVsxPuhgcQvjKMwFPUhOo/ig1IPOPZTPEO3Bo0wOomW/3epuysCCW9CHSP4bUKlmf8Io1wbwmu1vPwy82ftyP2viy/JbxWjwR5gccwFpjJj0Q7QIuKc5USQQIbv6BSy+inMm6j0D4W4tVVX7GEgqzPhi/N9waTlUvvrr8NjJW/OpQOij569O1v/1rPebyzC5g+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNJf7suS2JgmhuBhQiHw6G288GfguPT9rBlj4ZDRSXw=;
 b=KLhqIbPTChsVTPMuZaLHrLbZ1fXMgDaGAnr1fEGA6qNXRali+1t88O2I5tz3M6tuS3zREYX5uf8GbFrwqLzhQ3dA3U0kzahJltOYb0qvLScH5yvbXIXsNCZc05s2FBxGF0ksKcRvUIpOyswC2CgeHIVi9Eym826mZkyBV1F5Oc1g+Fno6i8BnvJHC6jCtZLe6quZ4Yd4EqoDyLtWQMh3Z2AKvHQ+uZ/LLq7kvCxPkvQ6tGXDYEpCw+BiX78cqC10zwphAdVupM1DBn+ZwuCOBGfwhEfpRn44d6Fkt4EOegP1oYArKtv1BWAxJBparlfIbM5ZXA7h7QF3E7wXXoKVuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 21:26:30 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 21:26:30 +0000
Date: Fri, 27 Mar 2026 14:26:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 1/3] drm/xe/mm: add XE DRM MM manager with shadow support
Message-ID: <acb2A+mRrk71Y79n@gsse-cloud1.jf.intel.com>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-2-satyanarayana.k.v.p@intel.com>
 <94b2be9125929696f64c1637c2eb160a578a0a6d.camel@linux.intel.com>
 <6ad46836-1b19-4a06-81ad-ab835f3d91d7@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ad46836-1b19-4a06-81ad-ab835f3d91d7@intel.com>
X-ClientProxiedBy: MW4PR04CA0147.namprd04.prod.outlook.com
 (2603:10b6:303:84::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW3PR11MB4553:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9870c5-983d-482e-f90e-08de8c478338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: QHjjLH1OOlNrplOzgOVUfsD6GSaUB5WeVTgQvc3XHmAZX/Z+3T0NgK2Q+G0IZjiCaX2Ab4iOiYYMdHEqu6spLgemzNNJOfQmMZHfvlhj3xSte/vq0/NWjHojeFLvWf1pX5+DMlhWCxRTHyQ4Ms0LDCkuw1FYVULEnYrzfqTAeInm6yqOnMbxDTlA6PuZWt6MOmyr8udTrOksJ2/Po6OGHhSH645hJrQdOnBJ9cH7cVZb7bu5xRBqmikKi72qj39akwBD3m6SiyOJFuetfqxvoLoSDAaf2O5Ro2pMc8/8MgEjFdVkJ+uBHpHyXF96kehTKh+xTY96TieiBylpmTDWureWOpj/0izuO19it3zY4Jy89SQdh8sevw9MLOlwLh6lkOHur12cDic26awEsnr/5tSq6tMyN0A5yTGQ4wUAwRDSQtZJDZWBR9vPy6hpmgN3jWCXHx/EhxQ5liECFxPAjZJ6BKIqBfQTUomnuW8ZdeYwzEGkCHv4QTeN/tOAkFx3vxMmWe62PvckPA2KaA+Ct9RLQ3ZjY0KEOsJRIeTwu06sUO63NUmbWWrEaPZMeaVKCXq8la2H/8Gc/+XZL0fxYJUG1RfrTo3KPuaxu1hVoWLUaNtYsx+65wyfVFOggA7NCqBLqqrOluEgXIqgoNy1EAYqbgPGCt5Q3EGkq8Fw3VcNIVTDFb8GNTfhdjmaLDbe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkMvdm1NNUJpd1VtdGFDWE9KSzBpMHIrc1JpdXczVEtSeFJLaktwV1VBa3R5?=
 =?utf-8?B?Qm40TWtOa3lxeGlKUjd1TmxhMEUzSHJIdmVGUUQ3LzlSdUtkY0ZNRnVEUkpj?=
 =?utf-8?B?Z3ZRWExSRFBWbHRFZ1BuWmhBYTFaWnU1U0RIUEc0M2pYUFNJTU4zT1F4N2xq?=
 =?utf-8?B?SHpZVnBNU3FaeUZuY2plZy9oQTBaK3BkdWdnNkp5ampNS09WUzlETHFuV0Fa?=
 =?utf-8?B?QkxocXRPdXpFS2lqUXkrYkk0VVBOKzdEM2tEbjc4WjZCV1lvdFlJbFNvcWo2?=
 =?utf-8?B?ZmVWemVJMDROaUhJa0dqZ1RDcEk0aVMzZDJkbWtHRDY4ZXovL21TUGdJRzlK?=
 =?utf-8?B?WUp4am11bXVOR2FFYnJ0dUpxM0ljMmdiYXJvZ2E3Y1FRcldJSFMxMUhoZEMz?=
 =?utf-8?B?Z2NoU1FDMUhMcEV1cjdDNTBQbnBEK3E2Q1RQWE5BRytXVlFBUTk2YUZPOE5C?=
 =?utf-8?B?bXR4S0lyNHYwUFZqUTdLY05TTjRjYXp5eUE3bWtucEl6MnRCQXllR0xDSU5P?=
 =?utf-8?B?azhINDBJelJOclAzQmtlTitCcXVxZ1gzcWlCa2NMNzBJanEvSkNkTnhOMGhO?=
 =?utf-8?B?VkVSSjA2a05HZVhZeTBHbGpBdW1JVld6bHJhbWJ5RUVYazZtTDBHZTk3MERJ?=
 =?utf-8?B?eVl1aWhCdDM4anpZczNsUVBxUDlKd1MvTU1IMEJla05NU0tuaUE1SmV1Zm12?=
 =?utf-8?B?d1NwV2R4WjU4N3ZvZmxubEEvMUpnOTNOc0g4N1NuOGZRKzJacWtwVjNmaEYy?=
 =?utf-8?B?VVZnR25EL1ZmcHRYZmFkMlQvM2VDUmt4eFd3UzNIRFhZQU9QQ3ZqQTlWWGds?=
 =?utf-8?B?dWE1VndWeXBZbkEyV1pvaVBYWVUxVWJyUTc0RGlHWUFLYnF2WjYyMzVrOW9U?=
 =?utf-8?B?NnQrNEt3QVNRR2dacGh6bzdJQkxwQlVjMjlFYVVKMXFrQ1ZISzcxZlN5VmpE?=
 =?utf-8?B?cUNZbUR6SDQvVFFPWjZlcFVzbkU4cEd6ajZ2VHdWQ1JqUDZyOEZka3ZUVXR3?=
 =?utf-8?B?YW5lWllWcEhUeFlaVHA2SFAvUUk1bmdaMGlpcTBJdFk2Z0l6ZjJ5WGNIRi9N?=
 =?utf-8?B?K01KSjN6bFNqZ21xaWl3N3J6aXUxMFJicWJZei9XQmtzcUNjUDY5dkNtQW4y?=
 =?utf-8?B?TVUzR1F2bWxrYzlHZzYvTzlKV1ZKWld1dVhyRG1DNk8rY2hnTlErMEZTQzR2?=
 =?utf-8?B?b0RPYkZqSDJoVEhQVTFxZnNEVTF0b3V4Y0JBdUVLR1FMeTdBV0lnR3ZVMjgy?=
 =?utf-8?B?L1l3UDczU1JCSlVFRU4raS9sbXNOOElYbEJMS2lrUlpKY2Y4aGN3OUFCUnFn?=
 =?utf-8?B?NzcwY05OU05tckFMTEJ3aThuUTNITjNScE91VHpuNW5WODBmZU03Sit1Nnhs?=
 =?utf-8?B?VFd0WXU0ZGpkUGNEMkRYZnR0OWpKaVVxbEdZeHV1QXpzZUczS1hOWERCTURJ?=
 =?utf-8?B?RmF5eFBpVndpTWMrdGlzd29WclY5SFJOZm94Q0dIYkZ6OXVxS1VCdmhVayti?=
 =?utf-8?B?dmJHcmtuQmI2WmQwcDduNnFKVzM1RGJrVnFzUmdWTmJpYkRWcmxBaG9Ua2V3?=
 =?utf-8?B?RG1BWGwyYlFvUUkxK21JVzBEL0Q5V2E1OEpoejFHSDRKOHZJV1VNV3FMb1Nt?=
 =?utf-8?B?SnBsL2gwb1I4bDdZeHlhUDBOakpmRWpibms2dWJyT2VYeEZRTVRETGNVZlJD?=
 =?utf-8?B?RUFPWTdMNkRSRmlRVW5ieEROcGphTGt5bC95MWkzeWVFeXhLYXdQV2trTEhS?=
 =?utf-8?B?UU1rcHNXV1hhL1lBd3dzZHlpb2U1ZCt5SlY3NU1TLy92a3lXL2IrT21CMnZH?=
 =?utf-8?B?Z0RaSTZUZnN2WGY3WnhFNUVyV2M0Y04zVUZDdTcrY0pGczR5TVlFRW1PcmZY?=
 =?utf-8?B?WjhPZzFObXVoUEc0dVEydG5vYUxJMngwYXIzYkh2SDF5bkdSZkMyNzcxQTcy?=
 =?utf-8?B?aVRVZkZPRm9lc3VqWnpBY1ZOaWpSR01aUXdkUitta1NkZzRUSGwyNHdhcmdl?=
 =?utf-8?B?OVJlSHFoK3FFK1hPQ2pjSzltUHpVaUdpcWsyWGt3Z0ZCWklscDd1dHhYNDJ5?=
 =?utf-8?B?bmhWbDhrYVJENzRMVTQ4REVKUjVxYlkxa2Y1RWZZVDNoTFlQL3F6azVpVWhY?=
 =?utf-8?B?K0xYWWpsSlp3alV3MnB3T29hRTYvWGVnQlZWSnpYWE5CMmtMdEJlQlJFMnZq?=
 =?utf-8?B?bkpkUmZzUGpMTjMxK01teGYxNHRyenFQT3dCcnVaWjh2cjUwc0YzakRhUjhR?=
 =?utf-8?B?Rm95T2xxNzFtZTloNlAxNWFXTCtHWlhQd3dhTVVXdkdhU1UzV1VXM2FhTDJR?=
 =?utf-8?B?RXNrVGNYQitYQWtNNWpKS0xJK0luSVpkbnNpOVdGNHRhZ1paU3VKZnMvWWtl?=
 =?utf-8?Q?3c9lTKA6uuYnw72I=3D?=
X-Exchange-RoutingPolicyChecked: LyCdwi9MqKzcaAZ6+p9CCXBuNn5tiCYcb6dDkiPWZTGSiqMoHlPx8SmXArJvM/XPjVN6tsWYCZCCYqWiURo8qGit1xgM+YTf65BHbObRGE+gB1qGwHy3xDjlNWfK+t+J2Yz2RosTehS6hGdKxLJK5Q/dc0q8M3E2abBrV5XFBZfI54a60XgLqbkN3PVGp48k97W2wPeanmSoP/GEwqAkNoo/ZjT3tL5K2CVxOx+gwoSfa7Hu8CqxJhYZTxouz1TohzKwfMZQCKJz81QtoXvqtIiinicXoGxK5Ys1WOUUVbabXVXnEsIC5GLTDYRy4bE2P4F/BDHmuClePP2yeTHBRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9870c5-983d-482e-f90e-08de8c478338
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:26:30.6983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLtLRT/gKkpBe3XtFNPt35xRSgDSGnHXZVDChnPDVjEPyfYILS34fygm013o4OjSEdac3tEZBElFb3kBPg54rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
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

On Fri, Mar 27, 2026 at 11:54:15AM +0100, Michal Wajdeczko wrote:
> 
> 
> On 3/26/2026 8:57 PM, Thomas Hellström wrote:
> > On Fri, 2026-03-20 at 12:12 +0000, Satyanarayana K V P wrote:
> >> Add a xe_drm_mm manager to allocate sub-ranges from a BO-backed pool
> >> using drm_mm.
> > 
> > Just a comment on the naming. xe_drm_mm sounds like this is yet another
> > specialized range manager implementation.
> 
> well, in fact it looks like *very* specialized MM, not much reusable elsewhere
> 
> > 
> > Could we invent a better name? 
> > 
> > xe_mm_suballoc? Something even better?
> 
> xe_shadow_pool ?
> 
> or if we split this MM into "plain pool" and "shadow pool":
> 
> xe_pool		--> like xe_sa but works without fences (can be reused in xe_guc_buf)
> xe_shadow_pool	--> built on top of plain, with shadow logic
> 
> 
> more comments below
> 
> > 
> > 
> > Thanks,
> > Thomas
> > 
> > 
> > 
> >>
> >> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> >> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >> Cc: Maarten Lankhorst <dev@lankhorst.se>
> >> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/Makefile          |   1 +
> >>  drivers/gpu/drm/xe/xe_drm_mm.c       | 200
> >> +++++++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_drm_mm.h       |  55 ++++++++
> >>  drivers/gpu/drm/xe/xe_drm_mm_types.h |  42 ++++++
> >>  4 files changed, 298 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.c
> >>  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.h
> >>  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm_types.h
> >>
> >> diff --git a/drivers/gpu/drm/xe/Makefile
> >> b/drivers/gpu/drm/xe/Makefile
> >> index dab979287a96..6ab4e2392df1 100644
> >> --- a/drivers/gpu/drm/xe/Makefile
> >> +++ b/drivers/gpu/drm/xe/Makefile
> >> @@ -41,6 +41,7 @@ xe-y += xe_bb.o \
> >>  	xe_device_sysfs.o \
> >>  	xe_dma_buf.o \
> >>  	xe_drm_client.o \
> >> +	xe_drm_mm.o \
> >>  	xe_drm_ras.o \
> >>  	xe_eu_stall.o \
> >>  	xe_exec.o \
> >> diff --git a/drivers/gpu/drm/xe/xe_drm_mm.c
> >> b/drivers/gpu/drm/xe/xe_drm_mm.c
> >> new file mode 100644
> >> index 000000000000..c5b1766fa75a
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_drm_mm.c
> >> @@ -0,0 +1,200 @@
> >> +// SPDX-License-Identifier: MIT
> >> +/*
> >> + * Copyright © 2026 Intel Corporation
> >> + */
> >> +
> >> +#include <drm/drm_managed.h>
> 
> nit: <linux> headers go first
> 
> >> +#include <linux/kernel.h>
> >> +
> >> +#include "xe_device_types.h"
> >> +#include "xe_drm_mm_types.h"
> >> +#include "xe_drm_mm.h"
> >> +#include "xe_map.h"
> >> +
> >> +static void xe_drm_mm_manager_fini(struct drm_device *drm, void
> >> *arg)
> >> +{
> >> +	struct xe_drm_mm_manager *drm_mm_manager = arg;
> >> +	struct xe_bo *bo = drm_mm_manager->bo;
> >> +
> >> +	if (!bo) {
> 
> not needed, we shouldn't be here if we failed to allocate a bo
> 

Agree this likely isn't needed.

> >> +		drm_err(drm, "no bo for drm mm manager\n");
> 
> btw, our MM seems to be 'tile' oriented, so we should use xe_tile_err() 
> 

I'd rather leave this as an independent component which we can reuse
anywhere in the future.

> >> +		return;
> >> +	}
> >> +
> >> +	drm_mm_takedown(&drm_mm_manager->base);
> >> +
> >> +	if (drm_mm_manager->is_iomem)
> >> +		kvfree(drm_mm_manager->cpu_addr);
> >> +
> >> +	drm_mm_manager->bo = NULL;
> >> +	drm_mm_manager->shadow = NULL;
> >> +}
> >> +
> >> +/**
> >> + * xe_drm_mm_manager_init() - Create and initialize the DRM MM
> >> manager.
> >> + * @tile: the &xe_tile where allocate.
> >> + * @size: number of bytes to allocate
> >> + * @guard: number of bytes to exclude from allocation for guard
> >> region
> 
> do we really need this guard ? it was already questionable on the xe_sa
> 

Isn’t this what you were suggesting in patch #3 with a tail region? It
looks like this is implementing your suggestion to avoid having each BB
allocate an extra DW — we’d just set this to 1 for the current use case.
It’s simpler than my suggestion to allocate a drm_mm node to reserve the
“tail” / “guard..

> >> + * @flags: additional flags for configuring the DRM MM manager.
> >> + *
> >> + * Initializes a DRM MM manager for managing memory allocations on a
> >> specific
> >> + * XE tile. The function allocates a buffer object to back the
> >> memory region
> >> + * managed by the DRM MM manager.
> >> + *
> >> + * Return: a pointer to the &xe_drm_mm_manager, or an error pointer
> >> on failure.
> >> + */
> >> +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile
> >> *tile, u32 size,
> >> +						 u32 guard, u32
> >> flags)
> >> +{
> >> +	struct xe_device *xe = tile_to_xe(tile);
> >> +	struct xe_drm_mm_manager *drm_mm_manager;
> >> +	u64 managed_size;
> >> +	struct xe_bo *bo;
> >> +	int ret;
> >> +
> >> +	xe_tile_assert(tile, size > guard);
> >> +	managed_size = size - guard;
> >> +
> >> +	drm_mm_manager = drmm_kzalloc(&xe->drm,
> >> sizeof(*drm_mm_manager), GFP_KERNEL);
> >> +	if (!drm_mm_manager)
> >> +		return ERR_PTR(-ENOMEM);
> 
> can't we make this manager a member of the tile and then use
> container_of to get parent tile pointer?
> 
> I guess we will have exactly one this MM per tile, no?
> 

Again see above - I strong prefer this is an independent component
(malloc'd object) rather than an embedded object for future reuse.

> >> +
> >> +	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> >> +					 
> >> XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> >> +					  XE_BO_FLAG_GGTT |
> >> +					  XE_BO_FLAG_GGTT_INVALIDATE
> >> |
> >> +					 
> >> XE_BO_FLAG_PINNED_NORESTORE);
> >> +	if (IS_ERR(bo)) {
> >> +		drm_err(&xe->drm, "Failed to prepare %uKiB BO for
> 
> xe_tile_err(tile, ...
> 
> but maybe nicer solution would be to add such error to the
> xe_managed_bo_create_pin_map() to avoid duplicating this diag
> messages in all callers
> 
> >> DRM MM manager (%pe)\n",
> >> +			size / SZ_1K, bo);
> >> +		return ERR_CAST(bo);
> >> +	}
> >> +	drm_mm_manager->bo = bo;
> >> +	drm_mm_manager->is_iomem = bo->vmap.is_iomem;
> 
> do we need to cache this?
> 
> >> +
> >> +	if (bo->vmap.is_iomem) {
> >> +		drm_mm_manager->cpu_addr = kvzalloc(managed_size,
> >> GFP_KERNEL);
> >> +		if (!drm_mm_manager->cpu_addr)
> >> +			return ERR_PTR(-ENOMEM);
> >> +	} else {
> >> +		drm_mm_manager->cpu_addr = bo->vmap.vaddr;
> >> +		memset(drm_mm_manager->cpu_addr, 0, bo-
> >>> ttm.base.size);
> 
> btw, maybe we should consider adding XE_BO_FLAG_ZERO and let
> the xe_create_bo do initial clear for us?
> 

The memset isn't needed per my comments here [1].

[1] https://patchwork.freedesktop.org/patch/713119/?series=163588&rev=1#comment_1315262

> @Matt @Thomas ?
> 
> >> +	}
> >> +
> >> +	if (flags & XE_DRM_MM_BO_MANAGER_FLAG_SHADOW) {
> 
> hmm, so this is not a main feature of this MM?
> then maybe we should have two components:
> 
> 	* xe_pool (plain MM, like xe_sa but without fences)
> 	* xe_shadow (adds shadow BO on top of plain MM)
> 
> >> +		struct xe_bo *shadow;
> >> +
> >> +		ret = drmm_mutex_init(&xe->drm, &drm_mm_manager-
> >>> swap_guard);
> >> +		if (ret)
> >> +			return ERR_PTR(ret);
> >> +		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> >> +			fs_reclaim_acquire(GFP_KERNEL);
> >> +			might_lock(&drm_mm_manager->swap_guard);
> >> +			fs_reclaim_release(GFP_KERNEL);
> >> +		}
> >> +
> >> +		shadow = xe_managed_bo_create_pin_map(xe, tile,
> >> size,
> >> +						     
> >> XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> >> +						     
> >> XE_BO_FLAG_GGTT |
> >> +						     
> >> XE_BO_FLAG_GGTT_INVALIDATE |
> >> +						     
> >> XE_BO_FLAG_PINNED_NORESTORE);
> >> +		if (IS_ERR(shadow)) {
> >> +			drm_err(&xe->drm,
> >> +				"Failed to prepare %uKiB shadow BO
> >> for DRM MM manager (%pe)\n",
> >> +				size / SZ_1K, shadow);
> >> +			return ERR_CAST(shadow);
> >> +		}
> >> +		drm_mm_manager->shadow = shadow;
> >> +	}
> >> +
> >> +	drm_mm_init(&drm_mm_manager->base, 0, managed_size);
> >> +	ret = drmm_add_action_or_reset(&xe->drm,
> >> xe_drm_mm_manager_fini, drm_mm_manager);
> >> +	if (ret)
> >> +		return ERR_PTR(ret);
> >> +
> >> +	return drm_mm_manager;
> >> +}
> >> +
> >> +/**
> >> + * xe_drm_mm_bo_swap_shadow() - Swap the primary BO with the shadow
> >> BO.
> 
> do we need _bo_ in the function name here?
> 
> >> + * @drm_mm_manager: the DRM MM manager containing the primary and
> >> shadow BOs.
> >> + *
> >> + * Swaps the primary buffer object with the shadow buffer object in
> >> the DRM MM
> >> + * manager.
> 
> say a word about required swap_guard mutex
> 
> and/or add the _locked suffix to the function name
> 
> >> + *
> >> + * Return: None.
> >> + */
> >> +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager
> >> *drm_mm_manager)
> >> +{
> >> +	struct xe_device *xe = tile_to_xe(drm_mm_manager->bo->tile);
> >> +
> >> +	xe_assert(xe, drm_mm_manager->shadow);
> 
> use xe_tile_assert
> 
> >> +	lockdep_assert_held(&drm_mm_manager->swap_guard);
> >> +
> >> +	swap(drm_mm_manager->bo, drm_mm_manager->shadow);
> >> +	if (!drm_mm_manager->bo->vmap.is_iomem)
> >> +		drm_mm_manager->cpu_addr = drm_mm_manager->bo-
> >>> vmap.vaddr;
> >> +}
> >> +
> >> +/**
> >> + * xe_drm_mm_sync_shadow() - Synchronize the shadow BO with the
> >> primary BO.
> >> + * @drm_mm_manager: the DRM MM manager containing the primary and
> >> shadow BOs.
> >> + * @node: the DRM MM node representing the region to synchronize.
> >> + *
> >> + * Copies the contents of the specified region from the primary
> >> buffer object to
> >> + * the shadow buffer object in the DRM MM manager.
> >> + *
> >> + * Return: None.
> >> + */
> >> +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager *drm_mm_manager,
> >> +			   struct drm_mm_node *node)
> >> +{
> >> +	struct xe_device *xe = tile_to_xe(drm_mm_manager->bo->tile);
> >> +
> >> +	xe_assert(xe, drm_mm_manager->shadow);
> >> +	lockdep_assert_held(&drm_mm_manager->swap_guard);
> >> +
> >> +	xe_map_memcpy_to(xe, &drm_mm_manager->shadow->vmap,
> >> +			 node->start,
> >> +			 drm_mm_manager->cpu_addr + node->start,
> >> +			 node->size);
> 
> maybe I'm missing something, but if primary BO.is_iomem==true then
> who/when updates the actual primary BO memory? or is it unused by
> design and only shadow has the data ...
> 
> maybe some DOC section with theory-of-operation will help here?
> 

Yes, I think this an issue, this won't work as...

I think we need a xe_drm_mm_flush call...

e.g.

xe_drm_mm_flush();
xe_sriov_vf_ccs_rw_update_bb_addr();
xe_sriov_vf_ccs_rw_update_bb_addr(); 

> >> +}
> >> +
> >> +/**
> >> + * xe_drm_mm_insert_node() - Insert a node into the DRM MM manager.
> >> + * @drm_mm_manager: the DRM MM manager to insert the node into.
> >> + * @node: the DRM MM node to insert.
> 
> in recent changes to xe_ggtt we finally hidden the implementation details
> of the MM used by the xe_ggtt
> 

We should probably privatize struct xe_drm_mm_manager as well. For
example, we could move the struct xe_drm_mm_manager definition into
xe_drm_mm.c rather than xe_drm_mm_types.h, given my suggestion to make
this a component rather than an embedded struct.

> why here we start again exposing impl detail as part of the API?
> if we can't allocate xe_drm_mm_node here, maybe at least take it
> as a parameter and update in place
> 
> >> + * @size: the size of the node to insert.
> >> + *
> >> + * Inserts a node into the DRM MM manager and clears the
> >> corresponding memory region
> >> + * in both the primary and shadow buffer objects.
> >> + *
> >> + * Return: 0 on success, or a negative error code on failure.
> >> + */
> >> +int xe_drm_mm_insert_node(struct xe_drm_mm_manager *drm_mm_manager,
> >> +			  struct drm_mm_node *node, u32 size)
> >> +{
> >> +	struct drm_mm *mm = &drm_mm_manager->base;
> >> +	int ret;
> >> +
> >> +	ret = drm_mm_insert_node(mm, node, size);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	memset((void *)drm_mm_manager->bo->vmap.vaddr + node->start,
> >> 0, node->size);
> 
> iosys_map_memset(bo->vmap, start, 0, size) ?
> 
> >> +	if (drm_mm_manager->shadow)
> >> +		memset((void *)drm_mm_manager->shadow->vmap.vaddr +
> >> node->start, 0,
> >> +		       node->size);
> 
> what about clearing the drm_mm_manager->cpu_addr ?
> 

None of the memset calls are needed [1].

[1] https://patchwork.freedesktop.org/patch/713119/?series=163588&rev=1#comment_1315262

> >> +	return 0;
> >> +}
> >> +
> >> +/**
> >> + * xe_drm_mm_remove_node() - Remove a node from the DRM MM manager.
> >> + * @node: the DRM MM node to remove.
> >> + *
> >> + * Return: None.
> >> + */
> >> +void xe_drm_mm_remove_node(struct drm_mm_node *node)
> >> +{
> >> +	return drm_mm_remove_node(node);
> >> +}
> >> diff --git a/drivers/gpu/drm/xe/xe_drm_mm.h
> >> b/drivers/gpu/drm/xe/xe_drm_mm.h
> >> new file mode 100644
> >> index 000000000000..aeb7cab92d0b
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_drm_mm.h
> >> @@ -0,0 +1,55 @@
> >> +/* SPDX-License-Identifier: MIT */
> >> +/*
> >> + * Copyright © 2026 Intel Corporation
> >> + */
> >> +#ifndef _XE_DRM_MM_H_
> >> +#define _XE_DRM_MM_H_
> >> +
> >> +#include <linux/sizes.h>
> >> +#include <linux/types.h>
> >> +
> >> +#include "xe_bo.h"
> >> +#include "xe_drm_mm_types.h"
> >> +
> >> +struct dma_fence;
> 
> do we need this?
>

Nope.

Matt

> >> +struct xe_tile;
> >> +
> >> +#define XE_DRM_MM_BO_MANAGER_FLAG_SHADOW    BIT(0)
> >> +
> >> +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile
> >> *tile, u32 size,
> >> +						 u32 guard, u32
> >> flags);
> >> +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager
> >> *drm_mm_manager);
> >> +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager *drm_mm_manager,
> >> +			   struct drm_mm_node *node);
> >> +int xe_drm_mm_insert_node(struct xe_drm_mm_manager *drm_mm_manager,
> >> +			  struct drm_mm_node *node, u32 size);
> >> +void xe_drm_mm_remove_node(struct drm_mm_node *node);
> >> +
> >> +/**
> >> + * xe_drm_mm_manager_gpu_addr() - Retrieve GPU address of a back
> >> storage BO
> >> + * within a memory manager.
> >> + * @drm_mm_manager: The DRM MM memory manager.
> >> + *
> >> + * Returns: GGTT address of the back storage BO
> >> + */
> >> +static inline u64 xe_drm_mm_manager_gpu_addr(struct
> >> xe_drm_mm_manager
> >> +					     *drm_mm_manager)
> >> +{
> >> +	return xe_bo_ggtt_addr(drm_mm_manager->bo);
> >> +}
> >> +
> >> +/**
> >> + * xe_drm_mm_bo_swap_guard() - Retrieve the mutex used to guard swap
> >> operations
> 
> hmm, do we need the _bo_ here?
> 
> >> + * on a memory manager.
> >> + * @drm_mm_manager: The DRM MM memory manager.
> >> + *
> >> + * Returns: Swap guard mutex.
> >> + */
> >> +static inline struct mutex *xe_drm_mm_bo_swap_guard(struct
> >> xe_drm_mm_manager
> >> +						    *drm_mm_manager)
> >> +{
> >> +	return &drm_mm_manager->swap_guard;
> >> +}
> >> +
> >> +#endif
> >> +
> >> diff --git a/drivers/gpu/drm/xe/xe_drm_mm_types.h
> >> b/drivers/gpu/drm/xe/xe_drm_mm_types.h
> >> new file mode 100644
> >> index 000000000000..69e0937dd8de
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_drm_mm_types.h
> >> @@ -0,0 +1,42 @@
> >> +/* SPDX-License-Identifier: MIT */
> >> +/*
> >> + * Copyright © 2026 Intel Corporation
> >> + */
> >> +
> >> +#ifndef _XE_DRM_MM_TYPES_H_
> >> +#define _XE_DRM_MM_TYPES_H_
> >> +
> >> +#include <drm/drm_mm.h>
> >> +
> >> +struct xe_bo;
> >> +
> 
> without kernel-doc for the struct itself, below kernel-docs for the
> members are currently not recognized by the tool
> 
> >> +struct xe_drm_mm_manager {
> >> +	/** @base: Range allocator over [0, @size) in bytes */
> >> +	struct drm_mm base;
> >> +	/** @bo: Active pool BO (GGTT-pinned, CPU-mapped). */
> >> +	struct xe_bo *bo;
> >> +	/** @shadow: Shadow BO for atomic command updates. */
> >> +	struct xe_bo *shadow;
> >> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
> >> +	struct mutex swap_guard;
> >> +	/** @cpu_addr: CPU virtual address of the active BO. */
> >> +	void *cpu_addr;
> >> +	/** @size: Total size of the managed address space. */
> >> +	u64 size;
> >> +	/** @is_iomem: Whether the managed address space is I/O
> >> memory. */
> >> +	bool is_iomem;
> >> +};
> >> +
> 
> ditto
> 
> >> +struct xe_drm_mm_bb {
> >> +	/** @node: Range node for this batch buffer. */
> >> +	struct drm_mm_node node;
> >> +	/** @manager: Manager this batch buffer belongs to. */
> >> +	struct xe_drm_mm_manager *manager;
> >> +	/** @cs: Command stream for this batch buffer. */
> >> +	u32 *cs;
> >> +	/** @len: Length of the CS in dwords. */
> >> +	u32 len;
> >> +};
> 
> but we are not using this struct yet in this patch, correct?
> 
> >> +
> >> +#endif
> >> +
> 
