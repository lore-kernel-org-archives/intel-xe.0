Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BBCC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 18:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3957110E647;
	Wed, 14 May 2025 18:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RY7oItKI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAAB10E2D7
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747247683; x=1778783683;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b4WqPothXpOh4F30jumfXSKmIZUhbUvjC6c1KxSvbkk=;
 b=RY7oItKIdJb/aiZQxoWKtsq1BzVQH/w/QrHKKqUdGCZY+lWTUc0/HcI8
 CNE1sGZ4qOrQkg7VENJ601lEvUDsCUwKBvegEEkqDdV6k0EXWprVwsOKH
 xt16u+FVs5ynXf2Z6Xn7nI+hR8IRqjOZvjMqWS6aJTsQQkhWz6MHTvvfb
 d1ZREtjfLFg0tIhh2n0cFIZlN68G1RREMrIK6Exo/diy8LMGLq2qVBRQ+
 YX19iHUaC2Tk/ClcZZxgeocynvLvZ2Y5jGcRFxssG+FM7qAMkYObcvphE
 /z8HvRZBnvvLFD7i6fA/Ko1r7F/2dXmVE4vqIVBBwsFkdRX/lZK8BWv0f A==;
X-CSE-ConnectionGUID: QOVcsA8eQTOGLFsYmpSnRw==
X-CSE-MsgGUID: ePHq8ojhRzKNOcDcvTQCng==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49233998"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49233998"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:34:41 -0700
X-CSE-ConnectionGUID: eWtxEidyQ4OGR0MWBDRNUg==
X-CSE-MsgGUID: W8yBGeItQ9aqDKiGzLJKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142148117"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:34:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 11:34:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 11:34:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 11:34:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiG38M4qjlUO2Da0cubtgo6OhOGV/wO9nS8DCAdnkoa1cmi2ID/5+eILcgVYGGaQNj2VTLQMIDpVBpQ3ibZumhPe4QTCQvnrUoVHjakhX7B2C27gLbh5M4lRCRVRdA+SBGJhzpy6O2alYieYvDsdB+cWACjAeD2TatUBcxe2n39XjEbrzlsRecwl6CmxtDTeO/UiGEW2K9QbwBhqOMKgV72ZzyeeO++UBtPt7ufH27vkhxIfAJjDQoiB/GoxtoTH1acc9fbMmlwnPb253Kk1oRQMTabK8bYfrKOE/P/tPnpUYkCGrFJSRFdjUUrRyZRyT4RZMegybWtmR3XEW85uYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MaZ4BD4E/AtzbfehaCiiZ0Bqu7x3DSVjnQmTLXtM7Y=;
 b=itsVI1qgO5PWrTUGyxkjQFprcysGdrsaV1D9ztpOgGwqFZGvIht9F9CGXUp1HMdag+5MjUGUXQnzU25PjiAwNP/dOj9KfI/FvPPhd08rX0XUucT8Wx4WlwUWQCLoaZdzMi2DUHVne+s848H7vE1iSOgJWfM+I13vqrMOcIB+/XLs87v8tEbT6+qTGtefi60ulwerVWSWTa8xp2WG4jwX/sghCnMPYZogSuwEQBoXRpDHcSEYDJD4g/VeZ04OvEMLt+z630Dwo1sr0j9aLMII8n8df0ZBQWW5nwnfc1wLINCDumOFQMQl12Mqeoz+qqOO9q17TxeCy+eMhy5kWuAccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 18:34:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 18:34:36 +0000
