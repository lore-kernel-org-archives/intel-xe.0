Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CD7C624D5
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 16:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A44210EDC3;
	Tue,  1 Sep 2026 16:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0oOIuKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBD110EDA7
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 16:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788281105; x=1819817105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bznoQD2EQcBfMZeORjMdMV2IWW1v+26FDHmoJsojM8s=;
 b=m0oOIuKPo8hadzj6xydv5MMExzAjbN5DT2mAtPArdMedES6JByWQqz95
 ZooaVdmh4FEifTUlBAg4Y0PjSS4iczCr885+4I5GFXVgtcyIWOIYPmaPs
 UO81FtfZS8+kxVVFnnq7yHbJZGQt6vQOL52ihYiRAa+N9M8e37MszS30i
 2o/6cJEWkDERQPvDpdvmM4K15nMW5C/vAi8LnfFG9PQZ6SeVDR7p+3KOy
 QS+nCCAmBrvlttyp3a2UZkJJ/aq5ViFz9NspUYBGETt/6ik8oRlAt79lC
 Hh3PLVXO+5myL5NEDscG00x1E8qNPmR7YNTeSoPC8si2/ehZqobVees/q Q==;
X-CSE-ConnectionGUID: k6cf/BukTniXll1ZddAHdA==
X-CSE-MsgGUID: UV/ffe//QdCRAOn6zJIPjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99881799"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="99881799"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 09:44:58 -0700
X-CSE-ConnectionGUID: RYTIRus/SiGon+AfjhuyPw==
X-CSE-MsgGUID: /seOyG10Ta6/jXoJ7rWGVg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 09:44:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 09:44:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 09:44:56 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 09:44:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxC6IlvNu9auBhhrejNyzSze622fvzCmNR1tXuox1LmGDKWTRUeAVEK6Sor4deQAMDixA0MRkZIJXK9clDPIKBpdUKxhISw1nxeGdOs6xIs1Ggslrxntq6vms4kLyLSAeNJ/wpN5yIaJ3z0fN9AEpZ9GA4u6d/X1ryHFIkJ9TDp7g9iRwXUiyHA3hohxEvEFWy2gNpooSjTiXsmP6rq0LdvU/7eg2Npv2PjS6YceUwqFWT1RxS+ftEcYdwMSwGwKO1ES6MkIkQcoJH5qulGcLYlahR/L6xzjh61MPIunWVQSCOsNmL4Wt3H+mJlCG1mbtPj4jJOxE1sA6Nh1M+nGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xudBVdBMVZ8qvtu4AmggpCQfuzXn5klqFie7ARtRHjw=;
 b=jYnR16QO0MvLHOpW7XPB4r5dS5H7CTv/oIVe1Puz0TjgGsZUvcqSs2KUwIzGKGHKv0YTjgwlhBzXBDEZWxLKRnQ2svQcoF6ydgmdG+htLf/RkFdgfTxigHX3w2S92Zwj9m0ne6bc3KwFfxoQ6qhqkofnaSMePjeyBL93ohtSh+0rtIu2zkXAEUpY3LeQsUVO04xtt/IqSVAb8LHlCSpkJp/AgFHpxXya1prIpQ9CbDw6SzUSOm7Wf+8ICp6RbeECx6yWSrV9/isZ5x+kbiKBz6Ioecs6//5JK+WeYiPQYPKidu5DwvxoK6DNx112D9CV06NcmKyB7PD+aL8cDMAC0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB8453.namprd11.prod.outlook.com (2603:10b6:510:308::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 16:44:52 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 16:44:51 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 2/3] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
