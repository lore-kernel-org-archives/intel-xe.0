Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4884ECDB47C
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 11:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B8E10EEB5;
	Wed, 24 Jun 2026 11:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+YNX040";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2F610EEB5
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 11:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782299898; x=1813835898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SrsftPXvca7WcEu3S8tNlhZ99wBh/QAuwghIxwTBIWw=;
 b=O+YNX040BIr4IihOgeTal7FLOrfbzqRSmCNyW7WdV4lvTr+yNAmTgwI2
 XUI1Dfu+q+IwaG1hFobRPAo/YtSRBBfSf0wa5zwppCeOYS+ChzaweVAjb
 UDP6k4FfTJ1KDP9yCX43YTwmvrZ2MR4hdw8sWjujd5rZWlQkd8YcWEZOo
 cTZkkfkY5w5W2z7StYvP4AmeeK27bUhFAcCuBqHbPcRnf9MI9H6kp1bwN
 dg1B5GJ1MMk8Z6115055V9mT8HLA5wJ6tACVKWYDHV88jhGuwsWgQQwZa
 UFfqg5rDfu3R2NgdFUAGEPDwfcIwnE2lrjVB9NKh5Bu0x7Nm9ki9x40i/ A==;
X-CSE-ConnectionGUID: jcLycELCSp2qTfSsT0EqRA==
X-CSE-MsgGUID: Y0bRZ3WWTFKwROyJ0hduqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86901338"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86901338"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:18:17 -0700
X-CSE-ConnectionGUID: GqSFQpG/RcWpsu/SGMdxnw==
X-CSE-MsgGUID: ZtlFlHsjQDmGpekgvcpIrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="246907573"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:18:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 04:18:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 04:18:17 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 04:18:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfTzX3gZ4hk8YlpTpGYNflPrgH4XitVTaHkCpssNYdmSU3ttAjTIDpjKM8hKGt236WdT/vEkMAfN4tEW9fwa7mree5PGzcv9gv13eXP3wIvDIEcIZFEcTgHw7ziZtLfArN4SsHYl3TCJxih35vUcCqAUfTFMM2BFnXRt+vxMq2282YhqcGDmTkwI0QGl72qxyzouLfK/Qv2hWCG/624UeVleMJjg6Q4GChLLHQ46T9BGyfepUIJHBzex+f5ARR6ad74TQ96ZvR0NlaZPSYhDQt8eFAG0VHm7l25rUXniychjnDxSY5ZyZRsa9wIrvd8z6iJFlGckg+U7DpZTDi66Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyWtdntoXyIx7N7T+XmBovc2xJfxQ7AfQip/nMJnhNA=;
 b=SWi8XB03/21/QDV5HkPD3QfhHJVGjP/zW5G8oqI1UUPQAwxVefcJL3Z0vTSLc4Lffz6JfmbIJIQGeHl3w8ytknUSyoVrSCzRu3VyJhg3Rx2NGrUs1qydQr3y3vPJJ4qGWB+TIwPy3fbYW3UqyhbQ5LjGlmFXSXw0Gd0bKKCDrDk6NlYysFAwNbmiPoiL9RxY/nKdRcw7MHCHFd6J47hd+nm7UjA3O7py51TO8bxdh3yX49UZ9pxROo7j8C3jd2F5+5u1Rr0d/0Hr+8s89jm8E61DHUCPkxwXwe0wjykXWpwGGIY0NfJ8xWNjlt7U5aUrOo2IEvbHiyP9FVh1CxJbdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by SA1PR11MB6806.namprd11.prod.outlook.com (2603:10b6:806:24d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 11:18:14 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0159.015; Wed, 24 Jun 2026
 11:18:14 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH 2/2] drm/xe: Reject duplicated properties for
 EXEC_QUEUE_SET_PROPERTY
