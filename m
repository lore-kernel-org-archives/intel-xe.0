Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90D9D1038E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 22:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CB710E3D1;
	Thu, 24 Oct 2024 22:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiGb0GnI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C8B10E3D0
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 22:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729810747; x=1761346747;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qau+e8DfUBzhwk9qj0xUesj4aWiiBDyYqHb57tEwmpg=;
 b=BiGb0GnIk25rZ2WwMNQkxn7/KUZ7dTtg7DdKKpCOZpApafVJzdhh+kKQ
 fr4sTUyfV/WTOyfNRj/S3YE1w+6WSJW1wecA0CZpE27ynLRaJ4xDEaTS0
 8PgER1Cecpw6zzcsjFOx8E0twpvNdsUz1jxRlFOYHeTbl1yTF/UqPvaaP
 9wYCcDbDgd0P02T5gaDWI6mRRN4tRmdH0cAni9TM1cQiqP73K1ros8mhj
 7LP/3BBKFK0CbirwBLKdI+1bcLX1XLa8L0mmaQrS5Erogt1MQyPxuSP/c
 +QOHh4tcpOMOH82X++n/D7ZjvpiRGplrLKDfTPwE/3CD13qI7uJVuNvh/ w==;
X-CSE-ConnectionGUID: ER1uTBceRNaA18YcsUvqmg==
X-CSE-MsgGUID: TTGPBOLKQHi/ZTnL04WRfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40005062"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40005062"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 15:59:06 -0700
X-CSE-ConnectionGUID: E7L8/c6hQc6kaxeCveyLoA==
X-CSE-MsgGUID: nvT+qztCTGGLuGZ34R94BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="85326471"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 15:59:07 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 15:59:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 15:59:05 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 15:59:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFEbH4NE+Hdv4nFoJdMGVqM1dCkK403AxHvTpZLU1ZaO3Fd895ZBAw/m9v5Ge0ewtrZhUsqk/88NYtlfEYB3jFGdRA3eBoTv//ntrFTRuiwN0hjDfGU0HtQ3H8DAGj6m0YI1zeL+p/NkLGfQDLBnVSmushcGxjUTBja9XPs7mwO83OEYooYvT7NeP50il4js4e19rpsne66k8znJB8EfOHIv1JrR2osCaLmZDFWEMGmE0bgqMYlomfV3FTGp8/p2dtiZDZ+jNrIqaNMdNxq8xzQeftdbU3v4jDIsxCm5kOpVI1Z0hNviHaRwdyiWk25G61Ee33jJOhQR0/uN/PG+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4ID1Zsd14LxWf7i1HRHnL3V+4jCfsS6ZjbYCPn8Uc4=;
 b=vReRNTBWPGqHfQyTgxR7MY5WLN8pDD8liAUpbanZDuU7FJ7c3zLQOtre6i3nGHCiF1lQpyqdP+QJUzKS6yBYpT7PH94KC3XMTHHcHKZ/TaEtCp7IIo4l3VlEuBPXGULdj6dZFj0YQjKNi6EZCoNwDFJPuFN0WUwQz9E1dasC4OLm4y0zbseQvJK9REHmDAI7DEjJIl+gXchyuNHn1WBR+9NpQsZ4jbfDeJmbFYKhYzaBW+IyOXUPff+/OP/jtFy+pd35BwYP+LYCE+iRfQdXxmshHgbvZI+Vy/VvBAQZ/Pan3lvIqyXwnYuaU+5FrEXGJeWDt5SfAgL4uymspks53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by CH3PR11MB8383.namprd11.prod.outlook.com (2603:10b6:610:171::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 24 Oct
 2024 22:59:01 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041%7]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 22:59:01 +0000
