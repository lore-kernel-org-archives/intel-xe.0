Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA673CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 15:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6325E10E0C7;
	Thu, 16 Oct 2025 15:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIxow64G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898BD10E0C7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760629623; x=1792165623;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XIverHmTO3lsBp6zXj8+Gtjnx+XTlXtmwu3qAmWQ/QQ=;
 b=iIxow64GOYC3ClotbbJ18MfTXIZEYtRJCafE9Pz2wqmgx+MClaCq+P8x
 EYF1vi/FO9tss+CIEMmDXZqfHvU0dlAFs0fn0PgGSmmIRgJAUb45XI7U0
 jd9G7z/IEfYeRU4RX8GDeKBEQAKjsd5EtJnwjg+HUxiH3+g0o4JP8qOnb
 Igt2DA64QuackkIhmf0dZC7gwFaNMwXfOJ8F6q3QtF05TZaoY9GgrRDfV
 Q1LI6j9PFSs9ohzfI54xs1gD2LJuC68wtpda2Zbcvs3RtKug9fEphRvDO
 M4xY4eD0H8KiLA7hpfTEupVTNF19C9pJRZDLdci11dpjreX2fg6K7ii68 A==;
X-CSE-ConnectionGUID: phmupY6qT1K9enaaS128AQ==
X-CSE-MsgGUID: C4XLhw0WT26wgvTFcIHjtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="50393931"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="50393931"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 08:47:02 -0700
X-CSE-ConnectionGUID: NzTQ+HrdQM6XinB9sVYmFA==
X-CSE-MsgGUID: PCy8uhMDRA2ylSj768Qo5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="219647973"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 08:47:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 08:47:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 08:47:01 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 08:46:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGbxwM54fPtyxus/DMzH9XQp7nGUAuL0fQBi+HUd6aa9+8TF9xKAaDDUj/grQEwhz8zoM8N1oFaxl8EXWaP0n+WdMkr2gmOAtDo6wYNbpmwfuHMhtciaujt73IVCQWeigP1KRaYYATr+YvqO3hdLwhWkb2nwrO2YsbA8cSOrqFGKE4iNNVpEVngRaoUKUdVVkqtWyPO6ca+PsJieMDTtkt9SmHvWHVCOUC0JUCZ7Bd/QJRv977XzzFKlR43mMcjnI4yhCNHUilvAORLuvrGfHOLmDw7ApAl+0bO7VQ6NXW9nQzEK93NjAI3dBed53ta3b8cYxdXhRUITCy4gYAclMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMuNGMetmwQbssUDFkGlbPwMvz8LZW1keM5uthlJ9to=;
 b=Kmqe+SkwtLzEQjCrJfTcSbB3fRM4PhtAdg6ZBfLq/qnlyj1iY+LlXGEqyzdeH5cwjToK2AHJ9LXeoiI1FiB71YdYagUd8dx2Ne0CjrhjUR7A/H96/ojE0lXQj0/OwMvk4/vUqewopI9+/KsDBQ36Sej5IDykESl5O4ZkzOwG1UkWPp8pqba0tkU3EJBwCWcAmYO/Va/5L2cVm2GmmYr1Kzkpd7Ad1Dw/8H1AvSZvDPdQ1ab2XIhePQYau5iNqpv397BCg8kWaSUdmJ9LGKWegLKP2cM7BJ2U+qDDXy2uQOZYMoeQqyAua2GpB/rVZNzpSk7o/zzx0bY2JADrCfvh9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 15:46:47 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 15:46:46 +0000
