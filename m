Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16724C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 10:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C0288284;
	Fri, 27 Jun 2025 10:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NP4XP5Qe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CBD88284
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751018662; x=1782554662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NBVl9mD27Wkh1qmXgX7xPrVvZlo+PYqq/bAbY7XJD9g=;
 b=NP4XP5QebgUKxw3f993k1rJn2o6o6s0jhh2Hm+3UzkQhrmY89KYXpLtD
 Bk7yMlAYd7EfexReg+BhOCHZy1V5owE0P/hUXvHBhCS6+DpNPfA22Mexo
 ZVLhs413smnECQBwciPXD2lbNqX+lchBqjQxDCmRr5ENu2pBlQyX2iFl0
 6Ex9Tsz4OocOtw1ZycAj+m5XHW+LEyK5cRr8Ywg4mRZAhNHdUJNI3vEWK
 0qVG5sv1AqB9W5mJ4IbLgZGByT68UlF1+xD7fScsjN39yEnWQEoxekG7t
 XboWR2MTQ29mqjYKEDXB8kIu7ECf60V9wrCQrrUNTcCRVPoXMi/DjP9I0 Q==;
X-CSE-ConnectionGUID: uZDKgg2vQHSBlSsdy9oekw==
X-CSE-MsgGUID: JBtOjs8cTjWQp2UZj4TWYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64387189"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="64387189"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:04:21 -0700
X-CSE-ConnectionGUID: RCS4O0zDSpGcCONMo23TKg==
X-CSE-MsgGUID: cppaHt1yT6uoD2qoSL0Alw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="157052667"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:04:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 03:03:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 03:03:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 03:03:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGh0yQTBZhqM3LmQA9O1O+1jG3QZVNGuBoRnNJwh+ljrCjm75GX3YsjKdERsMFhxGcI2rECcZSFc2tRjW5hKUOdKlwqgTwRCWOYUGLDOjIGKbeFMr9vJTPJ0mFtBYl8k1oQtYrU4bBWfO0+j0rn0zXH3zwLsnsfGLJc0Q3keN+q0OF8rMG5aBBAXBIRuTHJg9DBQEhVhWrtogll7VeEK5eSK2B6zz5hiNLtThhQupaOTbTiN8GmWeMxLA8rsRi49fJ6SRkQCFxC9sPkbYePjWCGJZrFXI65lA90nBq5YdbBjGHaTGLGRQK5vHWkqgvJFSDIBGvS7Z/1jAcN9XQMHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+q77Blv7TkjBg/sqVAZdSVZT9+b4YxfnNk9PxCddwI=;
 b=TdVaSFHjGR4fagTw1/fwvGQIs0hgQLnj892/8jVzzr4HBeOeltpD7YqkHFbFeJgylamUh++DOIvNt2Uq2FlVt13u1y1wTvF/5hjU434pfjbZoquF8vFJ9kqNkHJaLuEnDQeq/JLhdYGNTiwHk57ymqyf4bnHGp6GEQhQyMpklWXF6nCD4vy3PTfm6xgV78d8weColrZPxXxf4d4pLtgqd9+KewGvUm7inWZ0/ShcmjKxErRfW8lis7EHX6rJNUiZQq33aUPAGX83XVV9ObMP9Gj1ayTHHcZVez2iVhqm5esQ3Oez5joh7/uoz9geZFEKrN2jHWVF9peXYWV7inorgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 10:03:27 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Fri, 27 Jun 2025
 10:03:27 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 2/4] drm/xe: Use dynamic allocation for tile and device
 VRAM region structures