Date: Wed, 24 Jun 2026 13:14:21 +0200
Message-ID: <20260624111421.1258364-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624111421.1258364-1-michal.winiarski@intel.com>
References: <20260624111421.1258364-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|SA1PR11MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa2be88-a4d4-411a-53fd-08ded1e2488b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: x/EXp59Ray7ofRjA4kZKupSefJioxMVf84s84m96pcMFoQAhecmQ4DCl7lUp9czozdpeo6wOilmQMOzUYgdMM1pCzXcfd0PnRJNH7jTyqFeu+D9qbIE+wgBNkgFQ2cMjLO4BNj2sMO0JcRh/Uhf7cqNGo5/yEHGTGdlQj3HwAMAOKrjkmGn+GwenVusbNT0sylj7NQm/E2Bl5+7LE4kbuvJWCybJeWxwovJJLDfBV9XRWfe3EQefppZCyEX1cH9ZrH9Sji2uY6TGC8nuSKDQqWNqeIZCfNwijZxlQ+4GdZiz/7ymRbKeDtTT5WsgaROBmBHNpCvTWZ/oiD0kdr0BytGPcsTOilCiflpzcAWJEDn4jYwVri9JrS2RQOvKUXri/HHyDWtgT1+JZW1XV/R4jY7COBwO3SdOVsleeJePAnqUS7FWbb61u604nKwveE3Fv9kHZtR4KROM8V8PC1J9F/IUUlsaTK1BZrln2o17/Gm+hg+A6/aIVU7zq/9B++KkvDE6qOgVHIAqtLM7Qc9Tq3PfKif3zUnB5buVZXC99s0oyctKbfSSQY0Sbk3BmmrVT/9JpUgjN53/5se1aePig1h3wrrPS9yqLJLD9KHVW4WHSETKe22b6rfYrWD5G0TcqcIh1ZAeguLZwk/k3IwljHnDxGalGVo9WLBziX0gFuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkhrSWJscHY3Vjl0K1IvSWp3YWE0eVlOQ0ViYVRBTHJTdExWUEV0dFhVcmZa?=
 =?utf-8?B?cnBZcmJVcGJPUHlocGdEWkR6Z2VMSXkzdzE2Vld0cG1HTWdVeHZnVlRFZVFX?=
 =?utf-8?B?UjRiSG1KUVRKUksyZDdxNUhodjBRemgzeWd2UkhWK2JHWUtPTWdDOWRLSmxP?=
 =?utf-8?B?VHFEY0tudzkwWk12dVdiY3ljaWNJdUs0QVl2NnVaYVlDT256anVBbEFYejZE?=
 =?utf-8?B?UVhMWWtWWFkvK2U0Y0FwbmdzcU1hR1lWR3RVYXZ5UXM1M2ozWHIvWmRXV25r?=
 =?utf-8?B?azhtYThnd011ell4cDNubzc1MnZybjdUUW9qUWFUUFdJemlTZlRBSTF1cVIy?=
 =?utf-8?B?cmFhaGQyRDR0bkV6Zmg5cXNtVFAxK0c1SVcvYVVzWmwwbng2QkNHVVZPVmRo?=
 =?utf-8?B?cjdMNXoyNE8rYTJJLzA1dC94aFJOWGdFbUkyVjFZTjdwbTAwMnRvR3VQMWZQ?=
 =?utf-8?B?aEJRYU83ZlVyUkxzdURhZTBCNGs0OCttcENyRDFDUkQwbFQzWStqdGRUaHlR?=
 =?utf-8?B?eTBHekhKaVZJS0J6ZjZCNDdJOGRMVGE3anArZkhYSkV3MkQybGpLRkNVT2JS?=
 =?utf-8?B?NEF4bTFmUHk5OUdoV1lRREdVUUNZQWtMVlIzVjJjTEpLaExwU1pMNVJBRlV4?=
 =?utf-8?B?Z0NIVmMvSUhsQ0NoRmppL0dJUWV0bTQwZnFSRmhaY011Z2FMa1FoOFJnRmdO?=
 =?utf-8?B?SnNseWVHNnFuOVpBbEJ1RzlGblZqbkRSVkFqRm1uRGNNVkt3NjdoaHRYakhr?=
 =?utf-8?B?VmtOSU9nQmNpV2RoQ3lYVXdFeXA2M2pnSyszZE9sRmxMUm1ZdU14ajRha2Zk?=
 =?utf-8?B?QS9lbDZxYU1rZENhOVFWUkM1MGVtTGZmTmozV1JzOWJ1SjZQNTdIZmoxY1RO?=
 =?utf-8?B?a2o3V1lDT0V2dFMrSUx4QStrazNnQ3o5NitEcjRJOGpXVEZ3WkVmUFFsY0ZT?=
 =?utf-8?B?L0NSYlNaM3p3RFZWckF1WEh4L280NlplYk9tVmZLRDFPd1BPZnhIdzZYaVVi?=
 =?utf-8?B?RUtFUHBGek5ybGIwemw5MHVPektnRElLcXU4NC9oTnpka0tkelJFdHY5Y1Vi?=
 =?utf-8?B?ZXl3akV0dG1YNktLaVZjaXNRL3luL25JYkxXZ3I5SzFYb01OK0FSeGFYV0g5?=
 =?utf-8?B?MWVReEFLb2s0c2dBN0dFNy9WTEFQeW9oY1hUY3ZiZXFYMEFxN0FrNzlKQlEr?=
 =?utf-8?B?MnlIVU1XTThkMDNWdlZhVWJzc3pmbmZLaktpb3h1bmJEQkhpOXZqZDllQ1pi?=
 =?utf-8?B?QzdLdHFuaHVBYmNFS3VKMTRwUHVaZVNCWXc3azEydWM3aURKK2ZGb3pkcmpu?=
 =?utf-8?B?NjZFZEFhWW1yc3VrYnNUR3dxckswT2pOR001QVpXeTRiU21CTkpPZ2l1enZr?=
 =?utf-8?B?SHdiZkI0WHF5dTlHWnIzbEFyeGFEdHVESFVVeTVwVnRvWjNZYStkQUVyN2gx?=
 =?utf-8?B?dHZQWE9pZTNlMkt5a0JZVUpXU2Y0MUp5YlRFL3RRc2c0Q2pKOVZCNjA5ZjNN?=
 =?utf-8?B?WmdENnUzdllmV3VuWlB1MFR5aDNKL3UrdXNwdC9ydlVnUW5pcXZ0QnFkS3ZJ?=
 =?utf-8?B?Vyt5dWhkaEV0TVRVQXVjd3dwbXkrdzBnaC94cTEwYXV3dkVBYUhXczQycU9x?=
 =?utf-8?B?ekF1YkNPSkdLN2EyR0VBanVpcWw0YTNBT2pOMzRORGd1aTcrQ3J3KzZRM2xS?=
 =?utf-8?B?eUg2T2hpTTFQMFpkK0R4clpBMnBQa2x6Unk5b0FYaHhtZ3NDVVRuMWxydXdn?=
 =?utf-8?B?NEliQldhUkRLeHh3R1phRFdSWS9vVnN2UkdwY21DNklvekhVUzAzZHN5S2xU?=
 =?utf-8?B?RDJSWHcyYXFDN2ozTytQZXpTRWU1Z0lDTWxOSm1jb0NNT2s2UCtLUkliUzJE?=
 =?utf-8?B?ODhEUlRvbGladzRtdUJvRzd4SUpZWUVaWERQdkRiUVZ0SkVITytnTEM2QVRZ?=
 =?utf-8?B?MElwZkVSM09aSCtZU3FZckFpaTJVam01dTFlS0dWQXlOVVkwM3U1MFRwTmEw?=
 =?utf-8?B?OHBNOExaNHRwdnovSVhkL2d5cFlOMTdIMWJlUUNJUlMrQjJwN1Jwd3d5UEVC?=
 =?utf-8?B?L2pya0NLemQ3d1QvVTkweCtvODIxdkVRcms5Vnpid3RqSStEVUxvbUozQzhS?=
 =?utf-8?B?ejkvN2w0bjNkMnd2aHN6a3p2cENzdWwwWlF0UXZORXNaOUNLVGhTVFFzdUsw?=
 =?utf-8?B?QmF5bUZpZHdaSHpJaXJ2NjllbG8rZUZURDZicnhpa0grN2g5Q05ZZ3JITVN1?=
 =?utf-8?B?L2hkaDg1dTFqMm1ZVGNSU1A2Y0VqS3AzeVB0dzZkeHNvdFFNelBqbnA0ZHFN?=
 =?utf-8?B?SnJxemE3a3oxOG00OHNlVTNXM1p5STVoVXZFT3ZKUUtyNE9ISEREMW1PeTdp?=
 =?utf-8?Q?wzY2DeAH8tbEOazI=3D?=