Date: Wed, 14 May 2025 11:36:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 18/32] drm/xe/vm: Add attributes struct as member of vma
Message-ID: <aCTik0GGPGymStmr@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-19-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407101719.3350996-19-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW3PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:303:2a::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de50e50-53ca-4568-d543-08dd9315faa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkpaY2NBZlVNdGpwTXloZ1Z1SEovdk44VVdRNDZCRllVaE56UExZNzNJUVZn?=
 =?utf-8?B?NXFlOE5UYjkzYm5LaXJYYk5nT3dWWUtvL3FUYVlTUXpvS2FmblBXejF1WVUr?=
 =?utf-8?B?SVp1R24zWThTOWVreGZSUWhJQnJuK01JMjF1Y0Q0emRJY0sySmFzVFgzMlNV?=
 =?utf-8?B?eU43dlZCWm1JdkdCM05XUzFFNUs3c1RxVmY4eXB2TUpDelcxZ1E3SEJXVk14?=
 =?utf-8?B?amFaTXNMMWk5b0RWNGJ5U01lL2VrRzFyVjZYRXNlN29RWUNPMDlZZFRWbWc3?=
 =?utf-8?B?YWVvdk9Sd243SG9ublV3eG1qZktJSUEra0Njd1pIZkxteE9FUnpzTDRpTXVo?=
 =?utf-8?B?dkI2WGFPMmFFSy85Y1NWOEtxRmk0QjBHdDIxQjlISi9hMlphZ1IwUm9TdG5x?=
 =?utf-8?B?WjJtNnFiMnpQZGxSSkF1L3ZKQkdIL3Rmb0c1c3psZUQ2QlBWa0R2WVVtb0ta?=
 =?utf-8?B?NUZHMldPV3l5bEJSWGljRGpPYm96elJ3T0ZXd0RxZmF5SThxbm4yWGRtQWFL?=
 =?utf-8?B?aUNUZCswanVOVW9xd2FXT2hhTStxMVZnQW91eThnTVZ0K2xuZ21pc2hmb2VU?=
 =?utf-8?B?aVdJeEJRa1hUT0hidlk0RlRrYURyWWFJbkM1VC9RbWdJZ1RHalpiRXdaQndw?=
 =?utf-8?B?QWs0QnZrUU8wK3kxUTJEU2UrYUtiY2krY3VwZ280SUVWN2l5MXdOZCtscVRQ?=
 =?utf-8?B?NkowVkJXR2psSjR2VE5kRVJ1TlBXVzBTa0p6em5KVmthdnpISmxkT2NvVFBJ?=
 =?utf-8?B?cHBHLzJZOHVRMXo0TFQwUC84K3JKOEZHTjhseVZBYmtpN0ZhdElTKy9XMENn?=
 =?utf-8?B?aUhmMWJzSDhvRmdrL2JhQVNKaTVNd1l4eEtkZHB6Tno4RzByZTdqclhWZnJu?=
 =?utf-8?B?KzZmOHQrSitnMkNnR2g2a3l2MHNUZGM4SzQ1L0V3UUg4a3IyaXVsY055UUZF?=
 =?utf-8?B?ZkhYY25hTkFMRzZxU3BZNC9Zbkl4cWxtang4UjNXYW5tczBZWVg1cWlNeGVs?=
 =?utf-8?B?dmlHU0NzOC9XMWhkdi81NUdoUWxMNWpzOE5jTm1lc29nVjVUMmZleEtsVVpr?=
 =?utf-8?B?cVZDcVNhdjF4RDA0b3plVVJkYmtwb2ZXZVBuUmo0M2xUb2JPbUwyRk9VWVBT?=
 =?utf-8?B?UTg0OFI2emwyNnVGRW5PckZrcnZQcnFoYk9KZkNQSXI0dUJvbTJGU1YyeXF6?=
 =?utf-8?B?SlJpZG5reERpL3p6ZDFIZDVMRU5xWDdzamxEVGxhaHBFUjRxd3IzN2QwaTJC?=
 =?utf-8?B?R25ucnFBcGR4SVVjUXR4Rk8yL1M1a1QyYTJ3a2xid0N2WTNhdUo2c2NTZXJy?=
 =?utf-8?B?WmZiam10Yk5FM2JVMC9KdWdmbDNaT2M2WWJEUC9ia2EyVzF2TTNnQUcrMnNH?=
 =?utf-8?B?S05XNEUvaFV3Q1ZkZGtFU0REV1orQjM3c01JTW1BQ1ZwUEEvUjZlMlZXbTZY?=
 =?utf-8?B?WndNUFdoQ1lwa0lXVjdVS01hOGcwT1J3RTJNVlRMRzNGaDE4bStOeGsyMS95?=
 =?utf-8?B?ekRmTWFOSkdNcHN2NjFtNkk0MXpFOEwyYnFlbzdoNDlTUk1TbGJydW5JaWRV?=
 =?utf-8?B?Mm0vZThYZk5DdURZMGdtQWR4TjQ4TmhiNUk1YnBOMmpaSjRjNldaMVhFa2xS?=
 =?utf-8?B?MW1Pc1pKNjJ5d0FRNzRGc2RldjV6UDQ3KzFYejhWc2F2RUdFc3VHaG9OK0da?=
 =?utf-8?B?VUpnZzFJa25tNDBsdVk5Zm1id1ptakFGRzRkMzhoZGwrNkFjQXd2VWJLbmpD?=
 =?utf-8?B?N0h0Y09RZ0x1NTdld2lOY2h2M29ZdCtmZnArVktySzlPb2tkbFplOEc4VUc4?=
 =?utf-8?B?NHl5WEFyY0QxUU1MR2FxTHU2L0hFUVE5T1ZTOW9Jb28xZDlzSEVINFpOSG1h?=
 =?utf-8?B?K01SZDRTcnQ1QlZtWDM5QmNrTUVkQVoyS1lnelBqdlQ3T0hNWTJnMDlBKytl?=
 =?utf-8?Q?q1TVAgPiQ6A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzRaZGg1ZE15VWRTWWFsbzQ3dGxBQnVjYStuRlNQblVkY2I5NXE4ZGNXV2tC?=
 =?utf-8?B?MXBxWThNb2tBWFB5SnVHKys0ckpGcENmQnVqcUErc1ZSbXBWR1daYkV4UzhQ?=
 =?utf-8?B?N1hiYXo3VklpeFRjVFVXZHQ4dVI0aS9RU2w3NjNrc01zQTViclV1U1kzeWZH?=
 =?utf-8?B?MFNvQ05IcmpCZWZTOU15UE9vZzNVZkFiTERhN2RZc0tKaEZ3cjdZVUF1VkZV?=
 =?utf-8?B?VEhuZGtranVHcUFmR3JEZVUwWmExREJZSm0vOWY2bHF0TEY3SUVXY3VaaEo1?=
 =?utf-8?B?SE1MOU44RlRraG4xbmh2ajZPclJ4QkNDVGRUY0ljL3M4WkUwdDQxSk9YcXI3?=
 =?utf-8?B?ci95Z0Fsb0FkRnl1RTUwa3NNRDNCbkRHeDRFdlZ6TnRGZHc3cGNxaFRwMml0?=
 =?utf-8?B?V0NQOUJPZmNLSGZSNnkxbUI3RnhHMlRBWmhJSVdXMHExcmZ4TlFya2k3bGp3?=
 =?utf-8?B?Zmd0NmlPSElNajFaa3A2MnR3Z3dHRzNGaXJpMHNHdlVlSWs2eDJobmdHcDZs?=
 =?utf-8?B?THNtcDhoelJZT1VTTHp4V05ORWlKWHB2NFhoZUd4VDdoaXMyWWVDM0g4Y3hW?=
 =?utf-8?B?MU9GbGRpbVFpNTh6eXEwK081L3lCNTE5UnFuZTVhVnM5dU55NldOckNkRmxI?=
 =?utf-8?B?MWdkd2VsbkRkSUkwVFpKb2h1dzVQc1hwRkI2OTVGbHE0U3NLU09EYS9KTExx?=
 =?utf-8?B?cGpyTmNTSmFFMGw1Q3pXbUprZHRNdDQ1RWtwd1hlL1lPeEIvTXg5QlJaZWpr?=
 =?utf-8?B?dkMyZ3UxNCtIMzlNS3lRYzhYNnQ3LzdWODI1dzFKWDFucklDbWFybzFjZXR6?=
 =?utf-8?B?djdlR0MvSHJhbjkxQVNCeXVRZ1AwN1Q5YkNadDJ3UWMycTY3Y0pMQUMxZHhr?=
 =?utf-8?B?Z1l3OUF5STMzdkpMZXNoNk8xQ0h4eW9RQjZMNW10eXNBWFRiMGk1QkF5YkhP?=
 =?utf-8?B?Sk5pb1YxRW9jSTN5b3ZOS3pjaWNXYmpTcFBaeHRLNS9kNDUzeUovWk5VSEdT?=
 =?utf-8?B?eDYyMDI4dnpuVlBDY2Z2U1FXdk1abmlKQUVvZnlIeWE2TG1HbGRNT21yRlVl?=
 =?utf-8?B?dmdyd0QvbUlDYTc0dFZodHY5ZGZ4TG9QKytrZ0RFSGlqQUdZZGhycXM5dk1l?=
 =?utf-8?B?bGxBUE56QUZ4dHhHRFNjR3NPdVFxaU5QTWpRRkkvcUN1QUlDR3pYNXhoNmNR?=
 =?utf-8?B?Z0gydHkyZVRmcGt5aHBWdjYyeEJnK0xPczN0UGs5OVN0VkpCOEpRY2QvZFVr?=
 =?utf-8?B?djRIa3dEemJvY2I0QlNkNE5IckR5anpDRHNPbWlZZFdYTTV5djhwRmNVTWFC?=
 =?utf-8?B?aE1tR3AwOVh0RnFlQk54enlVM3ZpKzM5MHJ1UXRacVNmSmpiOUpSdjR1ekh4?=
 =?utf-8?B?c25BZDlSTkVZa05YM2lRZnIwU3RSWDNBMnRQNWkxS1IxMXRHS2pSN0R5Tml5?=
 =?utf-8?B?cnFIRkZQcXRRcDZtZ1RERUJockNmck95NVBnWGRZSCttR3pDMWxuZXpOMlJy?=
 =?utf-8?B?WXRyOG5SU3JGOU43Q2lvSm1CQ2Rvd2orbVVSZjZ4NGxTSFVyRGx6ZWV5Z3BY?=
 =?utf-8?B?eUt5emxRQjd1VnFMaVRkVzBRZ0RSWUh4Zk5qS3ZaNSs3bHdPdDN6WkZVRnNI?=
 =?utf-8?B?SG5SdGhSRVM3OXUzZGZnUmtqOXRlT3MzQ28vVE9UYTR5M2l6S3c1Rm0wM0dp?=
 =?utf-8?B?RlpoTElJTDYwNUIwSWRURFlRVFlUVWpGUzRHYm9ncXB3WjJ1bTg2dkRqYkFK?=
 =?utf-8?B?MDJBMlN4a1pRRmxLU3dRaDIya3AvR1owVG1aTTltY2E4VXdlSFpBZkhGeW1V?=
 =?utf-8?B?QkVLeTFLTHNub2V2eTcxc0lVZWtvQWIvaUU2Nk92aGtzMVY2MGhlbHFYZEs0?=
 =?utf-8?B?WkhwYUh4eXB0SkF4b2pDVVVOSjgyNVhNNnpUcGhxeXkrb3c5K0RXRmUrSG5l?=
 =?utf-8?B?OUVFamJYR0FscStFMldJVEpkNFBFYWxCUEVBNCtvT0E2Mm50T1hmVTQ5MU03?=
 =?utf-8?B?b3pFMDBYemhuWHFCNXlpWTdTS1dHc0VXN0REUGN3YlZjT1U5Mis0N0dyMVIr?=
 =?utf-8?B?UVVFOXFtcXk5M1p1NWdCbGkvMTZzMlpLbmJna1djQVV6WFhEMnd6OG9YbUxU?=
 =?utf-8?B?bzhaNUVBUFltTkJWZHVRRG8xVkkyU1NHWTdEVEhISEJIL2MwY1pnT1ZDck1y?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de50e50-53ca-4568-d543-08dd9315faa0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 18:34:36.6719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6vhaVKsT16s02Ofv0gESwtWmFwz05ImqSZahrTVorM1g2MNIcOBAKlzYETOaDWZWD3sN23P/FA+ekLKN9+ohw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
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