Date: Fri, 27 Jun 2025 12:03:06 +0200
Message-ID: <20250627100308.3401653-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627100308.3401653-1-piotr.piorkowski@intel.com>
References: <20250627100308.3401653-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0281.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: a20e082d-c71f-4bf1-3a68-08ddb561dc64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFNaWnQ2NUJCeUE1VzBCd3lXMFpoSnJCK05IM1FJQ0NNTjVxRUpmM0F5Zzcz?=
 =?utf-8?B?ZDlIK1BQSEFPeE5yS0llWFJ2Sm9kTXhuK0EycXdSOU5WMDFhUGdIMG1jVnFF?=
 =?utf-8?B?eDU0MGx4VnZOTkVRY29xVnd0Qjk2S2VQMTlQVnhCWURzbGZpUmRUd2VZdTNm?=
 =?utf-8?B?RkdRbWlITUJUNVNoMmhsTk83WU5vMnNLWlRubXBVNThQZW5QVi96K1pJNHlx?=
 =?utf-8?B?b2dxdVBYYWM4L2FGY29TUnFTaEU2QlRybGNJK0U2dEpkNTZ3Q25mQWl1Qzlx?=
 =?utf-8?B?YlBWWFZZZEU2RXZyM0pOb2lBQjFIQjc1Q0xLdmFTN29mb2RFNjFGYXRCNC81?=
 =?utf-8?B?VW42UVBKbWxrTjM1QW10Q21OdjRGV25EMk5vZlBEaHRRNUF1dmdCdU1ITU5H?=
 =?utf-8?B?SUQxT0ZWSnhRTTA0NlZFTkdXdlBjd1B3MEJlQlYzZnFhU0pPb05STWhWZ2tz?=
 =?utf-8?B?ZVBlOFdxS1RWQTQ0SnJDV2xFU28yeWJVWlhudjYvMkNCWWV3eGhSaW43SmIy?=
 =?utf-8?B?OUp2ZXMvWDRKWlFIcVBOQjJORnRkbG55djVzNzNWNk1pOFl4TTdZSUJUcGRu?=
 =?utf-8?B?OGdEcWdSRkRaOXMrRStOVXROemhhSjgzdXJhTEFGTWVlVlJxcFhVcml3N2Jp?=
 =?utf-8?B?UUZWdmNHdGlCMDEzdGFNTUpqMzl4Nnd3UDR0ZUNVODVwSkR1dW1MVTc0SU1m?=
 =?utf-8?B?cE96dW5kUWZHeEZ6TEVwTG9valJOVjk0a0hvZktaai9CcEFHbk0vSFV1YzZH?=
 =?utf-8?B?Ti9sOGhNWXlxbjBHdDFCNXgwZUhxcjlvQWhTck5tbXBFVWl1WGt1dW9vSlNl?=
 =?utf-8?B?akVCd1hTVlFvcVF0dy9MWXRMc2xaWlZTRlZTZmZxeDQ4UDdPR3JScnd2TVM2?=
 =?utf-8?B?OWlzaWpLU01VU1ljMjhuYTNiWmRaVzh3Z3gzN1hjaVVUT3BoUG1kL0Uwd0ZZ?=
 =?utf-8?B?d09uc2w0QTdNUW02Lys5QTRISzQ5WXpIQTBub3F2TjBxU2ZSMmRxcmRBUFpL?=
 =?utf-8?B?VnpORjdXR0xjS05rSmNUZE1yWDFTclJtTWZvakpKeWpNc0pFTmJGeXRrQkxl?=
 =?utf-8?B?UXh2YXJhenFFNXIrTnpCWlEvazVhOTlBMXhwN0dIZi8zT0M1QnJHT3UrZVdE?=
 =?utf-8?B?R0NNS09Gckt2R1BwY01mQnR2MmRrTk5KTVFlTmt5WUxQR2hHRnZRR1pQeXhY?=
 =?utf-8?B?MkJ4VUt2UWN6OWFmQ0p3NUxaOVVtRjNHd08rcmU3UzRZYS83cmp2NUtFWEtV?=
 =?utf-8?B?SUVXTXdIa0VvZ2JvdHhDeDR3K3JUNVZVSERoQ0MxVENWOVNBOU5UTGxzaVpp?=
 =?utf-8?B?cEdTV2NvalBjQ3hoK25HbUlncUJoL2pVRlRUTzc2WG1tZWZaOFNzdjN5WmVK?=
 =?utf-8?B?bXdoYXUzSkNrR28wUDM4WVpXWXJIU21YSnJmcXhtNHFOMExKTE1ka3ZBVlEv?=
 =?utf-8?B?U2dtWTdNcVJpamdQMEluZkRYRVQ0UmVGdlBYQUFHK3I4WWowOVlyc1lPbHN3?=
 =?utf-8?B?bTc0RHRtYnpNcmpDQnJxSTBsMjZPN3FWUXVmaGprN3BwS1lVN1lsaFdhQWxO?=
 =?utf-8?B?RERITnN3R2syUTBPQ0ZvcVRCblBvR0Y4enJzNFdPVHVwNjNMaGIvY0swdTRD?=
 =?utf-8?B?ZFlrMlFFOStpanlCbmUrMURjci9ma0grTGcrTVVuTUVIRVlNM3Y4VEJYZ1JX?=
 =?utf-8?B?eUFmOXRVMlR4cU1hdWtFK0Z2R2ZOU04vd2Q1Q2YrR29lVVVlSnVKT3ZlYXhs?=
 =?utf-8?B?eFFyeFhRUDJTZkVWMGx5UytjZlp1MFRVcTExL0xLREE4U1RZL2VnZnVLOFNo?=
 =?utf-8?B?VG44bjFrVUE0NUIvbHRHUzdJejE0dmlyd0pUZWdDVXBEckwycXlIRWJDWCtR?=
 =?utf-8?B?TmgzRHhWTkdYbG5CRWNqUUIzUlBTcURaR1hmQWFuc1RkbEVxektzdDdnZU9Z?=
 =?utf-8?Q?daY+BbNMPCM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEYrRFFFSXJVdytSYkdNbmVHUXg2MEQrRXRoMjlhSVkxN3VNc1RKVit4M2dP?=
 =?utf-8?B?dlBJQTAvNFBMdCs0OWVzK0d3Y296N09ET21MRFVBSW5PM0RYcjQrT01HVFpw?=
 =?utf-8?B?ZWVmQlY1aEd4cUNlaGJkcWNvNzZHOFhxanFzbUxDUnJudnd2MDkyeTFXWEFX?=
 =?utf-8?B?MkM3Mkxmc1RRUzYxc2lmUStnRGhNSlJsaWMvdUtTcW1QcE1WekZvYVBoaXow?=
 =?utf-8?B?cjFnc3VrNHFzWk1mVkJLY2hrSUhZZ3RkTEs0N2N5UHQ1ZUJOTm9jbG1PS2Fn?=
 =?utf-8?B?WDI1a0h1SHNsTGowZmNWQVFkYmZPNGxDaUhacGFZcWhDM0xJa2FPaFVPdGFr?=
 =?utf-8?B?dWlDSnBvQVg4enNrS3FianQ1bTRCTGhFNnFmT2xQcHMrdUtQR1M3MlNXNzZG?=
 =?utf-8?B?ZkVYWDdWV2JvbStlUjNYZGZkSnBOTit5ZUFuZFFacEtoanM0WERqZmJWNW1r?=
 =?utf-8?B?QzBodjNIUHJkaUF6RUVGWGhTRmNPd0ZYNUMwUjdpcmJJeGV3VlV5cUtyTEd4?=
 =?utf-8?B?ZCt1eXd3NmNpNnRYYXRMdmV5U3g0NUNvbGhyUDYxZHBDVGVWS3ZvYk5Qd0R6?=
 =?utf-8?B?K3owK0Z1U1RIVm1wcmUzUWppdzZaY1lOT2hicSs0Wmp2YnhhQVdqbU9tK2J2?=
 =?utf-8?B?a2tTVis3NmhhQWlBTE83UUpVbXZPZDdwb0FRYzJGa0xjeFlSQ084Vk41cWxY?=
 =?utf-8?B?MENqY3FQM3VOV2ZNUXpkTnYrR1k2WlpvY21XUHAxWU9sYldSQ2E2cGFQRWxj?=
 =?utf-8?B?bGZsaWFROEl0WVdaSGdxaFJJZ2lxTVcwcFM2NmhTN05ORGE3SURUdlp4RlZm?=
 =?utf-8?B?OEdaSG5vbDdQYk02Mk10S1A2Q2NsakRpaU9BdEl2QlJkV0FZWVNKUWhOdHdi?=
 =?utf-8?B?OEc2Z1YxMkxJb1FnRE5FQ0Z5VzU3V085NDJBeTNoRDQ3K1R3WVJOUUhaYmJn?=
 =?utf-8?B?NW5XWjVZVU1rd3FXS3YwM2x3K29waC83c0lHWDdpaGVBMXVVSlRmZkxXZmZl?=
 =?utf-8?B?SFJmL2VOcVFoUHFxM0R5M28rOHB2dFRYTG9INWdzZUZ3UkxsbTl6Tjl3YnZk?=
 =?utf-8?B?UklOcGNQcHVWNmdlSlRhN2RzOCtYMVR5NVFESkk0YXlIdWRXVUg3TEcrZ0F4?=
 =?utf-8?B?Z2NBbTdJRnR5MmRkWjRGZHRwNzdvSnQ0eGV4Z1pnRGdKcjhYTjRuUlE4RjVV?=
 =?utf-8?B?L01oSFp4MmFGOUxYeEUxMGVhM1NHZTIyZjBINWV4YXh6SGNFR3UweUhtRDVp?=
 =?utf-8?B?cUZ5azlaTkFHMWlPZXd6L0JVK0I2SDduUWhGUzY2VHJuWGJacGx5ZmhpdmNU?=
 =?utf-8?B?c2V3UFU1NVZTR0JLdnlQZmI5VzFEUnZXQnNmNmZtUWJIU3FIMXNJSmN2b09u?=
 =?utf-8?B?MTNSenBVV3FxRXNXTG9ic0VpaFI5eTNucmh1SFd5TERSZWl5dlVUcHJ3dXlR?=
 =?utf-8?B?dnhxdFROOVJGTS9ITUMvQ2x4ZjRxUEJueWZMNEdRNkRFcVFPa3FOTlgzY0Nh?=
 =?utf-8?B?WjhGcUVlOUlpTnpDd1AvM3EwQlVMSHppanplTytCMHNqaVpBdklRWUNRTC8w?=
 =?utf-8?B?eEoxMmJtQ0EvaS9jOFhLT0tnZFZET3lTYUc5NGc3KzNKZENyQlRkakNCMUtJ?=
 =?utf-8?B?RERTRVJ1QURCMGZTRy9Pa1p6QWRkMHRVQ29CY1JyclZmWitlT0dsbE9BanNP?=
 =?utf-8?B?MWpaQ0wxTWRXaVkwQWRHUlpEWmxXWEJtbVRmVU5tM3ZlZEc0YjY1Z2UyNUt2?=
 =?utf-8?B?TmdKdDNSekZMS2FabGEyZjR2djBqbFJmQVdNL0VIZmVzMy9GcGI4QnFzRnRV?=
 =?utf-8?B?NjkzMUxjQjVTME5nTGN1Y1dpSXJtdWU2dlRXcVN6TjA1VlpoV1FrK21pM09N?=
 =?utf-8?B?ay9MckVxMU80blBncmp1ZDZZNVNXc2FoRWM3aUgwSGxVaVkyWTA2UVNYbUtm?=
 =?utf-8?B?UE45aEx6bXRVR2pKZVVscHcrMERPMlE5aVZkR2hEL1lKbzQ2Mm5keWRwSjFU?=
 =?utf-8?B?eUh2RUczT2ZZQ1B6R2NMaTFTK2VMTFRqSjYrSkRiSVJqb2ZxMXMxbEFKZWlv?=
 =?utf-8?B?Ky9sLzE4VFhic21xVUM2TE82NUVIMFJkUFFWYTkxNlRTMTBYYUgzWjVFdlFB?=
 =?utf-8?B?d084aFVieWg2dlpjNVROZ3JKcWttM0VKTkgvK3Nta1ZRK1hZdzRNbFk4RjZ6?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a20e082d-c71f-4bf1-3a68-08ddb561dc64
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 10:03:27.2025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4SFbmNKzmgAPumGa3yZdmKHiRPec+n85odU+qO19XgJ3DfRfnSgzNZxcTM9CdtrKqcTA8D9Ij4yrNhwdYdw90PGrQIlP6GzIvigJP5nr40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

