Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EABCA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 17:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E98410EA58;
	Thu, 28 Aug 2025 17:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3L0CEDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266C510EA58
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756401681; x=1787937681;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rz1b4uExjum8wEMwtt87Mic0eeEnyGPdWqP3dL9VSjY=;
 b=j3L0CEDmNEDTlO2r7tj4+ur0kPJ/x8lVpVW7EAL1POLng35xuAapnJb3
 6P9oS77sngdjNhBPpP1MN5TVf+mkYAnrObFuxErf6EO3PZeTFwDSnU9Mz
 XCLcPK690bp/MuXJHQh3VJCw5do8fehB8YhtftZhgKBPBce6Me6bgz0be
 rgl5KjZ4qxaqSsnIzdF5iKVRbqlsznlgM4ObKQt5SW1fI9ui69IOqLu/p
 GE5wzf+3QtMaXgCy+F5N3uUKzy8bq3Me6e/SvRx4tU+MU1INywoYu/C4P
 k9AUt2jaumll3BJg+8SG3TYHU+0eGgGrVFX3/QvXNCNcKsEZDtvY2nYgk Q==;
X-CSE-ConnectionGUID: jsJZyzs3T7WqWjjXunddvQ==
X-CSE-MsgGUID: ZV1ti/FhRLSOCr4AA/MNSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69387393"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="69387393"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:21:20 -0700
X-CSE-ConnectionGUID: 0iXWHxqGRJiA5hsYHnGlkQ==
X-CSE-MsgGUID: nxg/yalDRwGMr67dse+llQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="170550838"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:21:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:21:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 10:21:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.51)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:21:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPIaV3vOZGxss2+0wpqgf7wN/6sDJILjawcnzy6riYd6+tIJ0k/ik1p5bAV7X5AltinmS2oNNAwFLyhXDmlKCBFfMWJ54Tn5ZMCYTn53YNBcVBTaO8GMQHsoZHsuQ+L2pajHD461JV+tn/22ztxDSmGJWFa/uDMLJNHob3vb/wKMuIyXxtiCFU3bWaI0rXhPdVtvuzsOCV2RldViRe0H4ENJ8mj/wXdh6ukepwSIWag+eegfgTmVdvlnBc5U3AYpxkJL3bgeONPC2kQ9cFUAIUe5QnfO1g7nOw1dkMHBRdUM/y7beS27baYkLDQ8w2wsC3jgL/chGz2Gn1YIm64Cvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHUnrAwqBEn6NpRqcroyw4tE/X0+a3e6stI+nvR/VdQ=;
 b=v6PZVAysHEmQTDg6CdT1JaqmGuJ8j3dyvcmJWdonFmV5M1TGIpkTObSxonV7GSNnXsf5RQEYH+ynA/tHhsV4HlfUFEWRulhDVtrHjIfXTglltAkxVfLM4Xi+8gDgMUymZkoyznf5dmvRgjHSaTg95ectiy7SN3ZH7LTV0p6VxKodecZeP9cysfiAi/8XhGgmUWPMN8OYEtGrM5+2cZGXojWyJ4SijBHK87RAjDOSsWgi7AxtLGR+RnOx7Tl0A+xto4fBZDT80TnY3QEKwSxNoHk9itjqJvSe2T6RKTykgPjWXvADhCmTpG1j7P7Rz1OVn+q2WjcZlFmHgjUkg20Dsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPFB8C3A0B7C.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::84c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 17:21:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 17:21:06 +0000