Message-ID: <20d34a36-b8fa-4004-b96f-3bc3fa56de5f@intel.com>
Date: Thu, 24 Oct 2024 15:58:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pmu: Enable PMU interface
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>
References: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
 <20240927002344.2565250-2-vinay.belgaumkar@intel.com>
 <Zvb43kW5pt4628HK@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Zvb43kW5pt4628HK@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|CH3PR11MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: d6df4ce5-bd60-4b20-91f6-08dcf47f733b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2g5Ni9KYlk2eXFMQjluM1ozaFhpZDdlMC9GZFhGWWpiY1VOSm9PQ3JuSVZY?=
 =?utf-8?B?R2xHUE95S1kxYldPeFA4bFZxKzNVSjd6U21RSkllMjMzeXE0Qld3S2xoNEdQ?=
 =?utf-8?B?eVF2UUFZcEVSQ3NnWkl0ZkI3ZmJIZGljWUc5RjZDTmRLWDZ5M2RLclc4TE8r?=
 =?utf-8?B?T2ErdkJQYUtZTFd4R1RDSDc1VUFPbXpUdG9QOXVReTNwcXBIdDF3U1hkcWRT?=
 =?utf-8?B?WlVZUmJWMlI5TEpvYkRrS1Q3T1JuWHRkZmVPc0dWbzhCWG43anQ0VUFZbE1V?=
 =?utf-8?B?S1lsM01KQkh2LytTVXpXTnluWkNHNkEyL0Ird01SblhxNm9MZnVoVmxPNmll?=
 =?utf-8?B?NTZ6dnRRRTNHZ09FQ1JWWGxWUGl6WkdML3NSSUpzakRPdUpYZk9KZ0NhaFFG?=
 =?utf-8?B?ZGgrRjRWTHQ0NWJuS1ByTUY0bFdVQWwzL2R4ZGlRLzdyK3NSSG9HaEY2Qlpu?=
 =?utf-8?B?YjlOOXk3YTI0R3hXc1ZNRkxzaUdkc1lKWFFQVVFZV05lT2JyYzNxR2ljaVkv?=
 =?utf-8?B?SEVVMEUyV1VGNEY0c211dWpWMmE5ZjFLWmsyVEh0K3drQlo4T2hoZDhYM29u?=
 =?utf-8?B?ZVFxYjMrbFZwdSt2dGZ3N3BYNG5tUHcvVHBZa2h1L0dWd0RFMXMzVE9HeGxx?=
 =?utf-8?B?ZjlMZlFtaGlCRDVjRGVtLzBCUU5OYWhMZWxHaENETkVrbDhFdmFsOWMrWm5W?=
 =?utf-8?B?RjNWZ0p3cXhPZ3phMWZNVGVrQ0VlNzRHYVZ1a0gzOUQ1NmhSN1R2OVNpUS9q?=
 =?utf-8?B?SGxuYWhDRVA4UkxDMklvUnFISUNKTjlMRDJydjlMbXNnZ2FBU3YxVW90eUVm?=
 =?utf-8?B?WFFCaTB3TWQ3SXgza1hHRlFNNkVKOXR2MmZkWU83UUQ4ZDVzV29ITENZR005?=
 =?utf-8?B?SllQbkN6UEdLZFBBbW92NXZhbm02c21QQmxDb09pTzE2Y3pOMU9Xc1lwU1ZL?=
 =?utf-8?B?QmVveDVmKzN0MjcweVQxaExtN1hvT2U4VWx0eEN3YTU1a2xyanJRVktTSVpS?=
 =?utf-8?B?QU5XVS92a2I3cm5QUjVEWEdsUzF2SlBrK1dRNGo0UnUyU1g1MkxFYVNOUjlO?=
 =?utf-8?B?UlBPaTF3RWYwdytnM2l0WWR4UDMwMzVLV3hQNmJQR1V4M3FuQ3M1YU8rVzZY?=
 =?utf-8?B?NlFCZlVEaHF6TXJwZGM2YWhNOTFJRmVjajliakU5VTZJL1JMdmVKcndWYWlY?=
 =?utf-8?B?cUpNS3NZd2VDZ1QybmsrU2c2QlNSdnlUd2pidWU5UFpKZmc1c2NLNTZPN1c3?=
 =?utf-8?B?TTQwV0pERXFIRDlUSUpmN1RBcG5iRktvVzFUZXhIeGc4SHp1cVE3dWFFMmZS?=
 =?utf-8?B?ZnN6WmdPUmRMa29ZZnhMRjJhNEN4bnJvMXdyTWNYbUFNdnJPdFBORE96cDlt?=
 =?utf-8?B?SUJFTUx4SFZXSWNxREpuRkhsNm5GRStoWVhYYkh2WWkyYnZYZnc5NFNEcDFs?=
 =?utf-8?B?L0Z4aGZWajZmazg2d25ZNU95eFJWZXlKc3VOajhpeDhBd0RBa0JqQjdlcitm?=
 =?utf-8?B?L2krTWlCSStmVHdTdXRVdWR2MWZaL3YxTkFDejJaR0RjNHpxWWJFVkpkdEZZ?=
 =?utf-8?B?aTZTUUtGYzFkV0djTDNpem5DT0p2c3ZnOEM0bG9hbER3NzBnSnNCbWZaNDRU?=
 =?utf-8?B?YzVkVDZITDVwajhoampHbFRoOE1jMnRMZm9jM0FkbmlhY0hUTTZoeERqa1dS?=
 =?utf-8?Q?JlZHVuELJJmebKRipt4p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RENUbVF1cnJ2U1NrYkJMN0o0NnU1TFpIYUM4VEVBVXJhNnNWbENOV1cxbDNZ?=
 =?utf-8?B?UlJvNkFSbU1TSlRhTkxpRW1TMVlrT21nV1QvV1laTjYzYUF4TXlrRTVGMmV4?=
 =?utf-8?B?YlRQdE1EeXpsb0JoSmpUTkdjcWRPR1VZL0kzOW5Mb29TMjhvcFRVZkk5S0h1?=
 =?utf-8?B?MUoxTVdwYW1PdXVDdW1KRnlRUFlOMlN1a28rRnpaOUZHZ3JtQkpkQjBuZnNj?=
 =?utf-8?B?aXBhUm9lQTZzdm94anpYbnJia2IwY3A5Z1krVFZWcXpMWWV6OG5TQ1M4dGN0?=
 =?utf-8?B?c3ZPUXdycE8yb0lSQVZrWlE2RDF1OGpIb0tNblkxanIrcndVQTl0YjNTSDlX?=
 =?utf-8?B?NFlja2gyM0ZzZ09EOHhKbncwbTB6a3R1YzM5ZCtRVGdXK2FvVEtua0Nyck5G?=
 =?utf-8?B?L0lNc042Z1NmTU05S0ZMcGZpSWI2UkZBdC9sZ2xwdFg0ZlpCSHVOM0ROUTR1?=
 =?utf-8?B?S2JSL3ZUU2hpOXJlV1h0NEYzb1ZSVW1DczV0eTRMV2JYc2ZkVUtXSk1EWi91?=
 =?utf-8?B?OHZnVlFsc3FSMHpGZlJmS0xuWWxtSzFEZS93YjJUWHZ4bXYxUmU5RERDaGg5?=
 =?utf-8?B?ZnVQS1lJNzE4UFFWVGdqbjhJVC9KVDdtOUMxRHYyT2hWcXdONFFMQmFGWmxQ?=
 =?utf-8?B?MmNXL2phWUhOWTBzcDlERnBJSmJxMkZDR3V4eW1Rc2VIMVZJb1JIbis0R1ZJ?=
 =?utf-8?B?OGs1TzhCWUQ1SGdlbm1nUkZqU2lwRWp0R2JHTDhhZ0VKa0wyVjBERUpaN0Qv?=
 =?utf-8?B?NndFWnp1WTArd09paHdMU01IWkRhN3RuYmd2Rk1iVVVPWEM1aEhHclpqL0NB?=
 =?utf-8?B?Y2hnOTZ0enNoTm9DVmVWeDNVbVNDZkQ3ZDk5dGZYMEtZbTN0akx5TVZ3MTIv?=
 =?utf-8?B?WVRraXFLUzNheHBNRDZNcStqYUg4U2pJVUVUakNNR1pmMDAzQmU0QzdqanRV?=
 =?utf-8?B?SU95Vm92MGlnUVkvRU5XUTBkQk0wWkhTQkFUTDlpS2FFTmdSTlRuajlHSG5w?=
 =?utf-8?B?OElTZjBUN0orMDZOdjMwM3hvdWlHNHVVMjdrVm90N0lpTVpYMCtZMWtBUkVK?=
 =?utf-8?B?eUpocGtLa1dsb2k4T0M2cHh2MmYzM21UaHB1TzBvdXBLMGtuSVFkMlhrZFVj?=
 =?utf-8?B?T0ltejFTMUpVbDFvR1F0ODhvNEhySm9CbUVTTzcveWlpaURKMmxkVE1Sdlh0?=
 =?utf-8?B?K0Z4Z3hhc3N4Z1BaV3ZMdzRiMjRGVUJkZDZVc29QNlB0eXhLRkVkdnR2VDk4?=
 =?utf-8?B?bVIyR2Y2cmgrQVNlc0VCRFRxanljaS83bXNkOG1SRlIrVDh3M3o2ZjJqSVgw?=
 =?utf-8?B?YXNTNGdPVWlwcngxbjJ6ZW0rMVozTzRMVjV6eE1vcFFQZTAxQWpFeW5Demdv?=
 =?utf-8?B?OC81SFZ6blRqOEc0NnNCQzVPdDBiTHFabUx5T0s0eklBUDVadmtQMko2aTRQ?=
 =?utf-8?B?eEoydzN5d0pOWjJkY2Q3K2NUMklJd2drTTJsMU1SYVJKc1liNE5HZDhRMTBM?=
 =?utf-8?B?enU4WjNGSHl6Z2gxKzNodWFJWHNOZ1hYQkw4UWw4N0h6M3U5Z05qRXJMMElT?=
 =?utf-8?B?WEIvNU9VQ1I2WWd6dGVUK0ZIQXpPMWYzYVRnbHhkUUs2cTlwQkc0K3dmV1dI?=
 =?utf-8?B?Qjg3eGVRMGVqUVZraCtlcVN5Um0rWDVoMjFqOTY4dFAzRTFZOWhWalJ5M1dR?=
 =?utf-8?B?QUttTUhNQy85Q2dJakpTV1lObWhrTHl0NE1wUXIwakgyRUh0amJkdFpEVW92?=
 =?utf-8?B?YTBnSlJxMmUydkF6SEI5bjRDNlBWM28zckR1c1Q3dDdZUjdYRHRzT01RRUJJ?=
 =?utf-8?B?SXg1UWlGcU83WVY1WXVFK2dsYmVtSWVjV2R1TGZRVmIyZFJSSzBLQWd3bEFk?=
 =?utf-8?B?THRrOTRZbDFURDFOUVYwaGtUcFd6Z2xtRkpLOUhmYjNLRTdQSFkvUmIwakUx?=
 =?utf-8?B?Q0NrTTJMNWZRV0syNXYweUpnbnhGU0tkNEJ3QTUzQVYxV3RMd0JoWFpEai9k?=
 =?utf-8?B?YnFMTWsySlY4a3dMTzlzaTdER3ZVemU1RU83S0xKcWFpS1BZZm9hU2d6dlAy?=
 =?utf-8?B?NURXcTI0N1dTVzN4anVjc2FuRmJiZWJnTEQzY285bTBrYzdTOUlyN3ZlREl3?=
 =?utf-8?B?VWJ3TkMrQ21CWmZZRmp3Y05xVXB1N0hpb2U4dGl0TThNVkZLamxnUG43eHFv?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6df4ce5-bd60-4b20-91f6-08dcf47f733b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 22:59:01.3353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQMxkcqq8N4UbZ8AW6o0eXlE5hDwpfAMfl6SCtpH/t+CeCT6NVlKhbJPGu1WsQWUBnxGQkUjsTYGmpwHcyqIdKb8BmLo3z+5RpHbVhduWHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8383
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


