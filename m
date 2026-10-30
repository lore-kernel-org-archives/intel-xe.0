Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24050606A32F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 22:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QdcfULye
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBEE10E0F3;
	Fri, 30 Oct 2026 22:37:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D4710E42F
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 22:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793399817; x=1824935817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bH+r5y2j+/oFWkQxVVo+JCUzF5dbKwoFR3lxyxBCBiY=;
 b=QdcfULyeq/2AJL14fQxjJ4ICLs4FnlXpZtzxiJvgtilRV2aoaTl3oQay
 /PXrf2PHDKLOE/gn2nT+kqmwstFcihdAsWvxdbPOaoPOskczbcKaAd1YS
 c+Qbc9CQYudZfGu5xDCh7Ur2mr9XXdol9Hm0GBb5yqgSGBeDT6V2p5f+V
 jsVlOSyusH/zPofJc3azDX5B+UZ3GpDh+6702/vA6IT+RtKRPOSSY3pLB
 LkFHwStlChMDGV5ctdfqknQIO3Hp2LVEwfea8u50sgQbEIjwo6Ist+gUw
 bb2lx8+K6CO15AEhZbXIAB31uxZsL1dM79aahu3NoFcdo7HO4V8thWPzQ w==;
X-CSE-ConnectionGUID: HdYW4O9zSrCLYTUwhTi6cQ==
X-CSE-MsgGUID: z0iXfg3kSpmb/Qv/nHriHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2199415"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2199415"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:36:57 -0700
X-CSE-ConnectionGUID: vs+OPB0IQYuF3ytLzVuPJw==
X-CSE-MsgGUID: QuNnwf9VStiE1jGmsz251w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5635215"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:36:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 15:36:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 15:36:55 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.36)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 15:36:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hawfaKWM5bsW7Ac56KnPWxwi7QO+L9RPTFJOBk1Gync8yU2YbeDCiV0aI8G+7NvoN63SFT8qgjRLcVcFjADfkZr+ea0uuSXDrqKROculOwX0KqRo4HZgasH0PRBcMW3b5GvKwbQD/JuMP5puuhpAixZwJWV8ogkgba/hVMOv6HuiKkAliOsnccP85lNMa2s8F+zOjGjrIMJLL9wzgdafYlxbEG0ZzMOHptVH/DdEje38wBWPuAgtQ1omQejYB5cJbmePli+owBnUT1G7XE4Q7sFy53HorHsxNgKSNdayxYhatYsi6O6n2ogOS2Qtb1MDPY0rOdcrkfWCRj+7yROCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fikVxNRQjuCKnr5kEQ0V66mE3ja2jKtcbhCNQEFd6Jg=;
 b=i0M03n7h+9PMNDq0GJEKfkj1Rn2xuHar+kRGH2zpC3r4VdGcm/Qkvn/sgE0nvkrcZ/rNy5QHMQ/jMqh4eKx6dpPBopEub9Xd8dKqZnmPRsOG0ScBTXpQU4CP8rKag28u6i3C9cJnKXZ5Y/+4AIPAIjQ7eHU9DvL3jiCPPdCs82zeMWc39oT68jX+m6+nm4yXhuBDE4vyvY8VWx42LQdfk0nClhfRPlEDM7EhJG0ppu46IlxCzw/pxgYe9nk3cZs6jllnK/jHUCd/2G8fNoOwm9XIXl2ql/FKA9PqiCaE9TyRCtLD/Nq6QzTxWNwOhM7f2gGrcxUJrHPkBDBPRvG0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH3PPFE60A892D7.namprd11.prod.outlook.com (2603:10b6:518:1::d59) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 30 Oct
 2026 22:36:48 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 22:36:47 +0000
Date: Fri, 30 Oct 2026 15:36:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
CC: <riana.tauro@intel.com>, <shekhar.chauhan@intel.com>,
 <harish.chegondi@intel.com>