Date: Thu, 16 Oct 2025 17:46:44 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe/pf: Allow to restore auto-provisioning mode
Message-ID: <20251016154644.4ej2xtqscxhd57th@intel.com>
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
 <20251015091211.592-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015091211.592-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU6P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::6) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c3eb2a-0254-4366-e6be-08de0ccb36a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG1jQ1lQblViOGE4WDdORWlhTVljV01tSkRsWUM1NVFRUzNGdkhDT2R2enE4?=
 =?utf-8?B?N3RlYlR1TGhwcHRiT0lsZG1pYW9ETjNUSzZBcGRRYjUvWWN6M2hzbU1kNTdj?=
 =?utf-8?B?d1RTbkV2dnZSVm5uOEhJbE9lSUxzWU1kUHlRa0JQeGs1V2VqWjIrbS80dVR4?=
 =?utf-8?B?WFo2L3ZaTVdoQ0x6NWRpVFNXZFJqalZ0WFpwZXI2MVNqaDRWOEgzZ3h2bFlT?=
 =?utf-8?B?V3VkQldqbEtrVllBMDFYSEJIR20zaUZkVFZ0ZXZaclNyKzZNbUwxdURIWWRL?=
 =?utf-8?B?ci9rMlQ4Uy9XQUlxZFNkaXlueGtCNWVEb0FrOUZ0RElXMVVRa0QyWVFOV251?=
 =?utf-8?B?TW41aUZFblpGYXd3aCs1RVBnT0YweWVtd2l1aEFaUDMvU05VS3FBQVNqTlVk?=
 =?utf-8?B?T1BGdWdiQi9acmJmekVXbDBBdTJiNDJVcTh6b3hseWV1SlozajhzZmZobDc4?=
 =?utf-8?B?SUZ3K3o4QWpPVEE3RVNuY3JyZnlGelRFU3g1SUhUVEFDMzNFK0Y4Tk9tbVFH?=
 =?utf-8?B?WjhGd0JLbXV3R3lsWGNiZmJJdnlhUEl0UXNzV1pZVGF5REpRVWFVSjVPdGZX?=
 =?utf-8?B?eXQva2h4YmdZd2p2anN0bllvSU4wdHcyMXRobXcrYXFWZzQ1ZGlUZDJQT2RV?=
 =?utf-8?B?Zk94ektybnYwWE5kV0dBbDZLSEswaTl5aHMxdk1kZmd4amFLYTgvUHZZVkc4?=
 =?utf-8?B?Nm95VlRsMnVBVzNPUmN5MWFqVGRQT24xQ1ZqMG02RFBpMmcyQ1lhV2huMGJD?=
 =?utf-8?B?WVdNZ0VOckpGWjlYY3Uyb29jTjk4SHdIWks5czE5MUtDRVJMdkpSSjEyVjBx?=
 =?utf-8?B?SWxmZ2xlWnlxaUlocFArNkszT2RhSHdOSDRRQ3NJbDRTVGxpZlBHRmdvL2xZ?=
 =?utf-8?B?WjFDUDJuVGZEai83TGNTTmZxSXFmYktIbnFscHNVbU9oYmZtMmZQbUdtaG5r?=
 =?utf-8?B?cjFtL3ZGbFRWbmRTbDVQSmhFdk1XLzAxVWlxTFc5VklET204bmZGYktlT0xI?=
 =?utf-8?B?bFNXWGVDajNVeWNTM0hOeTdTSzUrdFNlQVYxSnpienhqOGRPN3M5cjFBUnZi?=
 =?utf-8?B?WDlXYlo3NWtlZnBUdlhncTdGMXlqTEZvMThxaHM3bkdxTWQrQlpwUUplUWx4?=
 =?utf-8?B?dC9BcmFaT1MyY0g3dVN2eXI4QjNtenFVMDk0NUdDMWtiMmYrUjdhbTlSZFhy?=
 =?utf-8?B?SDVNbHpPSXBnZC80TzBZVytqeFBXelN6WWwwUUNDUTltQmJ4VjFCK3pkdWtl?=
 =?utf-8?B?Nk0wcnJvSFlKaGxNek13aFI0RVV6RThQS3VMMjAvUlRjQVE2bWx1cmhlb0pJ?=
 =?utf-8?B?KzNIRU5VSzh0RkZXa3dBb0QrcmhSbDdUMDZxNTBlbzJQSWE1ZjZadDRuRlpu?=
 =?utf-8?B?L2U1a3NhQ3dhYlE0bHFXQStON0JIeXlKdWd4U2o1MkVDV3pZdGNwMmE5bWly?=
 =?utf-8?B?YjZYSjlHQUp6c3NmUmdLSlMrTDhvUFhLS1RBMGdBc2x4NmJlWmNyTW9Jd004?=
 =?utf-8?B?YmhqWE1wUzh4amF3S0RUankyZzMxTWpOcWRmUHZJcUtqK2s0SkFZc0kwWkM5?=
 =?utf-8?B?NUFUNUlnK0YvWko1Z0ovTDJyVXJwLzYxVDdHZHV4bURQQkFzSjhGcEl0OFJB?=
 =?utf-8?B?aDAwTU1NZFNMMkRRY0NXTW9CTm1YeHRiMW9CUWxlVG5qVWlhY2dOMk50dTM5?=
 =?utf-8?B?NytSL2c5QldmVTJrdjh1bWNqZm1XREVpKzRXS3c3bFM5dFFjQk5pVTBOcHMy?=
 =?utf-8?B?d09aOFljZ3ZrQ2EvdkFkdXV3VDZseFNoV2gvSnVDUWV6YTRBeHFSWGZJRW9Y?=
 =?utf-8?B?ZVpXODkvRkRnVEIzQ0VhQi9TM2dIcmVZWm03RFRoSSsrcEFKSStGaTJKdmV4?=
 =?utf-8?B?eE9rNFgwNjA1cFJWbkV5RjY2Slp4NG4vMUpubnVrNzNFbTFUZVJ2d0hiNmFq?=
 =?utf-8?Q?1alb5JTd79nItg89Okn+eYfoiau9pjJr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUl2TDF2NFlmK2RJWEdhVVlZZjh5ZCtZRkFLL3dxYUpOWUIxcHc0b084dnc5?=
 =?utf-8?B?WWE0K0lhNVZRL25IWEc0SkhLdkFkaFA1WjR2aldBQ1JGVkFmMjZsOHIzNVlW?=
 =?utf-8?B?SFFWTGgyUzd5YlF4RFRtT2FYZlQvTjBycTZHTEtQSHpIZjdGWWFFbEE4STI3?=
 =?utf-8?B?N0ZsbU15VllCK0JZRThoRzVLOHZWWStoZ2FkRS9BNHBINk1kT2dwQndQV2w3?=
 =?utf-8?B?R2I3VzZEZHZvcTVyR0FXdmwrTXZJWndpazdJeHEweGlSM2J5U0daSnNQMHhZ?=
 =?utf-8?B?c1N5SzBIcElGNjJrVGJBc1hheDIwYmxiTEhjV0FtV2JuRHZUTEVNSERpU2Vi?=
 =?utf-8?B?UEh0eEhKWHR0a3JHK1JyYTVkY2VsZENQcFBtc0QzTVNaT2g2enRUWFFYbEd5?=
 =?utf-8?B?MlMyZ25CcEgrZUdGMElQcjhkajd4WU9wTHlRTzF0bzBkWUxsK1M2YUUvT1BB?=
 =?utf-8?B?VU9UaDRFVENyOUhEMGVMOVp5U3NtNUM4akM5UFlRNUZnMGxsTEhLTTBIcnJy?=
 =?utf-8?B?bUVPdUxyKzl0YmtHQ1YvZkhQK3BTVnpoV2cvTTgxNWZZcUZseTFQMVZvU0xo?=
 =?utf-8?B?dm9rSjFtYlBrRnExdlB4b2xHcC9rb25PL0xmakJMRG1yZjhxTHdOWm5Od2ND?=
 =?utf-8?B?ZWV1YkQrUGt4YlZvdVRRa0NUZWpSajRaM2tidjFKamFCYU9UdDlSZGFjdGdN?=
 =?utf-8?B?dXFBejhYSVBML0x0ZHZQZEd0ZHZla2ZScFViWlBvZ3ovUkRWS3VkOFpUQU8z?=
 =?utf-8?B?QkltbTBuUFJYdy9WUXpIRGorR0JRSDhNbytJN1pYNXRqejFCQlFBU25PcTRm?=
 =?utf-8?B?NWJaTTNQRWFvS3lXY2JjYXArUlRJQ01IVGUxS0g3ZXhTWEliSVFyZUpMZmJE?=
 =?utf-8?B?enNTQWtnU2ZiaGE2NnQxN2RUN1doZURoWjVHOXJsNTIzbTJvcllKKzU1eWtX?=
 =?utf-8?B?aGxHczRMbFY1SmIxb0s4L3RXWVN2QzcxVmcwVlFSOGlZalBXQXF3NUhQb2tF?=
 =?utf-8?B?WU9NYzdoRGN6K21tb2ZVUDlocE9LU0p2cVR6ek1hV05tZEZqM0cxRVFRdDhC?=
 =?utf-8?B?elNJTkNScTc3bmlIQUYyVnlRa0YrUkZHRDJ0SVpWQjg0YmlrZnZ0T0YwT3ZM?=
 =?utf-8?B?dTZkY3dLOHFTWnpTL1R6dGZPT3FUdTdobERiUUJmVU5qa1E3M2hacGkrYldV?=
 =?utf-8?B?QW5GVlh4ejdCWmVxeUROYmV4QThzeThwMmVHVUhqNyt6bW1yZ1NXQk1FdWFr?=
 =?utf-8?B?YVcxOUpxQ0hhMDZ4aW9panA3ZC9FOHNzcnZkVUpJNjgyazAxRnVjMGxrL0Rj?=
 =?utf-8?B?WjN4UVI0aW1qaC9NMktuUEZRZ0tRUlovWFFyU05NV1loYnpVWm5vUGRtcmtx?=
 =?utf-8?B?YXR0WjFzbVRyWEIxa3VURHRRRTNwOU5lWlVJMEZoU3JIb04yT0poRnJRUzM1?=
 =?utf-8?B?a01pN3laa251R1BoRk1GUXBYb0dYOVF2S1MrRXZlUzFRVmlXelA3R2w2SjZl?=
 =?utf-8?B?NHloWFNPUGdEeEZnNUt3V21PS1JaMVFVSE1VN3FTSk5Mc3ZDQXV6T1RFZ2RY?=
 =?utf-8?B?cE93RkovNEdxekNtcTJMRzZYQWRUMXZ4bXVhMzBKVnBYdkpCT2NhWG5aeDJO?=
 =?utf-8?B?N0pMRUNJL08rdDVGTGR2ZE9PdUlaM2Q0VUlkRXFGeGFjYzlFaVcxZ1QrTlNl?=
 =?utf-8?B?bld3a3FGNGk1WUJMS2lIcjk1anJQVERPeDZDeDd3OEREUXROcWdFRCtBVjdl?=
 =?utf-8?B?UCtVMVEvWTNFU0lSNEZMVEZnb2ZEaG1PYjBKSm5ocGh3bGJaVmVCV0VYNGFS?=
 =?utf-8?B?QTUxYWpOMnk2M2VMNzdvYzJmNEpYZWNrNmUxSTJnTnJwdXNhUjhIdnJ3UFVl?=
 =?utf-8?B?RHExSWhXK01saHdqeHl6VEJ1REs1Y1BFU2U1ZHIyb2FYODVPT2pWTmRrNnVp?=
 =?utf-8?B?cE5CRW1CSXpRcjVibG1QdTl6VXhweC80dDlOMmZycHAzQVRiTUduZUtYemk3?=
 =?utf-8?B?b0szTHJRSW4wbGNvSXRlSUxHekdtYXdWenlzc0Rva3R5U3ljNmppM2c3Nklx?=
 =?utf-8?B?aW13dnk3bDk5bStucHJJRTFmOHUycXNob0dTUHBzV1ZkU3VtOURJbXR4bSt6?=
 =?utf-8?B?cWpmQVZVa3pzOHhTR0lNREp5QUh5VVBWR3Z6SGNVeW83QVRaeS8rWTFwNFB1?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c3eb2a-0254-4366-e6be-08de0ccb36a7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:46:46.8954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFh9DH72LgiWiDjNj+n1r0IYF/cujPwTiBO8vOOzpuyWqPNOaIfoSBSIkBNAujo6qGApaJ/lmKANqZDaYFxRgliHI+mqbplJNnqc2dbBUCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-paź-15 11:12:09 +0200]:
> After doing tweaks to the VFs provisioning we may want to restore
> back the auto-provisioning mode. Allow that unless VFs are still
> enabled. This can be also used to release all VFs resources.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c   | 63 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h   | 11 ++++
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 18 +++++++
>  3 files changed, 92 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index 97636ed86fb8..a81aa05c5532 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_debugfs.h"
>  #include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_provision.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_tile_sriov_pf_debugfs.h"
> @@ -43,6 +44,66 @@ static unsigned int extract_vfid(struct dentry *d)
>  	return p == extract_xe(d) ? PFID : (uintptr_t)p;
>  }
>  
> +/*
> + *      /sys/kernel/debug/dri/BDF/
> + *      ├── sriov
> + *      │   ├── restore_auto_provisioning
> + *      │   :
> + *      │   ├── pf/
> + *      │   ├── vf1
> + *      │   │   ├── ...
> + */
> +
> +static ssize_t from_file_write_to_xe_call(struct file *file, const char __user *userbuf,
> +					  size_t count, loff_t *ppos,
> +					  int (*call)(struct xe_device *))
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct xe_device *xe = extract_xe(dent);
> +	bool yes;
> +	int ret;
> +
> +	if (*ppos)
> +		return -EINVAL;
> +	ret = kstrtobool_from_user(userbuf, count, &yes);
> +	if (ret < 0)
> +		return ret;
> +	if (yes) {
> +		xe_pm_runtime_get(xe);
> +		ret = call(xe);
> +		xe_pm_runtime_put(xe);
> +	}
> +	if (ret < 0)
> +		return ret;
> +	return count;
> +}
> +
> +#define DEFINE_SRIOV_ATTRIBUTE(OP)						\
> +static int OP##_show(struct seq_file *s, void *unused)				\
> +{										\
> +	return 0;								\
> +}										\
> +static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
> +			  size_t count, loff_t *ppos)				\
> +{										\
> +	return from_file_write_to_xe_call(file, userbuf, count, ppos,		\
> +					  xe_sriov_pf_##OP);			\
> +}										\
> +DEFINE_SHOW_STORE_ATTRIBUTE(OP)
> +
> +static inline int xe_sriov_pf_restore_auto_provisioning(struct xe_device *xe)
> +{
> +	return xe_sriov_pf_provision_set_mode(xe, XE_SRIOV_PROVISIONING_MODE_AUTO);
> +}
> +
> +DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
> +
> +static void pf_populate_root(struct xe_device *xe, struct dentry *dent)
> +{
> +	debugfs_create_file("restore_auto_provisioning", 0200, dent, xe,
> +			    &restore_auto_provisioning_fops);
> +}
> +
>  static int simple_show(struct seq_file *m, void *data)
>  {
>  	struct drm_printer p = drm_seq_file_printer(m);
> @@ -167,6 +228,8 @@ void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
>  		return;
>  	dent->d_inode->i_private = xe;
>  
> +	pf_populate_root(xe, dent);
> +
>  	/*
>  	 *      /sys/kernel/debug/dri/BDF/
>  	 *      ├── sriov		# d_inode->i_private = (xe_device*)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> index dd1df950b021..4a4340fb633a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> @@ -37,6 +37,17 @@ static inline int xe_sriov_pf_get_totalvfs(struct xe_device *xe)
>  	return xe->sriov.pf.driver_max_vfs;
>  }
>  
> +/**
> + * xe_sriov_pf_num_vfs() - Number of enabled VFs on the PF.
> + * @xe: the PF &xe_device
> + *
> + * Return: Number of enabled VFs on the PF.
> + */
> +static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
> +{
> +	return pci_num_vf(to_pci_dev(xe->drm.dev));
> +}
> +
>  static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
>  {
>  	xe_assert(xe, IS_SRIOV_PF(xe));
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index 7e74175db972..32c281c1dc5d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -70,6 +70,11 @@ static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  			xe_gt_sriov_pf_config_release(gt, n, true);
>  }
>  
> +static void pf_unprovision_all_vfs(struct xe_device *xe)
> +{
> +	pf_unprovision_vfs(xe, xe_sriov_pf_get_totalvfs(xe));
> +}
> +
>  /**
>   * xe_sriov_pf_provision_vfs() - Provision VFs in auto-mode.
>   * @xe: the PF &xe_device
> @@ -117,6 +122,10 @@ int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>   * When changing from AUTO to CUSTOM mode, any already allocated VFs resources
>   * will remain allocated and will not be released upon VFs disabling.
>   *
> + * When changing back to AUTO mode, if VFs are not enabled, already allocated
> + * VFs resources will be immediately released. If VFs are still enabled, such
> + * mode change is rejected.
> + *
>   * This function can only be called on PF.
>   *
>   * Return: 0 on success or a negative error code on failure.
> @@ -128,6 +137,15 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
>  	if (mode == xe->sriov.pf.provision.mode)
>  		return 0;
>  
> +	if (mode == XE_SRIOV_PROVISIONING_MODE_AUTO) {
> +		if (xe_sriov_pf_num_vfs(xe)) {
> +			xe_sriov_dbg(xe, "can't restore %s: VFs must be disabled!\n",
> +				     mode_to_string(mode));
NIT: I would consider a higher level of logging here.
> +			return -EBUSY;
> +		}
> +		pf_unprovision_all_vfs(xe);
> +	}
> +
>  	xe_sriov_dbg(xe, "mode %s changed to %s by %ps\n",
>  		     mode_to_string(xe->sriov.pf.provision.mode),
>  		     mode_to_string(mode), __builtin_return_address(0));

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