On 9/27/2024 11:26 AM, Rodrigo Vivi wrote:
> On Thu, Sep 26, 2024 at 05:23:42PM -0700, Vinay Belgaumkar wrote:
>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>
>> Basic PMU enabling patch. Setup the basic framework
>> for adding events/timers. This patch was previously
>> reviewed here -
>> https://patchwork.freedesktop.org/series/119504/
>>
>> The pmu base implementation is still from the
>> i915 driver.
>>
>> v2: Review comments(Rodrigo) and do not init pmu for VFs
>> as they don't have access to freq and c6 residency anyways.
> sorry for the slow review and for not going through it all
> in a single pass.
>
>> v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani)
>>
>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |   2 +
>>   drivers/gpu/drm/xe/xe_device.c       |   6 +
>>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>   drivers/gpu/drm/xe/xe_module.c       |   5 +
>>   drivers/gpu/drm/xe/xe_pmu.c          | 570 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>>   drivers/gpu/drm/xe/xe_pmu_types.h    |  63 +++
>>   include/uapi/drm/xe_drm.h            |   8 +
>>   8 files changed, 684 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index ae245fbd91ee..3a3eabc0e0a3 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -293,6 +293,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>>   		i915-display/intel_pipe_crc.o
>>   endif
>>   
>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>> +
>>   obj-$(CONFIG_DRM_XE) += xe.o
>>   obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index cb5a9fd820cf..027a796d7431 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -762,6 +762,9 @@ int xe_device_probe(struct xe_device *xe)
>>   	for_each_gt(gt, xe, id)
>>   		xe_gt_sanitize_freq(gt);
>>   
>> +	if (!IS_SRIOV_VF(xe))
>> +		xe_pmu_register(&xe->pmu);
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>   
>>   err_fini_display:
>> @@ -806,6 +809,9 @@ void xe_device_remove(struct xe_device *xe)
>>   
>>   	xe_heci_gsc_fini(xe);
>>   
>> +	if (!IS_SRIOV_VF(xe))
>> +		xe_pmu_unregister(&xe->pmu);
>> +
>>   	for_each_gt(gt, xe, id)
>>   		xe_gt_remove(gt);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 5ad96d283a71..51485d2eadcf 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -18,6 +18,7 @@
>>   #include "xe_memirq_types.h"
>>   #include "xe_oa.h"
>>   #include "xe_platform_types.h"
>> +#include "xe_pmu.h"
>>   #include "xe_pt_types.h"
>>   #include "xe_sriov_types.h"
>>   #include "xe_step_types.h"
>> @@ -513,6 +514,9 @@ struct xe_device {
>>   		int mode;
>>   	} wedged;
>>   
>> +	/** @pmu: performance monitoring unit */
>> +	struct xe_pmu pmu;
>> +
>>   #ifdef TEST_VM_OPS_ERROR
>>   	/**
>>   	 * @vm_inject_error_position: inject errors at different places in VM
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 77ce9f9ca7a5..1bf2bf8447c0 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_hw_fence.h"
>>   #include "xe_pci.h"
>>   #include "xe_pm.h"
>> +#include "xe_pmu.h"
>>   #include "xe_observation.h"
>>   #include "xe_sched_job.h"
>>   
>> @@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
>>   		.init = xe_sched_job_module_init,
>>   		.exit = xe_sched_job_module_exit,
>>   	},
>> +	{
>> +		.init = xe_pmu_init,
>> +		.exit = xe_pmu_exit,
>> +	},
>>   	{
>>   		.init = xe_register_pci_driver,
>>   		.exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..bdaea9ca1065
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,570 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +#include "xe_macros.h"
>> +#include "xe_pm.h"
>> +
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
> Please no global variables. Think the case where we have
> more then 1 device in the same cpu.
As per offline discussion, will retain this with a meaningful comment 
about it.
>
>> +
>> +/**
>> + * DOC: Xe PMU (Performance Monitoring Unit)
>> + *
>> + * Expose events/counters like C6 residency and GT frequency to user land.
>> + * Perf tool can be used to list and record these counters from the command
>> + * line.
>> + *
>> + * Example commands to list/record supported perf events-
>> + *
>> + * >> perf list
> perhas '$' instead of '>>' ?
ok.
>
>> + * >> ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
> perhaps ls -ld /sys/bus/event_source/devices/xe_*
>
> to first know which devices are available?
ok.
>
>> + *
>> + * To record events-
>> + * >> perf stat -e <event_name> -I <interval>
> Could you please document here on how to ensure that those small incremental
> values should be read?
> How can I use this perf command and ensure that we get exactly the
> same value as our other sysfs entries?
> I'd like to do the math back to cross-check at least, but also
> this information should be useful to ensure that users of this
> are really well informed on the flow.
Sure. Will add to that to the doc in the following patches where I add 
the RC6 and freq events.
>
>> + *
>> + */
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +	return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>> +{
>> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +	drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +	drm_dev_put(&xe->drm);
>> +}
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +	unsigned int gt_id = config_gt_id(config);
>> +
>> +	if (gt_id >= XE_PMU_MAX_GT)
> why do we have new GT defines instead of using the regular GT
> numbering and entries?

