Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7701CA0EC4
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 15:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD9810E50B;
	Mon, 11 Aug 2025 15:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gz1L9Ami";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070AF10E50B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754926160; x=1786462160;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=psMImzF5hhkBY2GX40DP1AAGVW0bPcx3YHnGuLOGj0o=;
 b=gz1L9AmiGaBfLC449dBYR8WaeKjoEdvDhh2l1Qj0hYhpiHXs7jgoXXaZ
 czg5QhydFs9UgrGWuOQx/6CcXl7IDn8sSo4RKW+S96d7ERGshaySpE1P5
 H6P5o2pMtU3IW+/Flt70QUuGEzv86RbCUoNPxnYzaWm//E12DJ9QETMgH
 v0RL56dDofqzr9ZJ+qzD/AOIQBaih7EXyraFUdK6wTNLesUKmO6zAhDCG
 g+/kzRnO8BcyUJ7CNARtDUCMq1SRQN6+zOLQNCSkQ2uC3GBygjXGys0Uj
 ZOYr98pRdguJmto9FILeAb92eaYu2ZbBE7mgzNquE4vb+hw6DslaMb7wu w==;
X-CSE-ConnectionGUID: nEQ3wr6DTTaw3SL2Bp33qA==
X-CSE-MsgGUID: mFKZclhLSxKdF85cLHedpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57264220"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57264220"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 08:29:20 -0700
X-CSE-ConnectionGUID: XYagh9UTQQSYv2AICXvvdw==
X-CSE-MsgGUID: /xeDAkNTRqydgqDexoQW2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="170389524"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 08:29:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 08:29:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 08:29:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 08:29:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kb/pQ1f9BZYFyVwSboOyO0WbRAP1Uagq08qXB/mzGacppvEV+FK7O6tcvspF16WvA0DF2801s297tEYNZuu3t3nx6rUzJlRcQdMjbODzrf6ns5iIPtG5FdshzxitY9CMfashjBj3MKbPVzvUi0ZhoVoH+m83nF97mZlvBkow/TgHkHHw9pzEWgP1xEpedSp6o056fA8prFbmPEzR4hXaNYzaWOhlVlzuV7tADRIgWjSolNRQpPd0Bk2nl+nO3HeagNeAwW1awh6/FdDIAJZZPnVsA5zkyKLGaTDhVdfyheYiIYeKjD+MSHzHo2R2LJ94b/nUXqsMWWFsp13DCJeM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psMImzF5hhkBY2GX40DP1AAGVW0bPcx3YHnGuLOGj0o=;
 b=muSZPlD8MU2TCq1nRv5wQ0vxR8bhJiHdakwTGhueP1OGgdYjgJroTVKgNleDttpoBK+7aJzuIzD5f01+HfvvwaV2WMhxy1UgFKVyhwIu2nKhVz0qxB76q4+hWrOMhMa41JlO4p5sa++guCS6xNvksBxk8nAJvA32UD7PO6chDaNjcMOG9kvkrXp0D+Ap970Qlg2IncNmXetLqxNDIf7LKuHltczTKNRn2QurWDCxAk68YTK+C148CIlktU6boICTTaVAxvBIeZsJfhnGyatgpNUUu6vj6D8/x9tR/ruqFZeQ+oJKvofWC/b++mGG27Tb0xkND2w20htUr3SYnh9Gmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB7197.namprd11.prod.outlook.com (2603:10b6:208:41a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.21; Mon, 11 Aug 2025 15:29:16 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.021; Mon, 11 Aug 2025
 15:29:16 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
Thread-Topic: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
Thread-Index: AQHcCHpP/+FEKXALz0qMIbT+V2dhKbRboJwAgAH304A=
Date: Mon, 11 Aug 2025 15:29:16 +0000
Message-ID: <9f33327f352e2408e5288def939df3f95048723d.camel@intel.com>
References: <20250808153656.67098-1-stuart.summers@intel.com>
 <aJhlqGvzbAZjH5OR@black.igk.intel.com>
In-Reply-To: <aJhlqGvzbAZjH5OR@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB7197:EE_
x-ms-office365-filtering-correlation-id: 83e58f0c-610a-4f5b-b7d3-08ddd8ebd58b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cllVMWNwckRrMUI1VlJyYTdMeHZzTXFIWm1KU1NZcUZPU1YvNTR4ZWxtQWZL?=
 =?utf-8?B?T21CSXI0YWE4dEMwT3Z2ZUhxaEdmVUdmVW9PL3lzdnVNUGdmN3c5SkxQeFdM?=
 =?utf-8?B?UHIxUHdydU1YUzQ0Zms4R0RHbWg2SjVnTmphY3dZR1J0M2ZRYXRSV3FsQTJ0?=
 =?utf-8?B?Mkh5NzQyN1o5b2N2QkNtRkxNeVc0eVJtZmpyUjFTNWNNcjIzM3ljeEg1YllJ?=
 =?utf-8?B?Z1ExY1I1RW45VU0vRTNwRE12bmRMdUVrdFRBNjNzNm9MWDNuWE9ZcXJIWmJK?=
 =?utf-8?B?M2lHSnBTa0dIVXFtOStGUUpIZm1jdkZBeWRaZFp2Y1RSUmc5OEtheXlxaXRx?=
 =?utf-8?B?SENndHlQQ1RiOWZlSXRjMU1uMVlnVG5ER1lVRmZJVWJTaUM2WEFud0gwQ0Yr?=
 =?utf-8?B?U1g1enVPYllUMUd1STkxQUw3bFhDenlsOXFoNUZra0FkTGNYY1RYUmZPc0kx?=
 =?utf-8?B?NXBkdTJ3eFNJTHRqQUpFV0ZvWFczVTNCV2VxNDJKZ3NLc2U3YUtGcmdWLzc4?=
 =?utf-8?B?bmpTVzlNUWdLQ3F3b3BIWm1VSytPZ2luTlJ2Q3lQaE9qK3ZKSWlCa3hBR0sy?=
 =?utf-8?B?dzRlbHFGV3oxbUhVNXRQT093WERYOUp2ZWRZWkhmUGp1MEV3TXVrUG1EUXhG?=
 =?utf-8?B?cHlrc2hYRTFMdGYwdThFVzdJVlhoaHp6L0JLVnUxUzNiV25OK213a2Qwam1t?=
 =?utf-8?B?bGMxOURjOWg2cDREMGpaQzk0MGxFOEZuK1U3aE1zYmdIUUJJVjV5YjFFTGdj?=
 =?utf-8?B?UU5VRmM1WndaTWlybkVQd0lKTzloUGE0dCtLWjdKbERic29STFVEM3h5cS80?=
 =?utf-8?B?N1llUFNjUDNST0JVNVljZDh4MDNzNnB0aHNGRFFieDlzNlAyOXNCRDFvRmJG?=
 =?utf-8?B?cHBtL0lEUnB4NzArbW5Va2pKdFV5dEc0bWJLVWErcGZlNlRINnk3ZlFhNlh2?=
 =?utf-8?B?a3ZCaTdpb3MrNk1CKzJiUysrc2JVc2xuVTFEcS9LajF5VytpNjVIS0lUWWV2?=
 =?utf-8?B?V3I3MEI0NlZ4azNBNmlhQzlxc2s3YlZCdDcxTWduNDVVbW9GSllhL1N5M21j?=
 =?utf-8?B?TTlJcEZlTzJOMTU0allCdXl3QUZxVkl4OTMrODVKamFiTnIvU0x1NS9DUVZ2?=
 =?utf-8?B?ZElYV3k0WmZKMDM3U28yQ1lPby8zaHpuN25NSXM1K2hNcENzSGNsMFZGcmtT?=
 =?utf-8?B?TnlzdTJ5RzFCNDFjbjYzV3NOVDBtN3Y5V1V1c3EzNGk5ZUIrZWt2akhHd0Yw?=
 =?utf-8?B?NXFhaVdqV2tYVFZZa1VTOGVLWTRBbTNaREpBc0ZWenJxbmMvclp1cGY1a212?=
 =?utf-8?B?N1Z0bmZTWXpLeXFBQjQ1aSswZFgvUTBpYlF3b3VDUlVZUU5CMXFBc3hJeHl1?=
 =?utf-8?B?a0k5bTZqNjgzaXJic21Jd2lnTjc0UHZoZlNSdEMrb0R4RWE5eVdRS0ljTnZp?=
 =?utf-8?B?MUthT2xQcSsycG9LN25CTnVvVURzMjlhMmZkdm4zRFN5UjA1TjI1a0dDMTZ1?=
 =?utf-8?B?U3ptTE5SWUcyTlBmMmRTTUFGaXdhWjJPSmNxRjI2dWNzSGdWcVRjZXlGUFd0?=
 =?utf-8?B?ejU2djMvdEJUblM2bDdJTjB4WVNjMnZJcXg5d2M0WWxBVnVyY0w5OUxuRG51?=
 =?utf-8?B?emtuWU1kcmdXeG53bGF0MEw5RnF5YXdqa2VnaVdVZmZUd3QyTkVNYjBLWWUx?=
 =?utf-8?B?SnkvdEptQWhqRzVOY3ArTU1HeUUyT3poVDF1TndWOGExYzAwTFJOSm03eWR5?=
 =?utf-8?B?U1dVOTdaYlZuQ0QzMEpyWWc1MXl1bGg4Zko5YStvVnlNTWV3RDhMOUppMllK?=
 =?utf-8?B?eUh4bUpsd0VHUmQ1VXhuQlZXSlhVc3VxRkVXd1RzTDhUYnNheWtGbkhXY0M3?=
 =?utf-8?B?NGJrNzFlQXdSM2xlTDA5L0tkMTdicjZZekxMYmIwMnc5a2xZSTV0b3FEYUtI?=
 =?utf-8?B?SExBMzJ6RDlldXNmNkFGU0d3UmE2RWxsbDFFcElYdHhJSUdhditPSXNoOG91?=
 =?utf-8?B?QXppTWtrTFdnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2NJK2IxU2VFdE5oVXVlSDhjZ0tudGJLNCt6VnlpejRMVDFwV0FrbHpiZXFS?=
 =?utf-8?B?SDd0ZTNWSnZsWWpuUEUrWnduUmxKWWF6VEpYM2tDckhueDhVMEJ0bmZiK3JO?=
 =?utf-8?B?UDg5VUE5cTd4eGdwNGF2THR4MGtIR2c3c2tjR21ieXlLeDd0OGpYVlBxRVph?=
 =?utf-8?B?WDlsQVJBY2ZselBQQ3Z2VjdSUk85RDN3YXZSbVhyOGhVbHJiRjJLTHJ0ZGJo?=
 =?utf-8?B?V2xqYURrTzEzYytNNi9IY05QRVZlbU4zaVF2THp1L1FDSGg3MitUeklXakMw?=
 =?utf-8?B?QUdZMGJBMXVyUDd2UVBCeExKZm91TXZJVS82Q3NiWWI5OFVWZTRVVGZ5ZE5C?=
 =?utf-8?B?amhxQnZqRmdIMWdVa3NMaGo4OCtRdWJjemh6MEVLdUdCaUpteFVCT3phN1o5?=
 =?utf-8?B?c2tTSTZ6dUw2VytobnNQL0VxU3RYc3EvVDMxd1EvSStyUEpzRDdPT0paYmdD?=
 =?utf-8?B?VFloTVFYdXV6S3VxTCs0NHRFclpMdm0wcUJZZ2dsblNEOHp2Y0pUcFhLNjlB?=
 =?utf-8?B?MzNzUkJGbTBxQ2xKWHFxTkRMQTA2UlJkMmhMMG5xd0xDek0xL3N2VGVQY1Nm?=
 =?utf-8?B?Qi9aR1poWTFkVlFGRmFSUGJGV0tuVjJFWHRVbEFKNzJFcVh0aHIxemxiRFQ1?=
 =?utf-8?B?QjZEc1IyTmNNMnptSjNUcTFKSlEwK0U2WUVPR0JNVHBGY1l2SUxCeEZDVnpS?=
 =?utf-8?B?dFE1ZkZDcnNjemVSNTJ5TmlqbTlVUWhnTUJ4VHNaazN0MC8xMm1hTUNRU2RT?=
 =?utf-8?B?bTNnZ3pqcDE1SjU5am5XYlNjaS8ya0NwR3FMM1N4RTFJUnc0U1hZaTYvdEt3?=
 =?utf-8?B?NlBicTBrWjlBNENwT05BTkFYU2h6cnpkNkFIMWtKaTFyVkVzNzRIQWprekwz?=
 =?utf-8?B?UmdjZVdwN1FGeU5RdEw5NS81OGdYYjJqcTFBbXlqL0VZL1MvUzNaYWgrQkNO?=
 =?utf-8?B?N3hiZG5jSW5ZUGVreDl1cmE2b2lvN3B3QU5PSWZrZkJianhHVTNVUEJ0YzM4?=
 =?utf-8?B?NnhoanRkanQ1L1R5UUM1LzlwZ2hTVEdCUE4yTkhCMFFibjJRNUpQL05lZ0N1?=
 =?utf-8?B?OFdwK3Z4TFE4OUhFb0grQURTQkg1K2llYW5rVUhHZDZxT3BNT0l6bndpb2Fn?=
 =?utf-8?B?Qnl3b2JNMTNjSUhsM0IycGxvQ014NXRqaGFqOWx5MkpiQitnRHB1Mi9lWk9G?=
 =?utf-8?B?aHJaVGVxU2lmZW9jU2lmSGRSeXJXTGVydzg0WUVBNVpGL0FwQXYvajZJdXVM?=
 =?utf-8?B?T1VxdStJUTYzbld3SnY3TzFnR1VsSGVLaGZWUDRmRWlHZ0FWUEpFTnRHVk9q?=
 =?utf-8?B?TXFvZkpZTjhSbTlHM0FFTTQ1SzN0azRMTmxndUZoMDUwbi9iSjRBL2tHcDRt?=
 =?utf-8?B?Z3VLR2hDd3RBOGthdDJqVURuaXVrNkhtL1pBUi94U2V5Mm1yMituYzZoQjJx?=
 =?utf-8?B?ZDlCTi8xaUNKdy9LRE1wN2RGakF5MlhMYUVaa3lXcElzUC9la3cvTzNIUm5J?=
 =?utf-8?B?SWxGVGExM1FZS3dQSG9JdEl6UmM3aHdrOXEwRTBiYmdsU0RMRUNxb3ZsQzY4?=
 =?utf-8?B?SFRLNFhFMVlvVzVjUFhxQllVazczcFkxT1dkUTErbkgrQVh5bTV0b3FMbXB0?=
 =?utf-8?B?WlQwUkFySWVpVThadXFsUzYzaXZnSVc3TjRhL0pNMXF6MUp5aklnTDB6MlQx?=
 =?utf-8?B?NmFaTGoxZlpRb1VpcW03eTlmZGY2MDV1QVZaQUgrQ1QrQlJ2Nm5WRmhHdDlE?=
 =?utf-8?B?ZnhCblBLK09RUEY4aVovYXh6dkZORGQyeERpT3FmcFNFalhhOERIamhISjhM?=
 =?utf-8?B?Wm9BcVVhWGVkS0xiaDVrSHNpSi93RVNuMWhMQzV6VXNMS3loUStHUVVtQlF5?=
 =?utf-8?B?RzdSUU1ZS2xMY05YQTFBa0I5cEJaaEtJTWJ5VnBpZGcxazZ5NkcyUTd6Rml0?=
 =?utf-8?B?UlVhN003eDY3Q29GVThONHhjZ1YxNGsvRjdtUnkvUHNUMWYwM3dLTzIyNUJH?=
 =?utf-8?B?Qk5FYXV3SWxLT2VkN29hQ3JKejJKd0FqOGg5dWwxVEtxZlNvL2l2eDQzYmJq?=
 =?utf-8?B?L1FRVEZQWjFoZ1hpTURwem54UGF4a0VlajV2QUljeW5ZR1FOUkRnVDFoSEQy?=
 =?utf-8?B?QWlNbTNkUit0Y2ZLcmJnZ2RhalRoQVNJVnNGODR4NnZjVU8vVWRJL1JOUERV?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBCA9FE89D2295479ED255435F0E9512@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e58f0c-610a-4f5b-b7d3-08ddd8ebd58b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 15:29:16.7576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7tLzfUfmpKPUj4eGTd88xaHaG0xvSnafBIAC9xfEhDNUdXiRAbrIFZfHiprbvdF70fS5UUsKVn+UzUvrIIpPaq07j+QxeQHeGBSOUZZwxmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7197
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

T24gU3VuLCAyMDI1LTA4LTEwIGF0IDExOjI2ICswMjAwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBP
biBGcmksIEF1ZyAwOCwgMjAyNSBhdCAwMzozNjo1NlBNICswMDAwLCBzdHVhcnRzdW1tZXJzIHdy
b3RlOg0KPiA+IFRoZXJlIGFyZSB0d28gcmVnaXN0ZXJlZCBmaWxsZWQgaW4gd2hlbiByZWFkaW5n
IGRhdGEgZnJvbQ0KPiA+IHBjb2RlIGJlc2lkZXMgdGhlIG1haWxib3ggaXRzZWxmLiBDdXJyZW50
bHkgd2UgYWxsb3cgYSBOVUxMDQo+ID4gdmFsdWUgZm9yIHRoZSBzZWNvbmQgb2YgdGhlc2UgdHdv
IChkYXRhMSkgYW5kIGFzc3VtZSB0aGUgZmlyc3QNCj4gPiBpcyBkZWZpbmVkLiBIb3dldmVyIG1h
bnkgb2YgdGhlIHJvdXRpbmVzIHRoYXQgYXJlIGNhbGxpbmcNCj4gPiB0aGlzIGZ1bmN0aW9uIGFz
c3VtZSB0aGF0IHBjb2RlIHdpbGwgaWdub3JlIHRoZSB2YWx1ZSBiZWluZw0KPiA+IHBhc3NlZCBp
biBhbmQgc28gbGVhdmUgdGhhdCBmaXJzdCB2YWx1ZSAoZGF0YTApIGRlZmluZWQgYnV0DQo+ID4g
dW5pbml0aWFsaXplZC4gVG8gYmUgc2FmZSwgbWFrZSBzdXJlIHRoaXMgdmFsdWUgaXMgYWx3YXlz
DQo+ID4gaW5pdGlhbGl6ZWQgdG8gc29tZXRoaW5nICgwIGdlbmVyYWxseSkgaW4gdGhlIGV2ZW50
IHBjb2RlDQo+ID4gYmVoYXZpb3IgY2hhbmdlcyBhbmQgc3RhcnRzIHVzaW5nIHRoaXMgdmFsdWUu
DQo+IA0KPiBJJ20gbm90IHBhcnRpY3VsYXJseSBhZ2FpbnN0IGl0IGJ1dCBsZXQncyBzYXkgaWYv
d2hlbiB0aGlzIGhhcHBlbnMsDQo+IGNhbiB5b3UgZ3VhcmFudGVlIHRoZSBleHBlY3RlZCB2YWx1
ZSB0byBiZSAwPw0KDQpZb3UgbWVhbiB0aGUgZXhwZWN0ZWQgcmVzcG9uc2UgZnJvbSBwY29kZSB0
byBiZSAwPyBJIHRoaW5rIHRoZQ0KZXhwZWN0YXRpb24gaGVyZSB3aWxsIGJlIGNvbW1hbmQgc3Bl
Y2lmaWMgYW5kIG1vc3Qgb2YgdGhlIGNvbW1hbmRzDQppbXBhY3RlZCBpbiB0aGlzIHBhdGNoICpz
aG91bGQqIGJlIG5vb3AgLSBpLmUuIHRoZSByZXNwZWN0aXZlIHBjb2RlDQptYm94IGNvbW1hbmQg
d2lsbCBsaWtlbHkgbm90IGJlIHVzaW5nIHRoaXMuIEJ1dCBnaXZlbiBwY29kZSBpcyBhbg0KZXh0
ZXJuYWwgaW50ZXJmYWNlIG5vdCBkaXJlY3RseSBjb250cm9sbGVkIGJ5IHRoZSBkcml2ZXIsIGhh
dmluZyBzb21lDQp3ZWxsIGRlZmluZWQgaW5pdGlhbCB2YWx1ZSBJTU8gaXMgc2FmZXIuIFdlIGRv
bid0IG5lZWQgdGhhdCB0byBiZSAwDQpzcGVjaWZpY2FsbHksIGJ1dCBJIGNob3NlIHRoYXQgaGVy
ZSBmb3IgY29uc2lzdGVuY3kuDQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiBSYWFnDQoNCg==
