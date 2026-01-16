Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D93D47CCD
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 10:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DBE10E84E;
	Fri, 16 Jan 2026 10:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tj4blHeV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A6310E855
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768558393; x=1800094393;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ce8RO07zWAE49Eo1Rtegw5A0G0u3UjtxIvJKAaWe5XA=;
 b=Tj4blHeVA3UlFK26hSi1TyPXD6oAS2K1w4FBk9JeyPykAEeLkTOic3FV
 2tlLTljoeh7RByJ7dioJn8sJoXfQqINe3jUf2CKBgCI+kqmSAUG6Hw4Zt
 sn5IcJ7GsAZdXZp/9ABsxRImUjQ+2ojF1A9omEn+Q5jeWukno0X7HbZpD
 yS+C4FCzIUZ7lAlyOAkdITQevrusizAuGHEshwevPcdd6H5CHxEea7vJ4
 YVi9PudYTwIqLVZ+2n5d/nE9nKJ8EiTL/lCk/ct0rN53k5iGmRLKiA9sV
 W4u3YatG1WjIruK5Pcav7QQmkdIT3EZqqnAhMIkhA9b1dX60PtfkwvR/P A==;
X-CSE-ConnectionGUID: cOsYbPRsQRyNcmgMoU0jnA==
X-CSE-MsgGUID: BSQ2FtpZSRSZ5rpB+3tYEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80593102"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="80593102"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:13:12 -0800
X-CSE-ConnectionGUID: 0fQ7QUHdQCem67KCZGdRww==
X-CSE-MsgGUID: kt2R6lD7QwSLqNETOztXPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="205624723"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:13:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 02:13:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 02:13:11 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 02:13:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HC1bx4V4LivfLxlBEKuBnWaW34WhEXzVpOFe/4wpYSP/kh+e/0/84Nzy488lmZjKUcac31AAEV/UD2o1vSWLGviyVWJ3oySQ7ZDaKwHz/k52L8OkI068zyKB3A5VNqOPdIAKk3+uMJFsUEu1EMJPutuJUqt0WsoBG3fGzMxelH4oHnOhZyKajKjeRdwEa/4I5UkY8EFJ+hSfdWHTlpUOdnhweKd1psBxzkQgBl+dKKPyMasHmSwp+wUGXjQscL7ZLZjC8Pe2lecKteWV5tROjS0c7VqSW9ioAJ6zfX5rrdmSqMpoGRvoW87kKZWtf4q1Dm19UyT7RufSckwkIrP0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBnOKJiUekrCAHRjWt/xyqr9YZENH+4CdGJ+S2ZY+NA=;
 b=YElWdkIk73Rq0lQ4FIT7MXyZNEiaQmHxm9P7EdJ5r94QHx9J7pxcq68SYTHrrLlTC9VysYKihZTqNWjAo1jgPLi4VL/eRTdIrDVbTibvZBIHD1++z/5GniLO0pBmZYbJqQQWueiCIEef0O9Pqy+U1atZd/bW/mNUDxW+Du8byrBHMb7opBt54Ae53BPwy21Ir0LeMoyvk0uCzxnr5oJdQz5PCDkQqeZDFCUpH9GL2nHzyuZcFA2ZP4VItn89u6A2y+UuVG0eeua82tu1xwBQ6J5hxM51XCmQLOJRWi+vyFBiCQVrL6wQ6zcalzgBPdbYfEyc5VIoJK3D66aOYefogA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA3PR11MB9485.namprd11.prod.outlook.com (2603:10b6:806:45e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 16 Jan
 2026 10:13:05 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 10:13:04 +0000
Date: Fri, 16 Jan 2026 11:12:57 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Carlos Santa
 <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <aWoPKWxu7zIqZPog@fdugast-desk>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0207.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA3PR11MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a42c9e3-8ced-4884-eec7-08de54e7d682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlJhRVdGNG94bFo0V0pPZFdHL2pCY05IQlNQN3ZVZG53UW4rOUJzQWJuQlJ3?=
 =?utf-8?B?MnVSRzRWVENlMlJMNnZIZWt3dUxadlc1REwzZ0czQ1Nia0EwTytNTmJpcTNT?=
 =?utf-8?B?ZXE2YVk4bG9tQkpIdnlKbm8vMlR5NlZGRFcrQk1DQzdvMXVkYXI5Q1lpL0NN?=
 =?utf-8?B?Z1ozMlhCWUgxK0ZkbTVFSlJSZmUxZlRwMmRQdk1nd0p5TUh5UHlyZHpyMEky?=
 =?utf-8?B?c3ZTRzk0eUNjQVk5WnQ4cjA3N1pRb2plUWl4bDEwS0REOUw2VDJvVzBESCtK?=
 =?utf-8?B?eXRMOXp2Qm9ZZ3NZVUcwZVIxVVk4eVArdWF0OGg3WGdzeHd4alp0Nzhmak1u?=
 =?utf-8?B?aFNBcTNLQXJGVHVVazNYZXpBWkRDa0NQYlp3RXo0WkYrbGhNRUJrUC9jNDdp?=
 =?utf-8?B?WnlRb29BUi9Zekw0YTZaQ2kvRlhRUERxK3ZUN3pKRFJxMFM5bnVQQ0xGOCtv?=
 =?utf-8?B?OU5MVXZFVzErZDdXOXo1SnVaTnBOR1R4VktkcDk0R3cweDc4QmVscFQxK25L?=
 =?utf-8?B?SXMydlhOcDM4U1JlSmVESTBHTHJPYWFvNjhOWWtuQkFZSURLbDlxeUx5OVhl?=
 =?utf-8?B?Q0tFMjZCUWxaOXkyblVxNDJrY3lMR0RwaGxqQnpIZmVMWERxZmV5YkxNbnJS?=
 =?utf-8?B?azRKdUZQaHB4RTVMQXVSSkUxdVM4My9lNENLRUZ0K2pIQXRJem43NGRHT0E4?=
 =?utf-8?B?SllIVHo3NnRPcVhJY0c0ZnZXVWZOWW04QWlVbGREdExlNHZtNEdaSlV6Nkow?=
 =?utf-8?B?aFpGbmo0eHFxdUxVVEJPcWc1T01HeVZ4UDcxZnAxUUFveVltaW1oSEJBSVpJ?=
 =?utf-8?B?ZXl2UCtVWVFCWHFaRHVWRkdtWjE2TkFLK0tQY2hxbWpqT2RUVnl1RXFiK2NL?=
 =?utf-8?B?ZUc3YzJSeUFheHZlNWtVMGd2WkFYanZtbTVpMGFEVTdMOTdLTHc2cUlvcEZF?=
 =?utf-8?B?NDB6RlVrcHNiMG5hYmtTMEUyMy9NVjMxckhFZ29SWXEvUTZvNWlURmY0ZXEy?=
 =?utf-8?B?NjkxZEpyeFZSQVRRazQvenh0MUR1SU1IRnM2U0V2dHlXOEJSS2RxMEJIYVpK?=
 =?utf-8?B?bjlmNVQ5SkxNT0psUFZQN3JVeXdoV2pQYi9YYjEvZHI1TDYwM3lzQkc0SFEx?=
 =?utf-8?B?dWwvamhybFZkSEhiYktpWTNvSldPQ3QxUHhDdHFYNWdkZ1VaYkhUeHljRHh0?=
 =?utf-8?B?MHlvWlFpV1RtNjEwL0pNemZZTmdrenNzVUtqdnJ0NFA2eFJRSWZpY0hMTmZh?=
 =?utf-8?B?MStGc09HM1p1elhpL3p0SzFKaGlyVlNFTHVIY2pVZldXYnN3ZVF0Y1prRk42?=
 =?utf-8?B?YTJSckR5TmpCUTRjYWhxS0NGd1Q4ODNpWEh2ZjRyTGtpa21kcGZ5bk1UOU56?=
 =?utf-8?B?N281Q1hNZU8vQUl3TnVob25Za3ZQMGZhaWYzcmdUTGI1Tkh6RVJoeHQ3blVo?=
 =?utf-8?B?YWoyZFdwRnJrTWV5YjRKQWphQjVLTVQwT3lCNkZSODdrbGFyYldJTWo1T2wy?=
 =?utf-8?B?SXNIMlNOalVOZU9rTkhQeUZWNVFzbm5YOFhLZ0o1YVZ3WFhiY0ZGeUtCcXp6?=
 =?utf-8?B?TytBYVhMRFJQeVpvbnNMQXNGNC9GSUNTVHpFc2kvN0FWMzhiU1M4akxsQ1pn?=
 =?utf-8?B?WjRtRjZLVWM3SEdQTnIzOVhVRGJnQkNJeVpWYjZMaU9velZnRmI2TGFabUFF?=
 =?utf-8?B?TWVOWkRPWDVRbmk3U3BIbC9SZVJjWEl4VzRsckEyWTArWUtyeHZKZFpVcnVK?=
 =?utf-8?B?RWlSOUY5VUgwOTlGWlpZK3BEMTFCRVR4VWY1K3VycUVwS2VGOW1pNit1c1Vp?=
 =?utf-8?B?dm9TYTN1TDE1c2llWnpWRTlxbEFIK0NqV1h1aDVlNURBekJoUXdGNlBmQlQ5?=
 =?utf-8?B?ZGR6QjV1M1k4bkxPbTV3MUl5QlJDUTNSK0tyNmZuS0VQYitwcUxsUEwzMUdN?=
 =?utf-8?B?Yi93QlFaMTdrT0tNTHRXOHdJSStKQWduUnRRa0JQelptc1ZjRndkRWlIYm9z?=
 =?utf-8?B?TUNxa2NVaFdXczI2clR6NTBXWHN2YlNrbU5HYzdOSGQyNkhtSFFJdkVMbHdH?=
 =?utf-8?B?dnowZHZnM2pjb0o3V0hTd013MDlZRU9kUzQwVkZGZ3Z5TENYZzcvNTgyU2tC?=
 =?utf-8?Q?EmN8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDAvQ3UrdkU1Z0M4K2RoS0k0MzA4RHlRV2haY2s0Z2o4VUVENlU0clVKZDI5?=
 =?utf-8?B?M0hKcHFNamRSUTE3aE5sWXZnTndhZjJDblJPckJNbFl5RGdKd1N0U1RsR2JT?=
 =?utf-8?B?QWJqOStJcC95dkpwMGJOaTNFckxHL042dlBVblZrQ3JYQVYxT2tPMW91V2lp?=
 =?utf-8?B?ZEx0Y1BjZkwxWDB4M2x1MHRqUjRnSnNYa05ZR1JLQXJOTmhublc5dDJXL0E4?=
 =?utf-8?B?U29VQytXRnNLTHAyR2pTTjNoNktvQ3hBVzMyRkhwN3FzSzlhSTRrU3NlMmt3?=
 =?utf-8?B?UDFBV2YvdHA1MFR4ZVI4NS9oYkh2OWd3MUFyVHFaalNhcERGM3ZKL0hXMW5o?=
 =?utf-8?B?M0srNTN3OEpqWEtENnJ6a2ZKdlZwUmdQdWN0QUh3bVIyS2NtV1ZwSUxFeHJ5?=
 =?utf-8?B?bWpSdFlhL0I5MjRLWklKQ250cTR2VHlDSU1VeGh5dXhTS2EzSVVqa2pldHoy?=
 =?utf-8?B?b2VvTmNkZzNyazhHNU5pOFRYVTBoTmNBa3pmd0E5Uno0NVNjNmoxaHE1SFl1?=
 =?utf-8?B?WTM2QXBYNnZTbDZCSzF2MEE0bCsrU3FyZGtlZTJaYmpqMkFERXgyODZEQWRB?=
 =?utf-8?B?a3l2d3RBaDNFYkcvN2JjS2ZpeWZKYm5WMTMwdWRjVlFXdXFOODlkcWtiRWpE?=
 =?utf-8?B?ZklzSVYxVCtkSERDbTdrNmdHb0RySzZZT2QwMm9VOFFjQWM2OXRoR2p2amVh?=
 =?utf-8?B?V3RYaE8vanVzNUIzU2QyUlFhWWgvR09kT011WFZaTlU4RkRHUVJaMkVaQndz?=
 =?utf-8?B?RnF1cVdBTDdrWURvS0NXaTBqTTZQaU5yZDJ4OTFUZVZQbUVwSlk2eE9nRTk2?=
 =?utf-8?B?WDAyRVI5Q3dnbWx0c1VuQ3ByRklNNnJoak5TZ3o0VzNwaUdCdGFnU0Z1eENa?=
 =?utf-8?B?SVhzbFR4K1RzSjRNZDJtdE0rOWdQeGtDamg0NUUyOGw0QTVzYUxmcDBuR09Q?=
 =?utf-8?B?TUVhM1IzWE9xcGRDMHJhWlJQUVRwdjNpeEhSWjVBNThDOVlsbUJieXhYZU83?=
 =?utf-8?B?S3YvUzdqSnlqQ3hybEo3U3Z1VDBBTjgrQkhSR0FtTm5ySm9EZi92akdhcXZG?=
 =?utf-8?B?MWdWZlRqbzJWTUdvQlNaM3JTMUdYS1U3dlF1WTVWUXN3blVZeGl2U1JSRGR1?=
 =?utf-8?B?SXIyM2hlNzhRakNDMWNxc2NpV1FoOGxPVFdraTBreDZ1SEFaakFwRnpCOFhV?=
 =?utf-8?B?ZWlIbktSZW9hK1VodUNZdWFMcFB5VVczODFEWGpLSG92Q2NRK21qVG43NjN6?=
 =?utf-8?B?OWV0WWU0RDdvT3JucURib0hhSTlOaFRyN2JFUWkwMWQ5VGkzVG4zbCs1aTh5?=
 =?utf-8?B?dTQxNWVKb0kyQkxZakltSlBGYzA3SkI0QW8rLzVuRnVxVllDVWQ5UGMzNGht?=
 =?utf-8?B?cWJyWEVOdks0RFA0WkRtYmorMlZlNDloTXh4SEtCUGl0WFFTVmY4SzR5Zndl?=
 =?utf-8?B?WUF2ZTQ3U2RFeVk5NzlrS3FCeTFERUdUa2JvdGkrdnFSUmxYeGxLM1BwL2wv?=
 =?utf-8?B?WGcwdExiSVZ0ajZ6TFZLSHJuNnVyNTA5bDFuTDF6U0VrSlpaWmV6bmNBd3p4?=
 =?utf-8?B?VFFudUQvckJNV2E2RG42TklyUXRMS0NhcTE1WlluRDY5TnJoYkxGUUtjRHZR?=
 =?utf-8?B?ajlLY21idUxMbjNuMHpuZnJlSnpQNHlYMlVic3V3dTdGZXNyT1gwSUdEK3U3?=
 =?utf-8?B?NWZiYmtiWjI0YUNERjluWVVSTTZUaENJeFV1TXNYWkcvZmZ2bkYzcHZxQnlm?=
 =?utf-8?B?U2JpaHJwbTlRdy9Ob21EL2RxYUlFR1RzZ1BaK1R5bllIeGc3UStJQjZpaUlG?=
 =?utf-8?B?T2s0ZHMwUGs4dVVtREd5YWJWdGhBOGE0VmF4Ly9UdFVKc2U0YjI5eUFVNWJW?=
 =?utf-8?B?RE52azM1cU1SWjZOclFpS3FQdlZpWDhqclRLOHVHdFJFNU0zVGJNeXhPVVA3?=
 =?utf-8?B?bkZoRUdIb01nMVpPK0h6ZzJIUTU4ZWZVb0t0ZTE3d3R5SlJhbUh2UDNiL0pp?=
 =?utf-8?B?ZExxZmhtelhIL3dsNDJUN0RuMGkxa1B2ZG9FTHdCODh0Q09ER3NvZG5MbjZW?=
 =?utf-8?B?K0V0NjZEU0FNWjF0QW1zcGFGckl6ZmMwa1VtS2svMHZZRWtCbnU0N0JFSzhu?=
 =?utf-8?B?M3JmRit3bE1JQWlzZUk2QWgycnBoWnhOVmcrb0Erb1ZIWGFyUm1RekoyeFJF?=
 =?utf-8?B?bS9lU3FibnVYNjFudGpISittNDZEM2JZYUhna3FGZXluOWMwVVNHeVpCUmRL?=
 =?utf-8?B?bU1rWHF4VFk4RGpwemQxUVNFUFVWOHVkdThpTlhpWis0RytaUG5JNGRpcFVI?=
 =?utf-8?B?VFN2aHJHMnYwZ1p2bGFpK2pNUUphS0RPN2tYTDZNa0U4eThrb0k1NDRJUnV5?=
 =?utf-8?Q?zT3z6cqfuzGGiUc0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a42c9e3-8ced-4884-eec7-08de54e7d682
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:13:04.8368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emZ33lj4d13Rg+zpTtrLTLrB73FFcxCVmomTaFJsyS9z7xO6aw/ef8lRrof+NPj+7EWY5Tosqrk2vGvk2Tw4iNgF2ZBTZ4Nva+ozLVzvmKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9485
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

On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
> On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> > If a batch buffer is complete, it makes little sense to preempt the
> > fence signaling instructions in the ring, as the largest portion of the
> > work (the batch buffer) is already done and fence signaling consists of
> > only a few instructions. If these instructions are preempted, the GuC
> > would need to perform a context switch just to signal the fence, which
> > is costly and delays fence signaling. Avoid this scenario by disabling
> > preemption immediately after the BB start instruction and re-enabling it
> > after executing the fence signaling instructions.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: Carlos Santa <carlos.santa@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index a1fd99f2d539..cd645ee400b9 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
> >  
> >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> >  
> > +	/* Don't preempt fence signaling */
> > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > +
> >  	if (job->user_fence.used) {
> >  		i = emit_flush_dw(dw, i);
> >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> >  
> >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> >  
> > +	/* Don't preempt fence signaling */
> > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > +
> >  	if (job->user_fence.used) {
> >  		i = emit_flush_dw(dw, i);
> >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >  
> >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> >  
> > +	/* Don't preempt fence signaling */
> > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > +
> 
> IGT tests which calls compute-walker, then bbe are asynchronous (don't
> wait for completion, pipe-control is necessary to wait on
> compute-walker).
> 
> May you try to put arb disable after emit_render_cache_flush?

Thanks Zbigniew, xe_compute_preempt tests do pass with this change:

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index cd645ee400b9..d8cceab97fa8 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -405,11 +405,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
        i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
+       i = emit_render_cache_flush(job, dw, i);
+
        /* Don't preempt fence signaling */
        dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
 
-       i = emit_render_cache_flush(job, dw, i);
-
        if (job->user_fence.used)
                i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
                                                job->user_fence.value,


Francois

> 
> --
> Zbigniew
> 
> >  	i = emit_render_cache_flush(job, dw, i);
> >  
> >  	if (job->user_fence.used)
> > -- 
> > 2.34.1
> > 
