Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D10C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 20:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5F310E231;
	Wed, 30 Jul 2025 20:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fi0Qh2Uc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8E910E11D
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 20:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753906159; x=1785442159;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RfkWsdaNF9W2vS3ciXQhrb1mdcRxXPNVskSx+3MEC68=;
 b=Fi0Qh2UcUCZuFlYAgutBeazy/Y4agq1S8Bxf20jHG9TQTFz8HRZBzhpz
 VC7lBVrzD14pM3/JanFfBXggtuap7H4xdTSTPd11iZQGUkefRtyWwv03H
 69+wWvZvxBBbh3V21eFe9f0ChJRkZBgaqnhMOKdtng5Qms/DRPU4jHWSw
 8kwnFGtPNhDGXlilY074ecZQSEaYVfAEBCluJP+QqL5EZI/IEczq8Of6B
 wf+FaY1FkA4BQMYNr18WtVK7P0J0epvpsXMCoLzwrHtj4IHG7VjCFr9eA
 I5TVeCivgeeyDNyI5Cu9bOuTeFhZq/uZckVQXrSCD5rDQHjisYg0wPPid A==;
X-CSE-ConnectionGUID: 3kv/obQSTnyOjD3HpnzJdg==
X-CSE-MsgGUID: id3yU5bBQ2WqmC6XW7NG2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56185707"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56185707"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:09:13 -0700
X-CSE-ConnectionGUID: D+1luGtOS4e5IC5S+OFrcw==
X-CSE-MsgGUID: nivYaSBgTPyMYuIevzJzxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="200243579"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:09:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 13:09:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 13:09:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 13:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7rpATEtHB1u0hdCRKZT1x672njTZFifzIqpFBbMh6/9OsB+kcJ/hZzbd4Qc5MmuayvGdgFqSSJVZBXQjIv+Lh1vhOFVEzDZB4vZ2TQWfuATL9lK2no1F0qjglrtwtCQOnmUk87HtwJ9sZEDxKUTJZjVCYqrmOwXCmoMte0VNN2jATYemdD6bN8j7GCvAJcLJvb3GB0gwyqaYWOn62VN3ynmpFwRovhVREAQHbowRbU8Gm6Gto3q6IEvs+aLMcCdCk17nSvgzS+S9f0GwhZhd9rSMq3SuEVsJ0OKrJ+GfUfSIrmtli5jWs8Ygh96Z1zU0eLmD+f7WR/YczS5m5mjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BHKGFAMZylmxb6E5ph7Nh+Y96wVEAw5AIpN+RT2jbs=;
 b=HXXeoBAF5OIdDbrrtneZdOi901SyDcwqvA1QzKm4KcVWIiyza3LYuKPu28enhuuQFqD3q00EYapL1CRQ9QI5KY3Ldpzeicwdxu0OX3/OFDMdTAgGklUKQGgYXFGhfxeJTBs+PFaSD5hDViZoAjzev+oIUSt7V4G1uV2pehcyUxwaeyJTb6H3vhQMq3ANKbIINdmamo4n7qQbZBkeM93krnLgU8FxliZ5eM4F+h9al0Xk3SpMxPSTQboSE4dL2tdvj0on58ZRMeq+IniHRmO49MD3NPNa3QZUs6YkOCxX1Zj9F2QkRq9s3kJggym3S63SM+xo3D9XRbU/5XOQUn5k4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 20:08:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 20:08:40 +0000
Date: Wed, 30 Jul 2025 16:08:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: John Harrison <john.c.harrison@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
Message-ID: <aIp7xMIBagfd0DtA@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-11-michal.wajdeczko@intel.com>
 <aIk_4BBGSuIp19WQ@intel.com>
 <311dc290-d5fe-4214-b332-96337f3c80a8@intel.com>
 <91cb7b75-3fbb-4749-b048-de55a9599ada@intel.com>
 <aIpIu4UdcmVDCzur@intel.com>
 <4f3a7559-985d-4212-a4b1-6f6386375ca9@intel.com>
 <aIpkWIw3EAKVglLU@intel.com>
 <e0b09023-128c-4ed0-a8c8-2d12fad11692@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0b09023-128c-4ed0-a8c8-2d12fad11692@intel.com>