On Mon, Apr 07, 2025 at 03:47:05PM +0530, Himal Prasad Ghimiray wrote:
> The attribute of xe_vma will determine the migration policy and the
> encoding of the page table entries (PTEs) for that vma.
> This attribute helps manage how memory pages are moved and how their
> addresses are translated. It will be used by madvise to set the
> behavior of the vma.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       |  6 ++++++
>  drivers/gpu/drm/xe/xe_vm_types.h | 20 ++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 27a8dbe709c2..1ff9e477e061 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2470,6 +2470,12 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  		vma = ERR_PTR(err);
>  	}
>  
> +	/*TODO: assign devmem_fd of local vram once multi device
> +	 * support is added.
> +	 */
> +	vma->attr.preferred_loc.devmem_fd = 1;

Assigning a value of '1' is a bit odd... I'd prefer using a define or
something similar to indicate the intended behavior. I noticed a few
other assignments to '1' in the final result—same comment applies to
those.

> +	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
> +
>  	return vma;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index d3c1209348e9..5f5feffecb82 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -77,6 +77,19 @@ struct xe_userptr {
>  #endif
>  };
>  
> +/**
> + * struct xe_vma_mem_attr - memory attributes associated with vma
> + */
> +struct xe_vma_mem_attr {
> +	/** @preferred_loc: perferred memory_location*/
> +	struct {
> +		u32 migration_policy; /* represents migration policies */
> +		u32 devmem_fd; /* devmem_fd used for determining pagemap_fd requested by user */
> +	} preferred_loc;

I'm a little unclear on how these variables work.

In the uAPI for migration_policy, I see MIGRATE_ALL_PAGES and
MIGRATE_ONLY_SYSTEM_PAGES (these should probably be normalized with a
DRM_XE_* prefix, by the way), but it's unclear to me what exactly these
mean or how they're used based on the final result—could you clarify?

Likewise, I'm confused about the devmem_fd usage. It can either be
assigned a devmem_fd from the uAPI, but in some cases, it's interpreted
as a region. I assume this is anticipating multi-GPU support, but again,
the plan isn't clear to me. Could you explain?

In general I agree with the idea of xe_vma_mem_attr though.

Matt

> +	/** @atomic_access: The atomic access type for the vma */
> +	u32 atomic_access;
> +};
> +
>  struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
>  	struct drm_gpuva gpuva;
> @@ -128,6 +141,13 @@ struct xe_vma {
>  	 * Needs to be signalled before UNMAP can be processed.
>  	 */
>  	struct xe_user_fence *ufence;
> +
> +	/**
> +	 * @attr: The attributes of vma which determines the migration policy
> +	 * and encoding of the PTEs for this vma.
> +	 */
> +	struct xe_vma_mem_attr attr;
> +
>  };
>  
>  /**
> -- 
> 2.34.1
> 