I cannot include xe_device.h in xe_pmu_types.h as it leads to circular 
definition. I am suspecting that's why this was redefined in the 
original patch.

Thanks,

Vinay.

>
>> +		return -ENOENT;
>> +
>> +	switch (config_counter(config)) {
>> +	default:
>> +		return -ENOENT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	int ret;
>> +
>> +	if (pmu->closed)
>> +		return -ENODEV;
>> +
>> +	if (event->attr.type != event->pmu->type)
>> +		return -ENOENT;
>> +
>> +	/* unsupported modes and filters */
>> +	if (event->attr.sample_period) /* no sampling */
>> +		return -EINVAL;
>> +
>> +	if (has_branch_stack(event))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (event->cpu < 0)
>> +		return -EINVAL;
>> +
>> +	/* only allow running on one cpu at a time */
>> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +		return -EINVAL;
>> +
>> +	ret = config_status(xe, event->attr.config);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!event->parent) {
>> +		drm_dev_get(&xe->drm);
>> +		event->destroy = xe_pmu_event_destroy;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	const unsigned int gt_id = config_gt_id(event->attr.config);
>> +	const u64 config = event->attr.config;
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +	u64 val = 0;
>> +
>> +	switch (config_counter(config)) {
>> +	default:
>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +	}
>> +
>> +	return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct hw_perf_event *hwc = &event->hw;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	u64 prev, new;
>> +
>> +	if (pmu->closed) {
>> +		event->hw.state = PERF_HES_STOPPED;
>> +		return;
>> +	}
>> +again:
>> +	prev = local64_read(&hwc->prev_count);
>> +	new = __xe_pmu_event_read(event);
>> +
>> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>> +		goto again;
>> +
>> +	local64_add(new - prev, &event->count);
>> +}
>> +
>> +static void xe_pmu_enable(struct perf_event *event)
>> +{
>> +	/*
>> +	 * Store the current counter value so we can report the correct delta
>> +	 * for all listeners. Even when the event was already enabled and has
>> +	 * an existing non-zero value.
>> +	 */
>> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>> +}
>> +
>> +static void xe_pmu_event_start(struct perf_event *event, int flags)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (pmu->closed)
>> +		return;
>> +
>> +	xe_pmu_enable(event);
>> +	event->hw.state = 0;
>> +}
>> +
>> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> +{
>> +	if (flags & PERF_EF_UPDATE)
>> +		xe_pmu_event_read(event);
>> +
>> +	event->hw.state = PERF_HES_STOPPED;
>> +}
>> +
>> +static int xe_pmu_event_add(struct perf_event *event, int flags)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (pmu->closed)
>> +		return -ENODEV;
>> +
>> +	if (flags & PERF_EF_START)
>> +		xe_pmu_event_start(event, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_pmu_event_del(struct perf_event *event, int flags)
>> +{
>> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
>> +}
>> +
>> +static int xe_pmu_event_event_idx(struct perf_event *event)
>> +{
>> +	return 0;
>> +}
>> +
>> +struct xe_ext_attribute {
>> +	struct device_attribute attr;
>> +	unsigned long val;
>> +};
>> +
>> +static ssize_t xe_pmu_event_show(struct device *dev,
>> +				 struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_ext_attribute *eattr;
>> +
>> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
>> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
>> +}
>> +
>> +static ssize_t cpumask_show(struct device *dev,
>> +			    struct device_attribute *attr, char *buf)
>> +{
>> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>> +}
>> +
>> +static DEVICE_ATTR_RO(cpumask);
>> +
>> +static struct attribute *xe_cpumask_attrs[] = {
>> +	&dev_attr_cpumask.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>> +	.attrs = xe_cpumask_attrs,
>> +};
>> +
>> +#define __event(__counter, __name, __unit) \
>> +{ \
>> +	.counter = (__counter), \
>> +	.name = (__name), \
>> +	.unit = (__unit), \
>> +}
>> +
>> +static struct xe_ext_attribute *
>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>> +{
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = xe_pmu_event_show;
>> +	attr->val = config;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct perf_pmu_events_attr *
>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>> +	     const char *str)
>> +{
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = perf_event_sysfs_show;
>> +	attr->event_str = str;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct attribute **
>> +create_event_attributes(struct xe_pmu *pmu)
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	static const struct {
>> +		unsigned int counter;
>> +		const char *name;
>> +		const char *unit;
>> +	} events[] = {
>> +	};
>> +
>> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>> +	struct attribute **attr = NULL, **attr_iter;
>> +	unsigned int count = 0;
>> +	unsigned int i, j;
>> +	struct xe_gt *gt;
>> +
>> +	/* Count how many counters we will be exposing. */
>> +	for_each_gt(gt, xe, j) {
>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +
>> +			if (!config_status(xe, config))
>> +				count++;
>> +		}
>> +	}
>> +
>> +	/* Allocate attribute objects and table. */
>> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>> +	if (!xe_attr)
>> +		goto err_alloc;
>> +
>> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>> +	if (!pmu_attr)
>> +		goto err_alloc;
>> +
>> +	/* Max one pointer of each attribute type plus a termination entry. */
>> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>> +	if (!attr)
>> +		goto err_alloc;
>> +
>> +	xe_iter = xe_attr;
>> +	pmu_iter = pmu_attr;
>> +	attr_iter = attr;
>> +
>> +	for_each_gt(gt, xe, j) {
>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +			char *str;
>> +
>> +			if (config_status(xe, config))
>> +				continue;
>> +
>> +			str = kasprintf(GFP_KERNEL, "%s-gt%u",
>> +					events[i].name, j);
>> +			if (!str)
>> +				goto err;
>> +
>> +			*attr_iter++ = &xe_iter->attr.attr;
>> +			xe_iter = add_xe_attr(xe_iter, str, config);
>> +
>> +			if (events[i].unit) {
>> +				str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>> +						events[i].name, j);
>> +				if (!str)
>> +					goto err;
>> +
>> +				*attr_iter++ = &pmu_iter->attr.attr;
>> +				pmu_iter = add_pmu_attr(pmu_iter, str,
>> +							events[i].unit);
>> +			}
>> +		}
>> +	}
>> +
>> +	pmu->xe_attr = xe_attr;
>> +	pmu->pmu_attr = pmu_attr;
>> +
>> +	return attr;
>> +
>> +err:
>> +	for (attr_iter = attr; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +err_alloc:
>> +	kfree(attr);
>> +	kfree(xe_attr);
>> +	kfree(pmu_attr);
>> +
>> +	return NULL;
>> +}
>> +
>> +static void free_event_attributes(struct xe_pmu *pmu)
>> +{
>> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
>> +
>> +	for (; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +	kfree(pmu->events_attr_group.attrs);
>> +	kfree(pmu->xe_attr);
>> +	kfree(pmu->pmu_attr);
>> +
>> +	pmu->events_attr_group.attrs = NULL;
>> +	pmu->xe_attr = NULL;
>> +	pmu->pmu_attr = NULL;
>> +}
>> +
>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> +
>> +	XE_WARN_ON(!pmu->base.event_init);
>> +
>> +	/* Select the first online CPU as a designated reader. */
>> +	if (cpumask_empty(&xe_pmu_cpumask))
>> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> +	unsigned int target = xe_pmu_target_cpu;
>> +
>> +	/*
>> +	 * Unregistering an instance generates a CPU offline event which we must
>> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>> +	 */
>> +	if (pmu->closed)
>> +		return 0;
>> +
>> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>> +
>> +		/* Migrate events if there is a valid target */
>> +		if (target < nr_cpu_ids) {
>> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
>> +			xe_pmu_target_cpu = target;
>> +		}
>> +	}
>> +
>> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
>> +		pmu->cpuhp.cpu = target;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>> +
>> +/**
>> + * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
>> + *
>> + * Returns: 0 if successful, else error code
>> + */
>> +int xe_pmu_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +				      "perf/x86/intel/xe:online",
>> +				      xe_pmu_cpu_online,
>> +				      xe_pmu_cpu_offline);
>> +	if (ret < 0)
>> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>> +			  ret);
>> +	else
>> +		cpuhp_slot = ret;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
>> + */
>> +void xe_pmu_exit(void)
>> +{
>> +	if (cpuhp_slot != CPUHP_INVALID)
>> +		cpuhp_remove_multi_state(cpuhp_slot);
>> +}
>> +
>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +	if (cpuhp_slot == CPUHP_INVALID)
>> +		return -EINVAL;
>> +
>> +	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
>> +}
>> +
>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>> +}
>> +
>> +/**
>> + * xe_pmu_unregister() - Remove/cleanup PMU registration
>> + */
>> +void xe_pmu_unregister(void *arg)
>> +{
>> +	struct xe_pmu *pmu = arg;
>> +
>> +	if (!pmu->base.event_init)
>> +		return;
>> +
>> +	/*
>> +	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
>> +	 * ensures all currently executing ones will have exited before we
>> +	 * proceed with unregistration.
>> +	 */
>> +	pmu->closed = true;
>> +	synchronize_rcu();
>> +
>> +	xe_pmu_unregister_cpuhp_state(pmu);
>> +
>> +	perf_pmu_unregister(&pmu->base);
>> +	pmu->base.event_init = NULL;
>> +	kfree(pmu->base.attr_groups);
>> +	kfree(pmu->name);
>> +	free_event_attributes(pmu);
>> +}
>> +
>> +/**
>> + * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>> + *
>> + */
>> +void xe_pmu_register(struct xe_pmu *pmu)
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	const struct attribute_group *attr_groups[] = {
>> +		&pmu->events_attr_group,
>> +		&xe_pmu_cpumask_attr_group,
>> +		NULL
>> +	};
>> +
>> +	int ret = -ENOMEM;
>> +
>> +	spin_lock_init(&pmu->lock);
>> +	pmu->cpuhp.cpu = -1;
>> +
>> +	pmu->name = kasprintf(GFP_KERNEL,
>> +			      "xe_%s",
>> +			      dev_name(xe->drm.dev));
>> +	if (pmu->name)
>> +		/* tools/perf reserves colons as special. */
>> +		strreplace((char *)pmu->name, ':', '_');
>> +
>> +	if (!pmu->name)
>> +		goto err;
>> +
>> +	pmu->events_attr_group.name = "events";
>> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
>> +	if (!pmu->events_attr_group.attrs)
>> +		goto err_name;
>> +
>> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>> +					GFP_KERNEL);
>> +	if (!pmu->base.attr_groups)
>> +		goto err_attr;
>> +
>> +	pmu->base.module	= THIS_MODULE;
>> +	pmu->base.task_ctx_nr	= perf_invalid_context;
>> +	pmu->base.event_init	= xe_pmu_event_init;
>> +	pmu->base.add		= xe_pmu_event_add;
>> +	pmu->base.del		= xe_pmu_event_del;
>> +	pmu->base.start		= xe_pmu_event_start;
>> +	pmu->base.stop		= xe_pmu_event_stop;
>> +	pmu->base.read		= xe_pmu_event_read;
>> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
>> +
>> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>> +	if (ret)
>> +		goto err_groups;
>> +
>> +	ret = xe_pmu_register_cpuhp_state(pmu);
>> +	if (ret)
>> +		goto err_unreg;
>> +
>> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
>> +	if (ret)
>> +		goto err_cpuhp;
>> +
>> +	return;
>> +
>> +err_cpuhp:
>> +	xe_pmu_unregister_cpuhp_state(pmu);
>> +err_unreg:
>> +	perf_pmu_unregister(&pmu->base);
>> +err_groups:
>> +	kfree(pmu->base.attr_groups);
>> +err_attr:
>> +	pmu->base.event_init = NULL;
>> +	free_event_attributes(pmu);
>> +err_name:
>> +	kfree(pmu->name);
>> +err:
>> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> new file mode 100644
>> index 000000000000..d07e5dfdfec0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_H_
>> +#define _XE_PMU_H_
>> +
>> +#include "xe_pmu_types.h"
>> +
>> +struct xe_gt;
>> +
>> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
>> +int xe_pmu_init(void);
>> +void xe_pmu_exit(void);
>> +void xe_pmu_register(struct xe_pmu *pmu);
>> +void xe_pmu_unregister(void *arg);
>> +#else
>> +static inline int xe_pmu_init(void) { return 0; }
>> +static inline void xe_pmu_exit(void) {}
>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>> +static inline void xe_pmu_unregister(void *arg) {}
>> +#endif
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> new file mode 100644
>> index 000000000000..ca0e7cbe2081
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_TYPES_H_
>> +#define _XE_PMU_TYPES_H_
>> +
>> +#include <linux/perf_event.h>
>> +#include <linux/spinlock_types.h>
>> +#include <uapi/drm/xe_drm.h>
>> +
>> +enum {
>> +	__XE_NUM_PMU_SAMPLERS
>> +};
>> +
>> +#define XE_PMU_MAX_GT 2
>> +
>> +struct xe_pmu {
>> +	/**
>> +	 * @cpuhp: Struct used for CPU hotplug handling.
>> +	 */
>> +	struct {
>> +		struct hlist_node node;
>> +		unsigned int cpu;
>> +	} cpuhp;
>> +	/**
>> +	 * @base: PMU base.
>> +	 */
>> +	struct pmu base;
>> +	/**
>> +	 * @closed: xe is unregistering.
>> +	 */
>> +	bool closed;
>> +	/**
>> +	 * @name: Name as registered with perf core.
>> +	 */
>> +	const char *name;
>> +	/**
>> +	 * @lock: Lock protecting enable mask and ref count handling.
>> +	 */
>> +	spinlock_t lock;
>> +	/**
>> +	 * @sample: Current and previous (raw) counters.
>> +	 *
>> +	 * These counters are updated when the device is awake.
>> +	 */
>> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +	/**
>> +	 * @events_attr_group: Device events attribute group.
>> +	 */
>> +	struct attribute_group events_attr_group;
>> +	/**
>> +	 * @xe_attr: Memory block holding device attributes.
>> +	 */
>> +	void *xe_attr;
>> +	/**
>> +	 * @pmu_attr: Memory block holding device attributes.
>> +	 */
>> +	void *pmu_attr;
>> +};
>> +
>> +#endif
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index b6fbe4988f2e..2c5f258eee3a 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1389,6 +1389,14 @@ struct drm_xe_wait_user_fence {
>>   	__u64 reserved[2];
>>   };
>>   
>> +/*
>> + * Top bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (56)
>> +
>> +#define ___XE_PMU_OTHER(gt, x) \
>> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>>   /**
>>    * enum drm_xe_observation_type - Observation stream types
>>    */
>> -- 
>> 2.38.1
>>