X-ClientProxiedBy: BYAPR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df89006-bc47-4eda-ef1c-08ddcfa4e043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkN4UE1PY1VNRDJXcXEyMzJ3VDJoWDIvMm9DL1FRVUlYZE1KcWNWM0ZYZVVB?=
 =?utf-8?B?Wnp4MmcvSTh2S0ZTcW1ZN0lGUW1xMVBhU2RXZGt4NktEVzJGb1JrUTZNS3pO?=
 =?utf-8?B?K2YvQ3MwYWI3ZUpxdmdSSGdSQ004TU50aEdoNzBHVmNRcDJsR1QxRldDMGpr?=
 =?utf-8?B?SFB2RElvNjhlbHpjbnlVVjdvOFIxUTNFNzVjaWZ5c3hrbUIrWkhtazI1NUJr?=
 =?utf-8?B?MEhEaG5aZ3ZyMFVhTnJORFBLTno0WFFRcGd1THVyVnVxUzR4QVgwMUNNaTVW?=
 =?utf-8?B?WWhMSjNsZGhEQ1pmbGlHVkI1VFIrYzZxWEtVdjZlOG1reTl1dmE5OGxnaXJ1?=
 =?utf-8?B?alZlSkZWL0dUT3NkS05wYklUMkIyN29HN0JjRjdnSXpGYlY2WEovTHZKVzR0?=
 =?utf-8?B?UzRGM0puWENxZ3J3M0xYYjdvL3AweitReUNQclZFRS9PS3ZMYzd6VEF0V0dx?=
 =?utf-8?B?cVBHMmFCSUJMMTVaNlZieHNaaG1oOXFObHBEbkc4eXdkQjVPNk9ZVjA4VkpE?=
 =?utf-8?B?aldQS1hHUDRJRjhEOFFZdGcvY2swbGJLVnVnc2l2endmMG16Rk9yUVI4OVd5?=
 =?utf-8?B?bS9HMGtzcjh1ekxtYnZwVU5McFFEZTRpay9PUjN6dkd2dHdUWldjTHQwU3VW?=
 =?utf-8?B?S2VYMWhGODNicmthS2huMVNWNURmamdnSHlYQ1U2SjZuU1lhZUF4WFU0UHlE?=
 =?utf-8?B?ZXdwckthUjdLenIrRGJVTFc4eS9yMUorNDZGQW41Qy9BTEYvdVJ2a2tsNTEr?=
 =?utf-8?B?b01GZHEvSVZRUkUrc3ZzNk9zUFFQSTRZRXVOeUxOOGRTVVFHelYrbmhRblNw?=
 =?utf-8?B?YldzZHJYTEtRd0lpUkRTZFJ1aklFYTB2N24zZXhVQTJya0JjZFU4cERGZlVX?=
 =?utf-8?B?NGR0M3ZLTE91dHE3OTFaWkVON2JBeWZGL0RyaHQ3L01HdzI3bmJtS3BpYkdx?=
 =?utf-8?B?djltQUhpTFZOQVA0Zmx2WXZTUi84MHp0c1NuMlh2cVcwWkhJNk0xN29uVThQ?=
 =?utf-8?B?S0F1LzJvYTFGaFpvK0t6NG04L1ROQ1duUzdrOEQrY2VON01LdHlpQ0s1ZUxp?=
 =?utf-8?B?bTAvVkVBODlwTUJOS1o3RlJ4a0dtT1RDZExaMXV4eG9IT1lLNU4rYzY3VWRJ?=
 =?utf-8?B?Z0dtNXR2NEdHWC9EY2kvMjI2R1dENk0rR1VLazVIbW1TRFRuQmVMbDdSakZl?=
 =?utf-8?B?RER6RUIrTGJONGhrOGg3TXFOM1c5Nyt0TG5FWTJ6MjV2T2tHcC9wVEhhbzFp?=
 =?utf-8?B?N2dpdGlncHhIQzhBSU5NNy9MODBaMEZ6Z0luYWZFSEhNeUs1R2pyUDBybWxo?=
 =?utf-8?B?TEZ1alNmZkt4ZzlTKzA5OGh1eGRVRk5oQXd2Q2x4eUxJVmdkUUd6bWQwN0hI?=
 =?utf-8?B?VkphR2h3bVFJRWR5WXIwVjFDeFlTQi9SR21iMUU3WStlV3EzeXNPTTB5c3BS?=
 =?utf-8?B?T1RXL2Flc3NicUV5ZlQ5djJPQmdnRFVVbENYbW43b0JoRXkyT1Z6Y3VXZVkx?=
 =?utf-8?B?ZmFqWlpNQXRlTHhQZVN1MVhxR003NW05WlVwVDY2QWhuUFZLT21WTU10bGk5?=
 =?utf-8?B?Vy9xMzJBM3FOOC91TWI2WFY2TENkYmxLb3pDa2EwQWl5RFI2VW9QZEdTZTBu?=
 =?utf-8?B?S3NFODFUV1Z5cGxxanpuakloTUpvZ2w4czZYM3NrTlRZY1RGQW1LYmpNSDFm?=
 =?utf-8?B?aEJxTWppUi9kY2VNcG9NNkx3aU81aVVUeE02ZWJhK2NjTHZncE1qb3VoY0pK?=
 =?utf-8?B?alFkdWZBbXFmWWxQTHhGYUw4bk4yZ0ZQYXFTdVNtSUlIV2lKTWJhRjRGU21x?=
 =?utf-8?B?M2lZMnJDcVRsOVE5dWNEY1RiQmpZcDg2dFlQSmFwQUw0aVkwNHo5T2h3cTRn?=
 =?utf-8?B?ejdVVkhpd3BVTHpYMTB1bms4UUhLbUNHK3hUQ3VIcjZNT1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXVyZE5JaGRRZFZGMUQvTkVTYzVDS3NpUTZTdmIxSWVjT25sbHFWWGxZaVpq?=
 =?utf-8?B?cUd3b0pvZElFeWZrZ2IwbzlBSGUwUnI1VlRvZzV4VmlFRHVRZWorZ3orMHNP?=
 =?utf-8?B?WTJhZFpyVUV5WVNlSi9zSGxwWjgrYmtMVUFHYUNCL1ZzdjgwU1RpbVFHNkFY?=
 =?utf-8?B?MFlWT25WaXk0Z3dzanZwUzh2MXNJK1hiRUQ4SkdjaVprV2VVUW93NVlNbzkx?=
 =?utf-8?B?ckI1c0p1c3lZUkJRYlc5RXkzeW1ESnpVSi9TMlB5MFJqVXZDQXM4SS90dUpn?=
 =?utf-8?B?VEsyS0xyUnJpSjdMYkx1RFl0QkQwSVhoT0tmSWVNdnN0NzNLVHRvSUxEd0My?=
 =?utf-8?B?VlRvaHhidlpqV2wrcW93MDdwWDQ3MHhEWm5idWgzaXZ3cWltaVNRbmkxcVBz?=
 =?utf-8?B?eTlSVUdpK3BwNExuSHhrSDdYeEFZN1pjWG9pQXBNL1hBVTNuWVZSSXFaZEZE?=
 =?utf-8?B?SkwxRTJTbjE5bmFzN0JPNTYvSWcwV243UTN2MXNESzlOTXM4WWZyNUlJUlF0?=
 =?utf-8?B?U2tIazBTakVaaWYvejk0U1gzcEdGRHcvN3ltMXIxRmIwNTNCWlhOREY5T2JN?=
 =?utf-8?B?QUFnS0hPWW5KclpSZzBNM3p6YXRyRnNmdnkrUEpCeE9paHFSZFlMdnRVWk5K?=
 =?utf-8?B?VmtDcnpIa2NXVklnNWdTS3J5bUY0clBsQlN2RndEUUVIMlllMzhuMlhINTFT?=
 =?utf-8?B?RCtUakNFTWVub042clNHRXI0c2xRMENoSVZGNE9MeTJ6ZnRrMUE5N0lKOE40?=
 =?utf-8?B?ekVvVlhvNEc4bXVvYm01WHVsYzlVVTN5MlNFbkhFM1FTUFEyM3ZBbmRCTjA2?=
 =?utf-8?B?VFlRREtMd3BqNmYzQWJJWHQxSHpoamtMN0dzL3ViSU1Cd3J5cExaOU5FTmlG?=
 =?utf-8?B?U2taQ0MwMTZFSVhRUS9oQ2RXTkRhb3R6VURWYnpUV1dtVHRTTklrc0tKWFNK?=
 =?utf-8?B?Vzc3YnEwM3lUL2tTd3lwWW9Eako0eEZDZDQrYnhsK3EyS0x0OGwvWWlpcjEv?=
 =?utf-8?B?MVNMQngwQm1ma3ozQkl4Syt6Mnl4SEpma1B6RjdSOGsvcDJKWGJuOUNOMEtD?=
 =?utf-8?B?dWVEMEpPb212L0JzMElsSzdZVDlFUitQdXA4SGg1L2NGa0J3VmNLeHNuRkFv?=
 =?utf-8?B?M1B1aU9pL3pkaE5iTi9XTW10MDlqT0NmSUFWN2krZWIxeERHalpmK3J3ZmJZ?=
 =?utf-8?B?cnVKK2NJd0Z0TnIwYmdUSHZyK3ZrSTFiVEZ4cEk5Y1BZMS9waVZuQVdqUmdP?=
 =?utf-8?B?YUk5OXF2RDJlL1dsWndDTkNUdEEzcVJsMkxmOG8vYzRhVEdRbVlubnV0bHI0?=
 =?utf-8?B?TDJvMkRMQ2V1Q1M1YUZTMG4zN0hQRXZXV0VMcWhKcVhvQ1lxRUFvNWxRQjNJ?=
 =?utf-8?B?ZzFTdzZlTk10c0JGOU9vSElXVHM2VGQ0Z2MwSTE5SEFORDh0aVRLT1EzeVFB?=
 =?utf-8?B?QjlhOTkyc2dPWDZlbVJtRCtkWHJTcm5JRFNiUndUZ1RIc1Z3ZVE3a0p4T2lT?=
 =?utf-8?B?N05TSng5OVdFdjVlMytTWjNtOUtucnpSd2FsMkpoajVpUStqTGNXU0RlMm5o?=
 =?utf-8?B?aktoeUp5RDF2M1RXNENDN1FQQzNSZ3p6M2VSR0U5cThnN2RXNnZVd0xScFJ0?=
 =?utf-8?B?RDhMUENGSk4xSHVVZTV3M08xaHYvQ3hOeGZZMEtVbnliczgyL01KRkdKVWgz?=
 =?utf-8?B?UTEyZlREZndLWTFsdE0xQ2RlcW5LU3pRUGVRaGFzejB0Z3pjWWg0UjFaeGp5?=
 =?utf-8?B?cjZNQ3Ztd3dhQUpZTUdVeVlmdk1IdllaMHBYOHdOWEZGUldXTHg2a2VLRnhT?=
 =?utf-8?B?ZVVlVnEybllZQm5JVWkrQlBTZUNLUTk5MFdxMWNDU0U3TzZsRWFsNHFaT3hJ?=
 =?utf-8?B?ZW1NZkJaUDB6dFNXZ2o0azVObUNPeE94NWlrbjhHZWxsQ3NQVDdIUkFrSEc0?=
 =?utf-8?B?K3VweStMOEcxemw3dTRySzd6d3RVZGpaZGVrVHNEcjZMVGVTRmd3NmpLK3dp?=
 =?utf-8?B?dEsvTHBWdGtid2FpcSt0SmxIMTIvQzc2T0FmUldVSXZmVElEelFNQkxHRE9R?=
 =?utf-8?B?aEJRUjBzckljcHh1VWQyeXk5ZVZ2enJ2ZUh4TFNaaytxd0xhaFJpdG5TRzJx?=
 =?utf-8?B?VXVjejd3N2V2Rm1aRnNmZzN5TU9SazlpZU1acDJVb1kxOFpMRmdUeFk0V1hY?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df89006-bc47-4eda-ef1c-08ddcfa4e043
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 20:08:40.2586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNpg4+p7Ss37PHY9cAekLujQtvHE2Y0JUosH115W2GslWG76rKSNvNflYMBhc8McXzzOZExwmGkal11uDCacXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7181
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