Message-ID: <cb231cc7-0173-4b7f-8d1d-b480ac76bb6a@intel.com>
Date: Thu, 28 Aug 2025 19:21:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/guc: Add devm release action to safely tear
 down CT
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Summers Stuart <stuart.summers@intel.com>
References: <20250828104432.23695-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250828104432.23695-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0041.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPFB8C3A0B7C:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a43e59-9891-4778-2708-08dde657456b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YldvQmIzMFlZMDkzcG1xclpNVGx5YnBwdFFHTTNLTTg0anc0SGxFOW52MnBF?=
 =?utf-8?B?by9VakVHK0tyYkpDT0ZyYitKVkEyTGc1YnlRYXBYRGxicDU1ZENPL1V1Y1hj?=
 =?utf-8?B?dCtPZDg2cWE5Wi8rMW5YUEF0bVZjbnZNTUlMNUwxU3d0d3pnNklDcjNEMENO?=
 =?utf-8?B?cFJwQm0rOWtTVUZ3RThRVUJrTzJnQmF3Ylp4RjlDcDJYbUdnMEtPQXNBRzlU?=
 =?utf-8?B?TW5ER0pEYmRvaGFhRkI0dG5qTDU1dVA4WmVzQklWM3didmdWdE9PdHU0cmpO?=
 =?utf-8?B?T0Q4QXNoMWd2dG5VS3JUcjM3OFdMSkx1blh5ZEpvdmJRTUQ5SEMveVRtcER5?=
 =?utf-8?B?Z2ZhSlFUeE03aE5QeXBENUNuMjV1clpxRUd2UktRT0ZTMFJEOTdnWWdwakhs?=
 =?utf-8?B?RGU5aUxucGlWdi9USjA4KzY5QVBFUXBQRlFjdW9FbHpHYzBSZUpiaGNPK2Z2?=
 =?utf-8?B?MUJVZlUxdk14Y1M1bzBJMnpnYnR0NGVPUThyek8ycHNqUXVlZGJ0ckhneExQ?=
 =?utf-8?B?djdOeHE2NTNEdTdIbmV0d25IKzdaLzlTalIvazRyS1JzeVQrY29lTFNyYkcx?=
 =?utf-8?B?U0ZMNDB0Zk9BTnVlTnVpVnc2UEtBcldIbUs1QTNUZENEOFJBQjdnMCs3bzU4?=
 =?utf-8?B?OWtFem1ISExQUmhjOEhFK05iclBnUGxKOU9XOW5raDl3bnJENjd4ckNGekYy?=
 =?utf-8?B?MUZneGFUZjdwUzFLeGY1b0ljTlF2eTJSNTdoNmRZQ2hYS2Vka1FnZDlSaFRS?=
 =?utf-8?B?RFZWK1dMQ0ZWcTZJbVJKL2lVbW44QWRWV09UWjZGUzU5ejFORzdqdy9NR2Vl?=
 =?utf-8?B?cFJMcjRGNFE0UXk2aWZNV2ZwTHBOUTd0eDViRmpFZHR5azNEZG02MkxZbmxQ?=
 =?utf-8?B?amtqSFFPUERYdXRveC9LQkhnNThYYUJiOFRrcWtoa1BWeW9QeFNsL0JEditm?=
 =?utf-8?B?QVFibzhJUjZFOVlTTldkMTdFaFFvZUZCQXAwUGJZdG5qSWNMdjFoaXhNNytW?=
 =?utf-8?B?SUxRWmRjN0tETE5qTVNGNUR6cmIvbi9JRzVyVFBKNjVaZ05ZaWRJeVJtMWtP?=
 =?utf-8?B?M0RFbjNwa2RHYUoyQmJDMi9KaHdVcExzeVhJSWFzclNyRkZMMHZydzh3dXNP?=
 =?utf-8?B?ZnFMdm03ZHUvanR0SFBFVUc1aHQ5S0hKOFp3alJiTTA1KzltTVFzbW1VSC92?=
 =?utf-8?B?WElsM1hTY3ppeVFpQ2JPQWVwZUtVSkZXNkQ3a283SlVKb3RKMnpRdEFlZGJC?=
 =?utf-8?B?bDdsRi8xbFdKYmhDdVhPeGNYSVA5YmtqRW90MFBhZk16OGk5a3kvanh2NVFp?=
 =?utf-8?B?WjNCRE1pL1pScTg2R0Iwa3dlMVM0UUhKUktTdnRnMGh6MUcvNVpGV3V0cTcz?=
 =?utf-8?B?QnpkL25nVURKRlk2MUM1cENzUEdLOHpCK0d6M093Wi9HS3Jqckk5M0NCbW5L?=
 =?utf-8?B?bktwdkY2eUhzTkV6ZjM2LzhWSU8wcDZlWmxrcDhrRGtuOWJFL3ZwaUdvSkY4?=
 =?utf-8?B?ZmtUZnBOYXJjS3hzSnRjRnJ6ejl5SkNBZCtjVG1ibXdCTlFMbzJiaVVlNW1E?=
 =?utf-8?B?d25sd2V5bDJPTW9rWEtyTEZyZFZJVFl5dHRCMTJ5bVFQdXhhVjBzSzlxZ1VF?=
 =?utf-8?B?V1hGVVM2L3VhSmtUR2lBaU1vc2xEUWd5ZkdNa1RvVVBzUmRhL24rTHNiZi9Y?=
 =?utf-8?B?dmZwTGhoanB4a1g3SUJOQjFrb1kvUk5jV1N4Vlg2MUZLUUNEMDUrYlNHK2Uv?=
 =?utf-8?B?MnVmMmxUWXFjdzdoQ29Xd3RBQk9RT2hzMTZ2cUVRMmVNVEtNVVpudnJkdlZY?=
 =?utf-8?B?QUdHZUlYd1FLczRuTnNDQWRDZXVCc3g2dGVuYU1kSGF2UzF6UksxMTkyeHZD?=
 =?utf-8?B?VEJhTTd0Rkxua3ZjK3JNUEd5T0NOVTZLYVhzbVVJdXpoclg0OVN2dGRTeWU4?=
 =?utf-8?Q?FB5btfWriVo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDFGdExXRGdUNUpkaUZ0ZXRWRFNLNVFKYTM0Y1QzT2VMc1dYdjBSYko5VWZ0?=
 =?utf-8?B?MUpmS1Jjd2hZNDlCMWV0Z3AvOFl2akpBNEticnQ1aVV4UGMzT00zbEgyWk54?=
 =?utf-8?B?blZiamY2dGMwZkJtTTN3K2t6KzhxMmpOMzFVTHZxUXNkVXk5ZDlDdjFZU2NJ?=
 =?utf-8?B?OGloWnQ2Y3JhWVMrMVdoU3NQcE8ycWxqTHZ2bkgwbWZSTDlnVjBGZlpBMnNU?=
 =?utf-8?B?S1RpWUlCaUF3cUhLQzJUbUcxMHVzaDFSaXBDdmhmSDQ4aFNZSktMZlU0Z1ln?=
 =?utf-8?B?REM4K0FMRnljVWcwb1pUK1hkT1BXNFFJNFg2WnUrRERMd1ZNajNjalFxUUYx?=
 =?utf-8?B?TWI3eFB6QSs0UEZxSTJSSndkN1Q3RmwvVHZpUWVGMGRuSzJiVDhlZWttWEZG?=
 =?utf-8?B?TkFCeGpOU2pWRytnNzZSWTZZdnJWc2swNEN2TVJoTklGVzFlZGk3MXRLVGVq?=
 =?utf-8?B?OUxhZWVUb2diSjFvOGJodEgrNUhtYUFlTktybEhHU2VnNEtaaG1VYWVwZDZU?=
 =?utf-8?B?bDF3QXJnT3VVZVVnOENST1FqdERrTTQ4WlhRbStnM3ZnZUlEWVo1ajhySG5I?=
 =?utf-8?B?VFkxcm9WY0MydkhmSHhzY3VMUWFUWkM1QXlMQ2xiQ1FueU1mMVZrVjhLeUpi?=
 =?utf-8?B?bG51RTdSWUppQTVZQVlwaWdCTjNEMEtCYzl1Umx5YW5Sb1JtNzE0eVpucTBM?=
 =?utf-8?B?R3dkcEV2OXFhU3hJYTIzaXVwZ1gyVkhHckFvNWhoMndxdzdVdVVkaUVIcEdF?=
 =?utf-8?B?TDI5cW9QeE40c21GRlJPS1JBdkZGaEJpbkNVMHRyT0pOeDd3eFl4K242Z0ZQ?=
 =?utf-8?B?MW1RS3YwdHFRSitMNjVBVUM3TnMrd1RxNUtGeUNpK1FrNzRMTDE5QzRFUXhO?=
 =?utf-8?B?K012b0toZzFGL1NXZTZkR0NDbmtOd3NWcVlvS3R6RjU2QmpUTXZSRWo2cm9S?=
 =?utf-8?B?OW9pYjdpSmJFZnVqNTlHWTBDekJWSXZjalNCWUkvcGpVM1g0VVJEeFlKd09v?=
 =?utf-8?B?WkN0T1hqM0FKZHBnby8zT2VpYmNxZnM5UEV3U3RsWkllZ2M5a202ZUlTWmFU?=
 =?utf-8?B?cU5lVkc3NlBWUkh2MTRVSUFUdmE3bTB1a2FobUx3czBZUjVpcllKeU1TQUYx?=
 =?utf-8?B?bFVBWDdhS0J3VmF4SXZXOXBqM1VsMHI0NHJ4NjBnMW9xRm1UQ01OSDcrN2xR?=
 =?utf-8?B?aDg5eTQ5Q1hnZFlCNWlETGx2QVFoMjJrRE9sS2V5YzMySTV0Y1ZmNmZ2RGE0?=
 =?utf-8?B?WmN3cUNjSGNYanVTeE9RTHhVOVEwQ2kzMzVYVXZvKzFVM0t6TW9RY244czZt?=
 =?utf-8?B?L2JRcnY0VlNRYTNDcUVleksrS0Z2QUhJemFCSUg1S25jbXhQN1hmTEJHSXMz?=
 =?utf-8?B?MmxnWjc2T2M4VG1GQUd0dWQ4TjVELythbEtVWHlSbDRUcDVjQmU2dUNKQXNw?=
 =?utf-8?B?U0JHeXFxdmd2RnhVVG91SiszYk5Wem9EM2lZbVp6MGd3VFRjSkFwdC92Z3pG?=
 =?utf-8?B?VXUwOWNOQXhSTWVxd3MvaExLSFcxYmd3eWQ5ME9nTDk0bzh3bnF3OWpYeXYx?=
 =?utf-8?B?NGx2QWpMT0IwMk9vWEtQeGJCaXZCNi9JcmhRN3M0Ymg5SjBqMWN2RTFsYUJH?=
 =?utf-8?B?RzI4NmZaZmtyelNYdWJjZTVqb3haWGVpZG82RndWUUdhL0l2WjFJMDN0dTJR?=
 =?utf-8?B?V3VldFl4Wk5JQ0RBWmJkTnZzakxqamJaVFpEdGpYMmkwaFZwczBYbkExWlAv?=
 =?utf-8?B?eXRNUU03Z0ZJQ2VJZjBXQmUvL3U5VFpVdjlrREFOSGU0QkhGK0wrK1M4NXBm?=
 =?utf-8?B?cEFIWTJHM04zdVFZUlZ2MEpDU1ZRTkdjaVBtaURQU0pMZ2QvOTFkSTF0a0Iv?=
 =?utf-8?B?NG5UdWZTQzRTbmM5QUl2cmFuUUJWNUZPazBIaXFkWEJKY3I3cE56V0dIdzd0?=
 =?utf-8?B?SkgwMmQ0aUViT1F1bjJQekZMUjAxaUV0MGtzbTF0QjRZZG9qanB4N3FCd0s4?=
 =?utf-8?B?WWFXck5paFVRNUVSUHBBUjhESVF4cFpiOVZQb043VlZBcnVkLytwTHNzL01q?=
 =?utf-8?B?T25sdnN0dHFSZ0tuaG50d29xSzM1aUJDWWRjQnZ5a1RraGxLSHZSOUpkUEsv?=
 =?utf-8?B?OUxyWkxwNHhnd3NxMW9EKzBNVFBma3ZqL21JYXF5WVo5UmsxNlVJbzUrSGtG?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a43e59-9891-4778-2708-08dde657456b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:21:05.9676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lceeA58RF8nhZZuXuzYYHSClV0jp9/K52NtlsT6GPhwE91LplFQxe8TOccFBrl1y1pHNZYT3KsH76rdnmPTxEJu1qWZX1ZIQy4rtJxhCXyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFB8C3A0B7C
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



On 8/28/2025 12:44 PM, Satyanarayana K V P wrote:
> When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
> flag, the driver initiates TLB invalidation requests via the CTB mechanism
> while releasing the BO. However a premature release of the CTB BO can lead
> to system crashes, as observed in:
> 
> Oops: Oops: 0000 [#1] SMP NOPTI
> RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
> Call Trace:
>  guc_ct_send_locked+0x8b/0x670 [xe]
>  xe_guc_ct_send_locked+0x19/0x60 [xe]
>  send_tlb_invalidation+0xb4/0x460 [xe]
>  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
>  ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
>  ggtt_node_remove+0x110/0x140 [xe]
>  xe_ggtt_node_remove+0x40/0xa0 [xe]
>  xe_ggtt_remove_bo+0x87/0x250 [xe]
> 
> Introduce a devm-managed release action during xe_guc_ct_init() and
> xe_guc_ct_init_post_hwconfig() to ensure proper CTB disablement before
> resource deallocation, preventing the use-after-free scenario.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Summers Stuart <stuart.summers@intel.com>
> 
> ---
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> (with #rev1)
> 
> V2 -> V3:
> - Fixed review comments (Michal).
> 
> V1 -> V2:
> - Fixed review comments (Michal & Matt B).
> ---
>  drivers/gpu/drm/xe/xe_guc.c    | 12 +++++-----
>  drivers/gpu/drm/xe/xe_guc_ct.c | 40 +++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>  3 files changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 37d06c51180c..ed0da4ebd928 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -706,14 +706,8 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>  		return ret;
>  
>  	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);

btw, IMO this should be moved (in separate patch) to existing function:

	xe_guc_ads_init_post_hwconfig()

> -	if (ret)
> -		return ret;
> -
> -	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
> -	if (ret)
> -		return ret;
>  
> -	return 0;
> +	return ret;

maybe just drop the chunk with reinit(ct.bo) without reformatting rest of the code


>  }
>  
>  static int vf_guc_init_noalloc(struct xe_guc *guc)
> @@ -847,6 +841,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> +	ret = xe_guc_ct_init_post_hwconfig(&guc->ct);
> +	if (ret)
> +		return ret;
> +
>  	guc_init_params_post_hwconfig(guc);
>  
>  	ret = xe_guc_submit_init(guc, ~0);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 848065a25c44..0b88cfb05e7b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
>  static void g2h_worker_func(struct work_struct *w);
>  static void safe_mode_worker_func(struct work_struct *w);
>  static void ct_exit_safe_mode(struct xe_guc_ct *ct);
> +static void guc_ct_change_state(struct xe_guc_ct *ct,
> +				enum xe_guc_ct_state state);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  enum {
> @@ -252,6 +254,13 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>  
> +static void guc_action_disable_ct(void *arg)
> +{
> +	struct xe_guc_ct *ct = arg;
> +
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
> +}
> +
>  int xe_guc_ct_init(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> @@ -268,10 +277,39 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  		return PTR_ERR(bo);
>  
>  	ct->bo = bo;
> -	return 0;
> +
> +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>  
> +/**
> + * xe_guc_ct_init_post_hwconfig - Reinitialize the GuC CTB in VRAM
> + * @ct: the &xe_guc_ct.

remove trailing dot

> + *
> + * Allocate a new BO in VRAM and free the previous BO that was allocated
> + * in system memory (SMEM).

make a note that this BO reinit is only for DGFX

> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +
> +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_gt *gt = ct_to_gt(ct);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	int ret;
> +
> +	if (!IS_DGFX(xe))
> +		return 0;

hmm, I'm wondering if this is good that we will have two different
unwind points where we will disable CT (one for DGFX other for !DGFX)

maybe we should just reinit(bo) for DGFX but replace disable_action
unconditionally ?

> +
> +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);

hmm, maybe we should assert that CT is still/already disabled when
we do this re-initialization? near the start of the function

> +	if (ret)
> +		return ret;
> +
> +	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
> +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
> +}
> +
>  #define desc_read(xe_, guc_ctb__, field_)			\
>  	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
>  			struct guc_ct_buffer_desc, field_)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 18d4225e6502..16d82c0e6cde 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  
>  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
>  
> +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);

put it closer to the existing ct_init() declaration

> +
>  #endif