In future platforms, we will need to represent the device and tile
VRAM regions in a more dynamic way, so let's abandon the static
allocation of these structures and start use a dynamic allocation.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xe/xe_assert.h                |  4 +-
 drivers/gpu/drm/xe/xe_device.c                | 19 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 18 +++---
 drivers/gpu/drm/xe/xe_pci.c                   |  6 ++
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_svm.c                   | 24 ++-----
 drivers/gpu/drm/xe/xe_tile.c                  | 33 +++++++++-
 drivers/gpu/drm/xe/xe_tile.h                  |  4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  4 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 64 ++++++++++---------
 15 files changed, 124 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 5e846f0bec21..dc8547640d44 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -297,7 +297,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		 * accessible.  This is important on small-bar systems where
 		 * only some subset of VRAM is CPU accessible.
 		 */
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size) {
 			ret = -EINVAL;
 			goto err;
 		}
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index b2ede3af9345..97b58c0ff39a 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -103,7 +103,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= tile0->mem.vram.usable_size) {
+		if (phys_base >= tile0->mem.vram->usable_size) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 68fe70ce2be3..da357dd42546 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -145,7 +145,9 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
+		      __tile->id, ({ string_get_size(__tile->mem.vram ?				\
+						     __tile->mem.vram->actual_physical_size :	\
+						     0, 1,					\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b73cb72bad1..19019b032c78 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -685,6 +685,21 @@ static void sriov_update_device_info(struct xe_device *xe)
 	}
 }
 
+static int xe_device_vram_alloc(struct xe_device *xe)
+{
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	xe->mem.vram = vram;
+	return 0;
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -729,6 +744,10 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
+	err = xe_device_vram_alloc(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7e4f6d846af6..56219984f347 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -74,6 +74,8 @@ struct xe_pxp;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_vram_region {
+	/** @tile: Backpointer to tile */
+	struct xe_tile *tile;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -213,7 +215,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
@@ -394,7 +396,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 		/** @mem.sys_mgr: system memory shrinker. */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3556c41c041b..a33a6f3a6731 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1574,7 +1574,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
+	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7acdc4c78866..0fc7875978ce 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -130,9 +130,9 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 	u64 identity_offset = IDENTITY_OFFSET;
 
 	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
-		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 
-	addr -= xe->mem.vram.dpa_base;
+	addr -= xe->mem.vram->dpa_base;
 	return addr + (identity_offset << xe_pt_shift(2));
 }
 
@@ -142,22 +142,22 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 	u64 pos, ofs, flags;
 	u64 entry;
 	/* XXX: Unclear if this should be usable_size? */
-	u64 vram_limit =  xe->mem.vram.actual_physical_size +
-		xe->mem.vram.dpa_base;
+	u64 vram_limit = xe->mem.vram->actual_physical_size +
+		xe->mem.vram->dpa_base;
 	u32 level = 2;
 
 	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
 	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 					    true, 0);
 
-	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+	xe_assert(xe, IS_ALIGNED(xe->mem.vram->usable_size, SZ_2M));
 
 	/*
 	 * Use 1GB pages when possible, last chunk always use 2M
 	 * pages as mixing reserved memory (stolen, WOCPM) with a single
 	 * mapping is not allowed on certain platforms.
 	 */
-	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+	for (pos = xe->mem.vram->dpa_base; pos < vram_limit;
 	     pos += SZ_1G, ofs += 8) {
 		if (pos + SZ_1G >= vram_limit) {
 			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
@@ -310,7 +310,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
 					    pat_index, pt30_ofs);
-		xe_assert(xe, xe->mem.vram.actual_physical_size <=
+		xe_assert(xe, xe->mem.vram->actual_physical_size <=
 					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
 
 		/*
@@ -320,10 +320,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
 			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
 			u64 vram_offset = IDENTITY_OFFSET +
-				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+				DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
 
-			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
+			xe_assert(xe, xe->mem.vram->actual_physical_size <= (MAX_NUM_PTE -
 						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
 						    comp_pat_index, pt31_ofs);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 824461c31288..90494f16d3d8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -714,12 +714,18 @@ static int xe_info_init(struct xe_device *xe,
 	 * All of these together determine the overall GT count.
 	 */
 	for_each_tile(tile, xe, id) {
+		int err;
+
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 
+		err = xe_tile_alloc_vram(tile);
+		if (err)
+			return err;
+
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e8e1743dcb1e..ba9b7482605c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -337,7 +337,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
-	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
+	if (xe->mem.vram)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a7ff5975873f..e6871734ffa9 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -306,16 +306,11 @@ static struct xe_vram_region *page_to_vr(struct page *page)
 	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
 }
 
-static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
-{
-	return container_of(vr, struct xe_tile, mem.vram);
-}
-
 static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 				      struct page *page)
 {
 	u64 dpa;
-	struct xe_tile *tile = vr_to_tile(vr);
+	struct xe_tile *tile = vr->tile;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
 
@@ -370,7 +365,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 		if (!vr && spage) {
 			vr = page_to_vr(spage);
-			tile = vr_to_tile(vr);
+			tile = vr->tile;
 		}
 		XE_WARN_ON(spage && page_to_vr(spage) != vr);
 
@@ -508,7 +503,7 @@ static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
 
 static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
 {
-	return &tile->mem.vram.ttm.mm;
+	return &tile->mem.vram->ttm.mm;
 }
 
 static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
@@ -522,7 +517,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block->private;
-		struct xe_tile *tile = vr_to_tile(vr);
+		struct xe_tile *tile = vr->tile;
 		struct drm_buddy *buddy = tile_to_buddy(tile);
 		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
 		int i;
@@ -683,20 +678,15 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
-{
-	return &tile->mem.vram;
-}
-
 static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      unsigned long start, unsigned long end,
 				      struct mm_struct *mm,
 				      unsigned long timeslice_ms)
 {
-	struct xe_tile *tile = container_of(dpagemap, typeof(*tile), mem.vram.dpagemap);
+	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
+	struct xe_tile *tile = vr->tile;
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe->drm.dev;
-	struct xe_vram_region *vr = tile_to_vr(tile);
 	struct drm_buddy_block *block;
 	struct list_head *blocks;
 	struct xe_bo *bo;
@@ -722,7 +712,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
 				&dpagemap_devmem_ops,
-				&tile->mem.vram.dpagemap,
+				&tile->mem.vram->dpagemap,
 				end - start);
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 86e9811e60ba..47cb09edab33 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -95,6 +95,33 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+/**
+ * xe_tile_alloc_vram - Perform per-tile VRAM structs allocation
+ * @tile: Tile to perform allocations for
+ *
+ * Allocates VRAM per-tile data structures using DRM-managed allocations.
+ * Does not touch the hardware.
+ *
+ * Returns -ENOMEM if allocations fail, otherwise 0.
+ */
+int xe_tile_alloc_vram(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	vram->tile = tile;
+	tile->mem.vram = vram;
+
+	return 0;
+}
+
 /**
  * xe_tile_init_early - Initialize the tile and primary GT
  * @tile: Tile to initialize
@@ -132,8 +159,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
-	if (tile->mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
+	if (tile->mem.vram->usable_size) {
+		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
 		if (err)
 			return err;
 		xe->info.mem_region_mask |= BIT(tile->id) << 1;
@@ -168,7 +195,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
-		xe_devm_add(tile, &tile->mem.vram);
+		xe_devm_add(tile, tile->mem.vram);
 
 	return xe_tile_sysfs_init(tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 066a3d0cea79..fb0473fa9098 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,12 +14,14 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 int xe_tile_init(struct xe_tile *tile);
 
+int xe_tile_alloc_vram(struct xe_tile *tile);
+
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
 {
-	return &tile->mem.vram.dpagemap;
+	return &tile->mem.vram->dpagemap;
 }
 #else
 static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index d9c9d2547aad..19bfc22b9706 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -89,8 +89,8 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 	u64 tile_offset;
 	u64 tile_size;
 
-	tile_offset = tile->mem.vram.io_start - xe->mem.vram.io_start;
-	tile_size = tile->mem.vram.actual_physical_size;
+	tile_offset = tile->mem.vram->io_start - xe->mem.vram->io_start;
+	tile_size = tile->mem.vram->actual_physical_size;
 
 	/* Use DSM base address instead for stolen memory */
 	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
@@ -107,7 +107,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 
 	/* Verify usage fits in the actual resource available */
 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, LMEM_BAR))
-		mgr->io_base = tile->mem.vram.io_start + mgr->stolen_base;
+		mgr->io_base = tile->mem.vram->io_start + mgr->stolen_base;
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9e375a40aee9..d9afe0e22071 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,7 +340,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = &tile->mem.vram;
+	struct xe_vram_region *vram = tile->mem.vram;
 
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
 				      vram->usable_size, vram->io_size,
@@ -392,7 +392,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
+		phys_addr_t phys = cursor.start + tile->mem.vram->io_start;
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 3a4c84e9efc6..7e3980bcb4e6 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -147,17 +147,17 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram.io_size)
+	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!xe->mem.vram->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
-					       xe->mem.vram.io_size);
+	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
+						xe->mem.vram->io_size);
 
 	return 0;
 }