Subject: Re: [PATCH v2 0/3] Cleanup OA stream on PCI unbind/remove
Message-ID: <auUb/LBzPyUExdo8@soc-5CG1426VCC.clients.intel.com>
References: <20261030223056.2266638-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261030223056.2266638-5-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: PH7PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:510:323::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH3PPFE60A892D7:EE_
X-MS-Office365-Filtering-Correlation-Id: 8296b646-d2bc-4fb2-1902-08df36d64834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261021121427099003|22082099003|18002099003|10067099003|261026121527099003|261021123027099003|11063799006|261009223027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info: JBWYEkhhNmTJektKe8CWL/JdR5+Dd6d+Sel58IDGpmWr+u4Kn2lIl/5GsVYliXINjoGX3Uaj+iIT44EXx6DRXWgoiJp7dKwvkDEvpwwCv3g3XC4rEVSH+pF0tngf9HgRGzLVpexRXRmkKA3cw931XiT8W9OMJhrgxRSfCtIdqbCohQQXYxBLh8E60SAc+iOPixRxQGFGz7IEkBLTeCxxYe4S1cib7N/+qAtQo+KNq8hJ9cqNxb1WW5C/cK/4keVCSGk2dmckdW1xP1a9TQ25nAmdyQNk4iZmlntv03U4FHBX4sF+1TuByDjUet1pQVVxMNQ+9fQqxI8cEvAgr2und/vRsBbsOf0ANYuU7T12mr0B3TU83bRp1Cc2J0V9WVrFtHZyDmlzdPxYfbdGmT+QR/gOc5hgw06yUHQfr3P1kgJUifyiB2kc4rUQzEwUbaJK6GzQ4UaEq347kbOydBijSbHyORoHmXBUVqIn9fpL1+w4xxjTBD0yMMv7nugBsgUOzOg+JJgWn040vW0Dfn0dcY9mRlEzuQD6ownBPpjY/IYZ+msOzdggHgaMy2FotcBesJDyO6C8ZAJaXVDz6A83/gFjhApDxZUt4Xw12LNtzlTu4uyV003BN39jS93xVeOdW87+h3Ap3dK2MvVNfafE1/CTslknH38e037OOJDpe5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261021121427099003)(22082099003)(18002099003)(10067099003)(261026121527099003)(261021123027099003)(11063799006)(261009223027099003)(56012099006)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YURtWEFUN0NvQ1pyNnRpc3VFQkdFYjg0bW4vVWZuSDZjNkNmYUJ0emd1UE1F?=
 =?utf-8?B?QnhvZzRzeHMySkRkRDY3SUVWZVpNcUtOaDZoQ2NOaFJjcmhTOC9oRGM3MExJ?=
 =?utf-8?B?RmZkL1FxVEJJRjhuSFRDc2wrZlRBbmg4TDNab0FTa0MyWmtJNUc0bjE2TzNJ?=
 =?utf-8?B?ckpaRU1Md0ZqYzJDd1lVbDhyVE9JdGJ1WE9IT3RFWmYreFNpRnJHci9nVThN?=
 =?utf-8?B?WjZFaFk0OWM3QUttWXJyYU1RRm12Y0kwTHVFdjRuazY2R2lhR2ExVFlnNndH?=
 =?utf-8?B?dlhSVW9CbVJ2cit6S3dHa2t6bFpnMVF0WllFWG9lUzlDVE9DMVg3MWYxcVND?=
 =?utf-8?B?VXd5WjJTTmFrRmFIQzd1RDlTaTVuSTQ2UnJUTmI5TXFUVkQzeXRha3ZwcTJD?=
 =?utf-8?B?enhzcE5TNmNzMFBwb1lxY3N4VFZRd0pYRTBiSGlxUDkrZk8vS3pxaEFXalpz?=
 =?utf-8?B?NkF6NWhKdWFKSEc2OWlZUEwxUzYxNGlyYkZPRWp4OUM1RVZxZklmd1J1a21Q?=
 =?utf-8?B?Mm1vSmY4ZmVEMmR3QUZYdHcxMTdxRTF5Qkp3a1hWU040VUQ3SHBLSG1rRy9i?=
 =?utf-8?B?OWpqVG84MFlSWWdaODA0Q0UvQ0pDRU0xRTJ4ZXI5RVdpSVFXdE9ZMkgzQnVK?=
 =?utf-8?B?ZlgyMHA3dmxzdU1Sb3VBam0yazRDYVlYU3RudjBERGMwSEF5cXNnaE5rNEp4?=
 =?utf-8?B?bGlkSk5OYmdmVkphcmRUc0JDQkVxTEY5Nitwa2NIMHZBVmlkamFsQ3F4M3BV?=
 =?utf-8?B?YnY2N2F1NTRsZzNYQVFKZnAxUkJtcWQ0aEhnNW91UXB0UHV4NTFpL1pqaG9C?=
 =?utf-8?B?OW92MlB1Mm5GMjJzZFhFK0pVaEthNDNNa0hTSU9FdFN1U3JuUDZHU1ZCd0Zi?=
 =?utf-8?B?TjdWV3YzM1V3SHhTMnRKSGpRTzNnSWlsOEtXSmUyVGVhOHRpSlRZeXpvZ0lv?=
 =?utf-8?B?dWhhb2E2c3JJc0I5MTV6RTdUTjBCQXoyL3h6bmRveHNzVjZOazNIRmZpcmE3?=
 =?utf-8?B?Ti9FTzNKYW5tTzJUem42aTd3TGVVSU5nd1NIcTVlRXBmcm9sdkYzdXM5Y1E1?=
 =?utf-8?B?Sm5ZamwvL1BIU3dZTGRoRU80TWU5aG1sTVI4ZVlkTDlIWUJpbC9XVk9RUllj?=
 =?utf-8?B?RWZxenB6a3gwNWF2TmNFTU9jN2Q0dUtJaXZYSkJtbXV6cFYra3ZJRS95Z0Yr?=
 =?utf-8?B?ZjB5Q080WElzeDczQmZXYzYzOTA2Y0xFYjlmS1JGVjJzM3NDOUZ0ZFpRNzAy?=
 =?utf-8?B?TjdxeWVjOWR2YWwwVExOT0w0OXVydjhjT1VCdE5UaTJHZHZaeFgwY2EyZVVB?=
 =?utf-8?B?RGVHRng5TVFYRXFSTk5BQnRnNWtMekR2NkFETFFhMDV2YkRlWGJKVlI5SmhV?=
 =?utf-8?B?NWUvcThFVjJNSCtVTDZhK3lCOWw3WS95RlY4dFhTUnRYN1VBdG9PVnA5b0ZP?=
 =?utf-8?B?WHNVTDdwY1VhODdlZ1hvSUJhb0JKUHN1MTFNMXhFaXBqd2dPc3pvRTdndFVT?=
 =?utf-8?B?NVFoWVRweStISS9BcEpmazMyWm9PMDNjL3l1a0M4ejVSZE1FTXh3L1B2eHVS?=
 =?utf-8?B?aURVQjFmMEo4T0xETTFqSlQrbGZnc2ZWYm9KL3RvaTFTRC92elpMNnM3Vnd3?=
 =?utf-8?B?SW1uVS9vWW5JT3kwN2p5bVRYdmkvb1ZYcE91RWRTclNuaGtERjFzMlpjTnps?=
 =?utf-8?B?dnlJUFNsVFdxQVQ1TC9QL2dhcEJZMkdGSTZ6L0tYalZNQUNZOFNoaVdBVElY?=
 =?utf-8?B?Tjk0Ni8vc09qZGhWWlFwMTJFemxQSFFDaDZsTmFLUUQydGI2L0JvaUM3RTJs?=
 =?utf-8?B?NURoZkZiSG8xNGZSZ0k0TGN3b3VtOEZvWFZNbWdLOE5NMEhGVkh4VHB1UDZx?=
 =?utf-8?B?akhQYTlSMkFhcDNsb25vVlBSdTc2N0t5cWkyNHdZQURaM05jTit1U3pKTUJH?=
 =?utf-8?B?UkZMWWszb21DTGxmc3hDVVFHQTJaaExTUXhQSjN2Y3hkdFNocGsyV2VJU09G?=
 =?utf-8?B?cTlPRGp6RmpoMXpnaWlMTTU1aVdKdXlHMHEwMXZiWXpQV2pTcHJyRk1sOWd3?=
 =?utf-8?B?Q1FXd3orOHNHR2MxRFAzdFlRZmM5b1NpNVcxVWRwYU5JdXFOSTNmQlJQSmVV?=
 =?utf-8?B?eXM4UThtTFJtNWxGL0JkZVVBYnp4c3YwNGtWYmJ6d2h3U2Z3cytIWTF6UVNW?=
 =?utf-8?B?WHBRS0t6VGZ0Z2lHaCtmVDVjemZiSnByaXpjclNtYU1WaHE2VFkxZUgvMzFR?=
 =?utf-8?B?cHNJRzc0ZE50OEFwdjRldnVXaXoyNWZGU2xsTkt4QUYvaVpXcmUzcTFMTnpl?=
 =?utf-8?B?VnhSY2Zhdnh1WUpzem14ZVhrWXRpbGRjc0luL1lybGlkT2pQYi9PSmFVN2pq?=
 =?utf-8?Q?FKJfu0zGq1H4OpEg=3D?=