Date: Tue, 1 Sep 2026 18:44:34 +0200
Message-ID: <20260901164435.1395260-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
References: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::17) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: af4e3ea0-932a-4318-e908-08df0848580c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4whZBAM0DY6v5nZ5CeyHe0EztJ3UQYaYI0pQyZpOcuEx6wyrKaPbV0a/BTgb0sb39DQl1hCw+tfkr2EkhYd/SPUUhHGm/x77o8IcNRh/L/6TJuUdibjiTXSgrsxcyQNjsN2oJJPrICfIBU1AU4+ng1ECMlw7oDx02Uja5VNKa7JOsFqXYIkJ2/8knFo8nlOx1aD/+2vRrTwNKkMl0q6yBcXeH1tHRnpr7XJ2Eduf6H84TRYNrVU8cOtkv+EyzcbgpYqzmFsqqlOtwFPlbMKt6qNtEKrhepJ+Y0AU67ilctTC8AT01Wnnyzt6GwAA7Ch3bKMe8A/iFtY0B7g90yKWjSKvY9I97Xdf1MKpjgZkDOyCGIikikU23/HAyd1LicCBk2T7UHmB/jsf6JpOf/sEh5/pwsD7bHV0JDGJViguXufWZ0Tts5cHOeBB88AOG1zhp5rZHValSe1Ju0w5tdzIXuo933Ta8drOPYmswQKzOljhlcHsiix35bPlCbBWrbhrpGTpUr7BLr9m2/Wh2fy2i6CsekEIa+gyUTH1Cb479qPthHWDjdjP93LeuP0w9A4wZzP5uhrh7Ur4o7lV1cs8A2A88U7ef3Sz7WAZPZ4P4fjsDFTcWOiocSYzcusdn9PwpCJp3yTvZW2oApTahJbxnK3ZYZqf0dw38Uh5BeBdrZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWIyNXJ4TTEvamJZYXBjUXRwbmsydW5KU3RRMTdPYWU5dGs4eDlIZWpCUmlo?=
 =?utf-8?B?VmFDVzNneE1GNGNOZjRod2psM0V1MWFPSTNnRThuMkt6QjdHTkZMNVNXeFk2?=
 =?utf-8?B?NHFIWmozaVFhZTloTGxtU3FiNjhNT3hmUEgyWE05K3VJOC9tZnZFbmxUWHZa?=
 =?utf-8?B?KyszZFdoWU04MXhIVUN6WEUzUlQ5cTNlWjAzMm9OVnJ2R0E2UGZrVW9uYTM5?=
 =?utf-8?B?TkxsMzd0UjE3NTc0dmNyYzgwMHJjTUx3cHJkUDVVME5OWktHQzdiMnN0anF3?=
 =?utf-8?B?NjFXMjRrUWoveW9oeGt5a2ljQXZWM1FPSjkrRElzOGxuRW5ZOXoxc0F6NXVn?=
 =?utf-8?B?RlB0a29adXlFd1ZmNGlaVThPc0dIOG55UnhhTGFWdDY5aFhTUnJTR25telZN?=
 =?utf-8?B?WFE0NjBzRk9kTnVyZS9KQml6VnVFd0MrQWszaUs2TDY0NDhaRng3MFYwYkdS?=
 =?utf-8?B?ZHlNdHl0VHFPYjFWOXprYXZ1RWhkeHk5dkloa3ZQNmNnRHFLSTBkaEhGVXRG?=
 =?utf-8?B?N3RVSjQyL0Y5LzBOcTA5NmV3Y0drN2VvRzNubFZEMS92ZjgwREgvV1dBeEZN?=
 =?utf-8?B?blN2ajl2RUoxQktSRitsWFkwTHBjdUZ1YlJVdEk2OC9Gc0VJOWVybTlSeVBM?=
 =?utf-8?B?Q3VLOUhDamhtdGZoMVR1NVkyR2RxQlVzNHZTUHJWdzBGRnR3TGN3SnNjZTMz?=
 =?utf-8?B?czJkUFBFYndaNzNYb2lyYVhuTzgrdHRyTEo3VWhqaWM1YkxTZ0g1QnlvS1NO?=
 =?utf-8?B?SW5nVjRtYjJRTURvSGVwSy9TNGJKUTNLTjBra0FITGdheHB6WkxONzRVeE9a?=
 =?utf-8?B?SVNXaERJR1p0NkdQWWE2eHpweEtkUFJlSDBkNFY3Z3dQd3NMVmpWcXpLNWtv?=
 =?utf-8?B?dVdyQWd0a2JJeXRhMGw5eHNZaHd0S3QvSjl3Q0pscDlpeWRxa05hcFRRbnFi?=
 =?utf-8?B?SEdRSUtDTlkxcEk1aDNSYUFOSFZRbFhDR1JlZHNObytvRXlPNHNOUkYxbUZU?=
 =?utf-8?B?Q0VKcFdnSUU3L2RNMk00YmNXUm9LcXA1bldYVDV2NnZyMEcwSk5HOUY1VnFi?=
 =?utf-8?B?YzE5YWVjaEVrdjQyak1JY3FkL1JocEtCL1dydk0wTlZHQ0hQTS8zWjdCRE9B?=
 =?utf-8?B?NnFIbkE1TlZ4dGlZVzFQQUhocDJyNlFjc2V3NUVZWUo5V0JUYWNaWlpIakVx?=
 =?utf-8?B?bVdWUVVjRTNLRlhldUlxZ0swK2NqU2JhQmlxdDcvRi9Kb3B2VnBZbnJXT0hu?=
 =?utf-8?B?Z1VhLzg5Y3pkUG5iMXZLL0FnYW9xdzlndFNMakZJSmZSVVVFY3k2OUo2eXVS?=
 =?utf-8?B?SXUvMGJHQTVmYndCSW1UZ0RpZS8vbkRuWTZXc2c0T3pnNGZhVzFBT2xSWnJy?=
 =?utf-8?B?Rmd1NXBINi9sd3RKa3lObGJPams3TDVDR3dQb056NHlBTWdyWVNFVlU3VXZG?=
 =?utf-8?B?b3F0U1dYcmxlRW9pWGRuNmFhMndwZDlMUEphL3JRRHIvNVhHNXRXY29Vd0Nh?=
 =?utf-8?B?MG1MbWw5Yi9yRlpDc2x3SHFWOGdIMEd3QnNpUTlNSURxZmlCUG91NldaTk1a?=
 =?utf-8?B?bUpOT0xLTER2NTlwSW9kVWN5YXpJTkVxS25WeUhZV29FNFRNVjlkUmdmQW43?=
 =?utf-8?B?Zi8wZis0N3VnZ05CaWNiUHp6UEhXcFpLR3NRMG5xK1F2Y2tsM0xZRmlxYkwx?=
 =?utf-8?B?ZTR2YUJpNXl3bWdYMmtqTHN5R0oxNWRUL2ZTcy82cmxnMVBzSW1IOTNzZzl6?=
 =?utf-8?B?aXI3bUMzblVuRDdkdmh3dldyTVZ1Yys3dEFrMFU4R1R6M0lVMit5TzZLcXpu?=
 =?utf-8?B?MzZwOXR0TUlFTGtoU3ZSWlFEVVdCeFhjcEo3dTlDck5OVW5TdVVrbmFrRm1Z?=
 =?utf-8?B?QkUzTCtvWGpPbE9iMWhHVndHNjNiTVVRZVpPaWVldUdlTU9xbGhXM0ZGNElh?=
 =?utf-8?B?VU9WL0RoNEFEWFc3VG9HLzJ5SFNUTUZycjNFRjFCdENYTktxOGd3S3JVeFpw?=
 =?utf-8?B?eHkzeFJIMk5XeDhseHFtdkFjYXFwTWZLKzNveGRWMlM4OEptVTVkc1NNbGxy?=
 =?utf-8?B?Y080QUxLRzFTVXI4bFNyanRwZ3JNUlMxcThsTFBuOWNRU3p0NDBnaWRqK3hB?=
 =?utf-8?B?SENiTGZFK1k3NnZMcEdUL2dLSExMUFpiS3FJUUp2aE1haUg1NEZwcVd4S3BB?=
 =?utf-8?B?VlMveUxxdk5WUTY4aVFPd1NGc0gxTmlzTkpNRDhwKzhYWndhOTZTQUE5My9F?=
 =?utf-8?B?V3NGdjN4QlF0M1V1TVRNaTRhZXNySFBBRExDTUp0RlZrcmR0c3VnUmh0dWRl?=
 =?utf-8?B?bHhzS3ViSytOL09OSllhT1ZiOUd0MkZJKzRpKys0L1BDcGYva1owdFZiRkRq?=
 =?utf-8?Q?mNABr8P0hEQEDhmg=3D?=