X-Exchange-RoutingPolicyChecked: F5bbX3M/Oz6JdIJzD0lV3KG7I+LzPhg2SIHS5K6cnHbRXhJmc5045E5mOCYQYGQkMVzyEodUZ7WqsQq/ofqA7Z9ZgTybkChP4xAzB0skFNNB/st0FP0ya4g4pxZnNZcgVk73xAOUEUfHKzCg2NH/Fl3PeWtOZsa/2TiWS5PRV22a+gOMkAjrtRMkZe1wg64Igh1rB5+iyihbGT///1v49vtOBskRw4P1xsTahd2gjmNzecP7zyrGwA5zuKreJ2BVqmaeyOyG4BlK08Rt9dI+zN0OuE7yyzsfUJPXAJKc/fSxhnTxdCD2FeAGpyUYWWVVTaWHMV97Qm15CSQ2dKANKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa2be88-a4d4-411a-53fd-08ded1e2488b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 11:18:14.4544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfLbpmWG86c81r7AI6vqrmD1q0Se6TF6J4FA2X9BN7UAHIvHkvMtH2+t5bm7AerMAWekuMu+afdEtU20k+p0NDDKp5zwiuW2bM/dBFH2RWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6806
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

All of the properties are idempotent - setting them multiple times on
the same exec_queue within a single IOCTL doesn't make sense.
Return an error when duplicated property is found.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 663decb19304d..c5edff8397353 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1112,6 +1112,9 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	if (!exec_queue_set_property_funcs[idx])
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, *properties & BIT_ULL(idx)))
+		return -EINVAL;
+
 	*properties |= BIT_ULL(idx);
 	err = exec_queue_user_ext_check(q, *properties);
 	if (XE_IOCTL_DBG(xe, err))
-- 
2.54.0

