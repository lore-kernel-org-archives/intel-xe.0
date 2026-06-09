Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AADCD8CB2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 17:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D1610E404;
	Tue,  9 Jun 2026 17:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CELYJ4Rg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE7E10E404
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781024533; x=1812560533;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ztbuMYE4P+cN9jgRJcL1DLuUumdcdTswzPEtTZKuk48=;
 b=CELYJ4RgMNyzqt5GDMNG2GPhXyWTn6qG1D4bH8PxrAVSg2mioY2EA+t3
 vidYwuLcV/TRVeH3WH3Q5iofqaprbefGg3kjcIMfPGJLOqvoUsQN0E3Uo
 nVeXclYwDWpzzyqSIENgbkVs2HpD0R1XHuFBNTRXLj/IqmdmvJVEt7Yi6
 SFIvGQGDGSKqeX8LJjFqUrzSLJExf49VTIJqMi3aT0ShzqpG36Q0Cazg8
 gdMmwCop8DM+uUgjGMjP1oFHPjv0NAnvNSHDV2M80HHOHhcWkZ2BFvVwZ
 hmWhyiIZdQ1jHO/dXl2IjgRFo001ynBA7Rj5fn+15O4rZLRh/MSB8r9kr w==;
X-CSE-ConnectionGUID: jI8/WGCQQUSJHU3PUqZLxw==
X-CSE-MsgGUID: HpccP6xmQjWzFtYGSRHPtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92469088"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="92469088"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 10:02:13 -0700
X-CSE-ConnectionGUID: 9rkQ80FgToyuxMEeJZTvLQ==
X-CSE-MsgGUID: rOjFb68cQ4+PU1afrC2Wrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="269594988"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 10:02:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 10:02:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 10:02:12 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 10:02:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2nn3b22RqCUVeKIf9ETtAPT9ikYDgRd6pLQTCwEuLh1agR4LetCAfqpVXSSNa9zqIMT57PEmZ+aCQ34Ul/A52pM5z4pgmZvcMUt5rjGDkTXaTkQFXxrad6z76Mjuiwz37v9zo52xcHI7aMML7wQRxHn38ybgVTVQAsVzznK9zrBjKj5E88yZ6but4A56hBXXoy2wQ7B8gC2zhFCMJfLOB2ZUzrdHJIaX5OMJYPGX927MZO13SJ5wIzO8VlYTIhxGL7ks+RTWVDrK/E7XV8LhIk4uKcPDOSGe9sgbYUeCE+2zlFOEMdaK48CGskQpcJXYiMeGgqi+/B3v6NU7w7YhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr9giJwUKGI7E9cKUWNPA6MeTgtb0B6dStb7S5+iBVQ=;
 b=v8OWrz7Z6Ak0MyIdhEihepWpfA9Gbl2SmU6fBbzGjVsZ38hI1XE4KwTsV9NzYck4bDiQCOgzBwcuZvTwOx8Gd9UIytGjeuS0M9BNnkfsKaY+zyiTillEngPmgqyIHZkrfBFQEExMfICpurmVk2xuzuf61RxYc3UXSx4KtTgwvqIjR7BGz9kem7g3CIABaK2Y9CvzXlCEQ7gQR6P6WEPYFhe/Izd0Bra1WrrqT0Z7qzFGc42FJMh72zK6+H121V8+YrGqoCgVTZZlBIqwLaQGncI34NRtmkKy/RDflKTdxiE/a1/HmKuOuEK+FGjoj0NQCXj8V4d9vLfgpxt0LTgUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM3PPF99D0888FA.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 17:02:08 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 17:02:08 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/nvls: Update PCI IDs
In-Reply-To: <IA1PR11MB62668CABB8F8F92C53A19467E20F2@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20260521-nvl-s-update-pci-ids-v1-1-ec59e5d6bf12@intel.com>
 <IA1PR11MB62668CABB8F8F92C53A19467E20F2@IA1PR11MB6266.namprd11.prod.outlook.com>
Date: Tue, 9 Jun 2026 14:02:04 -0300
Message-ID: <87ik7rprzn.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM3PPF99D0888FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 548cefde-0a99-4b6e-6d4b-08dec648d71e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jJleiiO9xSqtkT35uj+jBLrZLURIfurjFXcLD3Mt2emYlEHS7YIh6YaHp8yIYW8BR3MWNFoeMb5DLrE25FPSUhye9DLIElnrkt7hlvv+/O5rbgTkKQEitUhlXGtTYyLTOZbWqjRGu70KLuosets1pv2JDUKrZblUkfH3hnYgr2SB2mgVPnn759Mmyg5JMaUHDDrbQq98opXdP3QASgNXO6OoQM3XeJp30+2DptypN+9upcJWa938J06LxQA0O1coQYhW7d5RdQi3FsmMtwTfFf5CMNf88wuWHfPdAPMG2soy2KFYV6qnkOLhlAb4jOIH9OErs+wCDr0wrtAG8kGoL7V7X8afJnnu80NqqoxYArEZTWbl0u0GoodvR5NM3BLnlUB6pNvXt6PgsiGZNLT33x/hBS7g5BVb2GyNe0levrzKlyXBydLE3q1g1E7I8INxzNHKtbWZme0j9+mjbCWfipdlw959vBnNDe2Pu0rzNBRUdPkjIZhne9oADxkACEBoIrdbe2Wie8KAwU5iKbcKwakWzmSurbe7v4Pv6RBq7mGdmp4SO41wBBgnPjQhsKZqW4F3PUMuYn6dvmvqVtIXHP1lUZf8CPHcHUJB9Pl9BzuC5uTttJgMvl+2Iq+GrQ21ggvRMi86/a+DVeMO1QhrIzT+bYFDlgvZjDzNbixrIBUWb5yByrjdO+V2GCJ7Eg2C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xzG56V8yeDKuTB2FLiW/f/OUoo3gBYIBOjtcNc/rieq2Tn/3HCmboo5H7iOQ?=
 =?us-ascii?Q?LIYtKjvH7pm9OhjQiUsGV4RbYiEktgRGqOuUzhMTvzxKfz/KceWpGIVVW9P4?=
 =?us-ascii?Q?IQNFJzqvqEOtaMV6XXF3/Vxl/l7oF5AmohBZzr5jocsHcXljFuJSnIf2jWIm?=
 =?us-ascii?Q?0/P/ketykfSrDQmcipL+B5ppomanq7wyByykZKKzo0GqPQ0hdbrUCd1axVkt?=
 =?us-ascii?Q?BnTrzbcPOTJ5MoQBGiF1LeLJU24uug+2AmRLKBpXAr85Obk8paQZrUocVQ2I?=
 =?us-ascii?Q?5tXjTsm89tOos7Ook/pyEIVaCt+RE/KLpDSDQmiecCwgueQmDbewsdQsacFb?=
 =?us-ascii?Q?fWjeGMupjw1oAzC3xbC3PzhhgCxESJT7y2egHAbhVcdetNQKR8O2WoacNm2d?=
 =?us-ascii?Q?Dla4TiS21NTSGkRZpOU3UVETvzeFULFNU3lAmuN1Ak+bBVfPvIkTYKnqfOvY?=
 =?us-ascii?Q?TcSp7uHS8RqtyrTZku376YJ41StNy7VnHTvUBxQwz576eZXqC9RUTJ+oNdC2?=
 =?us-ascii?Q?Nzfyn1luvIeyreqU27JT1s10CH6VMUDw+gYkj2KWY2+RBqjJZB1Mv//DxEd9?=
 =?us-ascii?Q?h+Y2BgmvGrWd/6VFpFfA2J4/3yWai2u/ZIRdElg3TdyquvjYw6BGFWrLBO+8?=
 =?us-ascii?Q?JMp3aVXmvFgyRvDeYe2gVhKbXaLEKOk8LPLwRUn03V6ZM6j/Knxgp5ORwNK1?=
 =?us-ascii?Q?skQ4qOipuuEfU9VfJlAD1Gabvf9rnBEtkPEtnlCm6cjQx1XUuRCS8lIPRHIo?=
 =?us-ascii?Q?oRqYAoXFkvDHRUBprC8T5/6woZM6Ee8qVu0YyrdvxySa+ZM2yoh8/ycpgoRw?=
 =?us-ascii?Q?yoDjITC+nPJwBr8Ln553N+GQYski8m4HpH0DtKryTRwv1Lv2++GIglJROFwM?=
 =?us-ascii?Q?i6/IBTJid/Pn2dKS6fYIkdZMQVN8KEli1y2jTjSlo5sqKPxprWti0FFFJaXA?=
 =?us-ascii?Q?oBt4lhGM7XdcKFaoWugQT9dsGv1DDfRfFr4HJ2KefqEz5/KeckeafRZDN/KV?=
 =?us-ascii?Q?+Tav2dOXO/Y7BPQd1M3vjw3ixeNP1fZ8XLE0hUNBiLM355qJzPe3Jlm527jq?=
 =?us-ascii?Q?SvtPKPC7JWjwkhDTZ98rGpySubg4mS3OQNhu6nxPGRe0kzlDp03meVnNsHnh?=
 =?us-ascii?Q?tVV58q4xOLzEpQr2lKOQfT9MV+cW/CJ+miwQsv8vm5AnnCnGWdAKid/RXNYT?=
 =?us-ascii?Q?f9h+WQybP0BHMU79AMa6p4t8nWqjA3tjmUnBJLLQrx6S9imvA2yFFeJAUcuf?=
 =?us-ascii?Q?29tTHt/Vn9toI8RC1axgCr+Zb+bmCDmwGBWsmwUQTPsAorX6YQhdiS9ByUqn?=
 =?us-ascii?Q?FTUTWsMyE7Bide4so0O8EV5Aea2fxoQ8Ak55j1ANtreEM59vvVpeBPOEDlsT?=
 =?us-ascii?Q?+TzC7qwDw2OONDDzDmldPZ204FFShrZ+pNGrwvFil7ZBzyTBHsKkpd/ftQeq?=
 =?us-ascii?Q?4s74z15dx5+k7jn8OuLiOmX5Jlq3XKAWL80P+cEnB4n/by1J7TURJXZa8GZo?=
 =?us-ascii?Q?oDSRlqtmkUMXav45lcLhFK6gYvNTVXyzDrdF7Z5Gm8qQJtx0ZGrhwfn/OI8e?=
 =?us-ascii?Q?4j0slnp2OGFrR8yPFuLTaMuj3AohzkL2a3HGGFNZK4YZ2awhv+B/zxBDqFKn?=
 =?us-ascii?Q?hG0twhMLo56BT/Z7wCEq0Nibs/SG2dRm3Hb04QOswqSTbLbONvIZrzazh1e0?=
 =?us-ascii?Q?z3TLCJN3L4u4gHma3+c7z2O9CaHqTWr4Cfkf/Al5vsXIK11+3+xTFEfkc63G?=
 =?us-ascii?Q?MmgibrvTcw=3D=3D?=