X-Exchange-RoutingPolicyChecked: MdFzoL91t0TNOuUB8edoslOymykGQYYnJ0v5F3FsHizF+DcqgNscf1y6VaOiDmwR2JJqBkMK3GddriLj1/tI2qm0gc+Z9OHqFjz9rv+kr0rLydaHDm4Aw71PRoCjwYbm40F2dtv/fjRS6PM4CU3LWveUCYe5YXa/L18aDFDxtGUkAAuVKLKEY+TPh8+5bUzz2CqqsBCnU49qGNXl5En81cuS83NXz4/UnauI3t9mHxbGFxkpjnW8H3eAk7eoLUI/fVvtf9o70BcLXEPTxH6nxEDCeZBbSbpVx8XEqKvMCWZlN5JS/KFrk0xgVPQE4Q/BSlR2aBqAULqxMfGKUJPsdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: af4e3ea0-932a-4318-e908-08df0848580c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 16:44:51.9049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWUsZozpYv63iUrEBKQuJUJCLCQLkS7jmXlltNtJQP8fz0joKlzgRpz42oFm/QAxquz88udx5ywNgQBcCCgeUJN5XWOwmMQabXLYdkU4J8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8453
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

GGTT initialization currently uses the full available range for both the
usable and shareable pools, regardless of the SR-IOV mode. The range is
read from hardware on native and PF devices and assigned by GuC on VFs.