X-Exchange-RoutingPolicyChecked: MFV/qWoULNkkcdRQsXsPt3yzUy6ZkJn3Um3MpFsxWSaG4MqJ2I9nx78cCp87V6U/xyOqht7fOAwmtl+MsUYgj2qNXwd+8ANpzwQmII/BykcAsGz7ZHUGJjRWbMc56CJE9AuS9VLs0aYEeSHhEU1q4v7lfKS1xBGjvh1HhFug9vvQovplhaWce9V9MaQlm3BK3mPVTn1MF2bUALIaWzFlYmQNHLegMZeGUXJpFYV6Y+FdZ8s6vPOPrLvJwpZ0aJOC+lRm04GUBvjRbpgINBljMM82LPCL1Bd0rAESBpDzMBMheNdtS0fr7DXtatw5xlbAvhFKaCD6POSxZ4g9EP492g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8296b646-d2bc-4fb2-1902-08df36d64834
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 22:36:47.3872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHTeD4/uiRbF57L5xIuxKfSN7g65MolbPqc8G2aM6EVv4euwBfdpmNtRJrjxS73yIRXvuydQbh+8/5R+C9Cogy7mokyAymNIgjgyjhil+gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE60A892D7
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Matt,

Please provide your inputs primarily on patches 1 and 2.

Thanks,
Umesh

On Fri, Oct 30, 2026 at 03:30:57PM -0700, Umesh Nerlige Ramappa wrote:
>When an OA stream FD is open, removing the PCI device due to PCIe errors
>or doing an unbind causes a NPD and system reboots. While OA registers a
>fini handler with devm, the handler does not take into account active OA
>connections.
>
>Add code to quiesce OA connection on PCI remove/unbind.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Umesh Nerlige Ramappa (3):
>  drm/xe/oa: Use the drm device address_space for the OA stream fd
>  drm/xe/oa: Gate OA buffer mmap faults
>  drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset
>
> drivers/gpu/drm/xe/xe_bo.c       |  30 +++-
> drivers/gpu/drm/xe/xe_bo.h       |   4 +
> drivers/gpu/drm/xe/xe_oa.c       | 285 ++++++++++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_oa_types.h |  12 ++
> 4 files changed, 300 insertions(+), 31 deletions(-)
>
>-- 
>2.55.0
>