X-Exchange-RoutingPolicyChecked: f0jXdyGdPaTVgGy7dw/CcgCZc/3YlsIW5MqPZZOma4NcQ3SYGY3kA5ApBgmqmrRtE+3xBKgb377EyZDaO6am5fbx8TsAuQ12sMMTVRkF/VhpScQ8m7TFs48dUsTBmzEXvQuE3pMbWTF1wQbky7UEk+axwiiFEnI6PH3vZkKq5DXcdDVFONjwk+IHctKjDpSCUEKiX8A5KBlAyVoP2u8/J/OcGc91pq8PXVfdXY89voy9wCbCIusdquzC56CCUsXilPSBuJ44ZTUpG61yMGwVoujT/Bh2CCd8naNmxez/CU7BfN+ncml9X/1TJ8mpXxRIP8sdTdyhFRwekfumW9H6gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 548cefde-0a99-4b6e-6d4b-08dec648d71e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 17:02:08.5370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rtitBW+B6K1q8Fs04n5x7/eJjNMutVjY19JVWsRoXKTx2OyFsOIVuQq6VoMXdXKhr2RmcW3cx0h5SmZvqEc/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF99D0888FA
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

"Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com> writes:

>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gustavo
>> Sousa
>> Sent: Thursday, May 21, 2026 11:34 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Sousa, Gustavo <gustavo.sousa@intel.com>
>> Subject: [PATCH] drm/xe/nvls: Update PCI IDs
>> 
>> Bspec has been updated with respect to NVL-S PCI IDs. Update
>> INTEL_NVLS_IDS() accordingly.
>> 
>> Bspec: 74201
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  include/drm/intel/pciids.h | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h index
>> e32ef763427c..dff389b56eb3 100644
>> --- a/include/drm/intel/pciids.h
>> +++ b/include/drm/intel/pciids.h
>> @@ -893,8 +893,9 @@
>>  	MACRO__(0xD741, ## __VA_ARGS__), \
>>  	MACRO__(0xD742, ## __VA_ARGS__), \
>>  	MACRO__(0xD743, ## __VA_ARGS__), \
>> -	MACRO__(0xD744, ## __VA_ARGS__), \
>> -	MACRO__(0xD745, ## __VA_ARGS__)
>> +	MACRO__(0xD745, ## __VA_ARGS__), \
>> +	MACRO__(0xD74A, ## __VA_ARGS__), \
>> +	MACRO__(0xD74B, ## __VA_ARGS__)
>> 
> LGTM,
> Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Pushed to drm-xe-next. Thanks for the review!

--
Gustavo Sousa

> Dnyaneshwar, 
>
>>  /* CRI */
>>  #define INTEL_CRI_IDS(MACRO__, ...) \
>> 
>> ---
>> base-commit: 977b8c213db701a9ec0987be82f00f7d5bc0a330
>> change-id: 20260521-nvl-s-update-pci-ids-b1975fd7aed8
>> 
>> Best regards,
>> --
>> Gustavo Sousa <gustavo.sousa@intel.com>