On Wed, Jul 30, 2025 at 09:57:01PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 7/30/2025 8:28 PM, Rodrigo Vivi wrote:
> > On Wed, Jul 30, 2025 at 10:12:06AM -0700, John Harrison wrote:
> >> On 7/30/2025 9:30 AM, Rodrigo Vivi wrote:
> >>> On Wed, Jul 30, 2025 at 10:23:22AM +0200, Michal Wajdeczko wrote:
> >>>> On 7/30/2025 12:20 AM, John Harrison wrote:
> >>>>> On 7/29/2025 2:40 PM, Rodrigo Vivi wrote:
> >>>>>> On Tue, Jul 29, 2025 at 01:42:14PM +0200, Michal Wajdeczko wrote:
> >>>>>>> Since we already lookup for the real PCI device before we allow
> >>>>>>> to create its directory config, we might also check if the found
> >>>>>>> device matches our driver PCI ID list. This will prevent creation
> >>>>>>> of the directory configs for the unsupported devices.
> >>>>>>>
> >>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>>>>> ---
> >>>>>>> v2: rebased
> >>>>>>> ---
> >>>>>>>    drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++++++
> >>>>>>>    1 file changed, 17 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> >>>>>>> index 5f145ccdf535..766775772eef 100644
> >>>>>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
> >>>>>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> >>>>>>> @@ -275,11 +275,22 @@ static const struct config_item_type xe_config_device_type = {
> >>>>>>>        .ct_owner    = THIS_MODULE,
> >>>>>>>    };
> >>>>>>>    +static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
> >>>>>>> +{
> >>>>>>> +    struct device_driver *driver = driver_find("xe", &pci_bus_type);
> >>>>>>> +    struct pci_driver *drv = to_pci_driver(driver);
> >>>>>>> +    const struct pci_device_id *ids = drv ? drv->id_table : NULL;
> >>>>>>> +    const struct pci_device_id *found = pci_match_id(ids, pdev);
> >>>>>>> +
> >>>>>>> +    return found ? (const void *)found->driver_data : NULL;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>    static struct config_group *xe_config_make_device_group(struct config_group *group,
> >>>>>>>                                const char *name)
> >>>>>>>    {
> >>>>>>>        unsigned int domain, bus, slot, function;
> >>>>>>>        struct xe_config_group_device *dev;
> >>>>>>> +    const struct xe_device_desc *match;
> >>>>>>>        struct pci_dev *pdev;
> >>>>>>>        char canonical[16];
> >>>>>>>        int ret;
> >>>>>>> @@ -297,8 +308,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> >>>>>>>        pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> >>>>>>>        if (!pdev)
> >>>>>>>            return ERR_PTR(-ENODEV);
> >>>>>>> +
> >>>>>>> +    match = xe_match_desc(pdev);
> >>>>>>> +
> >>>>>>>        pci_dev_put(pdev);
> >>>>>>>    +    if (!match)
> >>>>>>> +        return ERR_PTR(-ECANCELED);
> >>>>>> why ECANCELED instead of ENODEV?
> >>>>> Or EINVAL? This is for when a user has created a directory for a PCI device that exists but it is not a Xe device? Seems like ENODEV is not the correct option given that the device does exist. But ECANCELED also seems odd.
> >>>> we can always return -EINVAL but user will have no clue what went wrong
> >>>>
> >>>> so the idea was:
> >>>>
> >>>> -EINVAL     when config directory name is malformed
> >>>> -ENODEV     config directory name is correct but
> >>>>              there is no such device under such BDF
> >>>> -ECANCELED  when device exists but it is not covered by Xe driver
> >>>>
> >>>> since you both don't like -ECANCELED for this case, what about:
> >>>>
> >>>> -ECONNREFUSED /* Connection refused */
> >>>> -EOPNOTSUPP   /* Operation not supported on transport endpoint */
> >>>> -ENXIO        /* No such device or address */
> >>> What about -ENODEV, but with debug messages to differentiate the cases?
> >>>
> >>> Otherwise -ENXIO seems the best of the alternatives here.
> >> I'm confused by what is wrong with EINVAL. Are there many other paths that
> >> can return EINVAL for this operation? If not then how is any other return
> >> code any different from a user confusion point of view? But yes, I think at
> >> least a debug message to say "requested device is not supported by this
> >> driver" would be good.
> > 
> > to me it looks more like a 'no device' than 'invalid device', hence my
> > thought on the enodev, but no strong/hard preference to be honest.
> > and we are definitely on the same page that there
> > shouldn't be nothing wrong with reusing the error code and printing the
> > debug message like 'requested device is not supported by this driver'...
> 
> looking at pci/iov.c where some diag messages are given:
> 
> 	/* is PF driver loaded */
> 	if (!pdev->driver) {
> 		pci_info(pdev, "no driver bound to device; cannot configure SR-IOV\n");
> 		ret = -ENOENT;
> 		goto exit;
> 	}
> 
> 	/* is PF driver loaded w/callback */
> 	if (!pdev->driver->sriov_configure) {
> 		pci_info(pdev, "driver does not support SR-IOV configuration via sysfs\n");
> 		ret = -ENOENT;
> 		goto exit;
> 	}
> 
> so maybe we should use -ENOENT
> 
> $ sudo mkdir /sys/kernel/config/xe/0000:00:07.0
> mkdir: cannot create directory ‘/sys/kernel/config/xe/0000:00:07.0’: No such file or directory
> 
> and print message using pci_info() like this
> 
> pcieport 0000:00:07.0: xe driver does not support configuration of this device

works for me.


> 
> 
> > 
> >>
> >> John.
> >>
> >>
> >>>>> John.
> >>>>>
> >>>>>>> +
> >>>>>>>        dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> >>>>>>>        if (!dev)
> >>>>>>>            return ERR_PTR(-ENOMEM);
> >>>>>>> -- 
> >>>>>>> 2.47.1
> >>>>>>>
> >>
> 