@@ -279,10 +279,10 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	xe->mem.vram.mapping = NULL;
+	xe->mem.vram->mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-		tile->mem.vram.mapping = NULL;
+		tile->mem.vram->mapping = NULL;
 }
 
 /**
@@ -318,10 +318,10 @@ int xe_vram_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.io_size);
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->io_size);
 
-	io_size = xe->mem.vram.io_size;
+	io_size = xe->mem.vram->io_size;
 
 	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
@@ -329,44 +329,48 @@ int xe_vram_probe(struct xe_device *xe)
 		if (err)
 			return err;
 
-		tile->mem.vram.actual_physical_size = tile_size;
-		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
-		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
+		tile->mem.vram->actual_physical_size = tile_size;
+		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
+		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
 
-		if (!tile->mem.vram.io_size) {
+		if (!tile->mem.vram->io_size) {
 			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
 			return -ENODEV;
 		}
 
-		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
-		tile->mem.vram.usable_size = vram_size;
-		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
+		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
+		tile->mem.vram->usable_size = vram_size;
+		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
 
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
 			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
-			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
+		drm_info(&xe->drm,
+			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+			 id, tile->id, &tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+			 id, tile->id, &tile->mem.vram->dpa_base,
+			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->io_start,
+			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
 		available_size += vram_size;
 
-		if (total_size > xe->mem.vram.io_size) {
+		if (total_size > xe->mem.vram->io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram.io_size);
+				 &total_size, &xe->mem.vram->io_size);
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
 	}
 
-	xe->mem.vram.actual_physical_size = total_size;
+	xe->mem.vram->actual_physical_size = total_size;
 
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->actual_physical_size);
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
 		 &available_size);
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
-- 
2.34.1