Let's separate range discovery from pool setup and initialize the pools
based on SR-IOV mode. Native and VF modes will use only the usable pool.
Shared PF mode will use both pools over the same full range, so they fully
overlap.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 132 +++++++++++++++++++++++++----------
 1 file changed, 97 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 1f0bd876cb35..7fcd686f9729 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -366,8 +366,8 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
-				 u64 shareable_size)
+static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
+			     u64 shareable_size)
 {
 	struct xe_gt *gt = ggtt->tile->primary_gt;
 
@@ -387,10 +387,87 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_siz
 	drm_mm_init(&ggtt->mm, 0, ggtt->hw_size);
 }
 
+static int ggtt_get_range_from_hw(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned int gsm_size;
+
+	if (GRAPHICS_VERx100(xe) >= 1250)
+		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
+	else
+		gsm_size = probe_gsm_size(pdev);
+
+	if (!gsm_size) {
+		xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
+		return -ENOMEM;
+	}
+
+	*start = xe_wopcm_size(xe);
+	*size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - *start;
+
+	return 0;
+}
+
+static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	u64 wopcm = xe_wopcm_size(xe);
+
+	*start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
+	*size = xe_tile_sriov_vf_ggtt(ggtt->tile);
+
+	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {
+		xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
+			    *start, *start + *size - 1);
+		return -ERANGE;
+	}
+
+	return 0;
+}
+
+static int ggtt_read_available_range(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	int err;
+
+	if (IS_SRIOV_VF(xe))
+		err = ggtt_get_range_from_guc(ggtt, start, size);
+	else
+		err = ggtt_get_range_from_hw(ggtt, start, size);
+	if (err)
+		return err;
+
+	if (*start + *size > GUC_GGTT_TOP)
+		*size = GUC_GGTT_TOP - *start;
+
+	return 0;
+}
+
+static void ggtt_init_native(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	ggtt_init_ranges(ggtt, start, size, 0);
+}
+
+static void ggtt_init_shared(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	ggtt_init_ranges(ggtt, start, size, size);
+}
+
+static void ggtt_init_generic(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (!IS_SRIOV_PF(xe))
+		ggtt_init_native(ggtt, start, size);
+	else
+		ggtt_init_shared(ggtt, start, size);
+}
+
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
 	ggtt->hw_size = size;
-	__xe_ggtt_init_early(ggtt, start, size, 0);
+	ggtt_init_ranges(ggtt, start, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -418,43 +495,19 @@ static void dev_fini_ggtt(void *arg)
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	unsigned int gsm_size;
-	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
+	u64 ggtt_start, ggtt_size;
 	int err;
 
-	if (!IS_SRIOV_VF(xe)) {
-		if (GRAPHICS_VERx100(xe) >= 1250)
-			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
-		else
-			gsm_size = probe_gsm_size(pdev);
-		if (gsm_size == 0) {
-			xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
-			return -ENOMEM;
-		}
-		ggtt_start = wopcm;
-		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
-	} else {
-		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
-		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
-
-		if (ggtt_start < wopcm ||
-		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
-			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
-				    ggtt_start, ggtt_start + ggtt_size - 1);
-			return -ERANGE;
-		}
-	}
+	err = ggtt_read_available_range(ggtt, &ggtt_start, &ggtt_size);
+	if (err)
+		return err;
+
+	ggtt->hw_size = ggtt_size;
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
-		ggtt_size = GUC_GGTT_TOP - ggtt_start;
-
-	ggtt->hw_size = ggtt_size;
-
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops =
 			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
@@ -467,8 +520,17 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size,
-			     IS_SRIOV_PF(xe) ? ggtt_size : 0);
+	ggtt_init_generic(ggtt, ggtt_start, ggtt_size);
+	xe_tile_info(ggtt->tile, "GGTT usable %#llx-%#llx = %lluK\n",
+		     ggtt->start, ggtt->start + ggtt->size - 1,
+		     ggtt->size / SZ_1K);
+#ifdef CONFIG_PCI_IOV
+	if (IS_SRIOV_PF(xe))
+		xe_tile_info(ggtt->tile, "GGTT shareable %#llx-%#llx = %lluK\n",
+			     ggtt->start + ggtt->shareable.start,
+			     ggtt->start + ggtt->shareable.start + ggtt->shareable.size - 1,
+			     ggtt->shareable.size / SZ_1K);
+#endif
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
-- 
2.34.1

