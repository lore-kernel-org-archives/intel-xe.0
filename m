Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52760C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 17:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EAE10E06D;
	Tue, 17 Jun 2025 17:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgUF84Gm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A875010E06D
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750180166; x=1781716166;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Kx3zEgn38Hc0gDy1JUUjP3v1FB/Hmo1nHA/vX02IRPQ=;
 b=dgUF84Gm96U8Sef7o+G5rhJ+uBPDgW3gfeI8O48b/HEeCW1PpyTga6SR
 1l08MWsGy5detDGeR0U57IBGW36d6MSzlVM5fh6fuGxO5km49LCFy/dFB
 odJwz5OitTocBTioArbk1yiGpz0/LSTzp379NHPO//xRzlkjD8lU5sEHC
 ng3e/+/TI6MoUEHe2PGe463syWRqJ6Vv7hc/q3jj/P6vXaFSeM4ZONrw+
 19Mdk76T4cgMHIOrh0OrTtXuQdkV6UmamvlaXLebV9s9yJYOrOHTTVM6o
 CqWR3Yxe3DQGSe6NM6gV/0RL7E/FuHxLYIszQh7OKfRmN+EA+HNG6tAuL w==;
X-CSE-ConnectionGUID: 2SEq/na+RlCBSza6BsHUuw==
X-CSE-MsgGUID: DKSP1cjOT5uvbI1OUpR7PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="39976091"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="39976091"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:09:25 -0700
X-CSE-ConnectionGUID: ZxU1pAuuSaGqP1F81huFHQ==
X-CSE-MsgGUID: /R+cLhjtSOWXaYlEHldcaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="179733465"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:09:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:09:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 10:09:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:09:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTZoWRjKEx9gbLpqkdSesukuDwTb/tL9RxpQNxPYyZI9gJIEwGBmViBuDB8g3jTszW23fq4SNeJ5Cnif2pvyzLjtpqN8ovYzUMylefo5VBbPmjNn0TZoAONwG0a2t8C6r5AuqnT4JJDCKDpD+q8GBDyQOC1s5mzkXPWj9N8z9bE1Gh3RwrThGbpuQ+eXIHqmavReW2vyk2DHrM3KbUCuulb1uT0uf6wTgRDZmD0I4Jx4l4oKGeqZxfbZJJ2rcfJfnuQjA7dm1K93i3wgtVnJ7fEy9L8Xl5VBoFWF300qkFaAUu48fXDXaAkRZYgHMY7hogsyCH23rJOjl6EPaJjH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4vwzLT3yFYpqJkLA7ozzI6YqHOHkMB/JXoE+SBMPPM=;
 b=kKS3oQ/n9YA5FEO2ftZQ5E/r4ZVKHkRSLBdiktqh86VKdSCNgYve8fI7KJ1CqhWxpEwf0qDAoH/9+rA69nACeFdNp3J7QRIyAchns0m+AmhwN+AobbZBB/s4giVqyokjYVx52h/5w2F1GPNZ7dUHzGG0pbm3KktLqIulGZFv9utztT3f2ieWpXmiRbrFq6yeHv9Nk85BhAmS5+8IRb9C2ijbD4k15T194ZNYyRtuXNnxizXqFbZh4l5Si4xyp5iO8d9vGTIonnA6CW9qoc9qD5gTVMY9hpra6d6F90LWhqFtZp5q2O8+CswAGSONdzvsuPYIWCl0ieUoMc1h2LMjGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB8094.namprd11.prod.outlook.com (2603:10b6:610:156::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 17:09:02 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 17:09:02 +0000
Date: Tue, 17 Jun 2025 10:10:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH] drm/xe: Thread prefetch of SVM ranges
Message-ID: <aFGhj3XXTet1Uyx1@lstrano-desk.jf.intel.com>
References: <20250616064712.2060879-1-matthew.brost@intel.com>
 <b1620d738130de216644d09722735607f0b1e35c.camel@linux.intel.com>
 <aE/cr2Eb/KJUIXnE@lstrano-desk.jf.intel.com>
 <fcbc8182a5dd5a5d6d6811109dd68390c6616fe0.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcbc8182a5dd5a5d6d6811109dd68390c6616fe0.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0265.namprd04.prod.outlook.com
 (2603:10b6:303:88::30) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a49e17-070b-4ac9-d13f-08ddadc1a8a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGQ5WENJQnJKSmFNOWIxVGdieCtnMWdsUENLUGJhK0x5L3ArLzRjdHZuMkRs?=
 =?utf-8?B?eG1Db21FM0trUDduRHFjKzN6eSsydklqTXBHd3VaRWRFL2F0cjR4OFhEeWF4?=
 =?utf-8?B?ako3QldHMStGQmE1Sk1SZ0hrdE1GRVRSc2JzRFI5N0xydTFJWW9OWC9zSlV2?=
 =?utf-8?B?WmxNVkZmWUNpYnd0MGcvZWtqUndiUnpYRFhKUjdwbnV5dktkUFFoWS9KK25S?=
 =?utf-8?B?L0ZzZ0tSdXlSUHdscllvRDVsMWEzQVpLU2dWWmdHMnB6SEp6SzJIckpGVG55?=
 =?utf-8?B?S3dGZTVmWk5NRGppaWhYUkFHQkVHd2toR2Q2UE43b3N6QWJadmgxTUF2cjls?=
 =?utf-8?B?M2xmZTFoU0xScnNTVi9nTmROU01tY0lqR25nKzRzSWVEUkdWeTBxL0kyWjlO?=
 =?utf-8?B?VTJmVEVmTWVGUy9HOHV5ZUF1ZmF1OUNiSUhzNk5WS2x6YnhLRllwWU9PelJq?=
 =?utf-8?B?SXRGYWMwaFU3MmdHbUJTSGJNYlhqNFJhTm1sd0NEQ2ZwKzk3M0tsalhQWjcv?=
 =?utf-8?B?OEJmTVhseHQ0d3NNRGlSdXVjeG9ndEY5SENLdm5YaGljWUxySDJUc1d2c0dL?=
 =?utf-8?B?bXdUcEN4aXZ3SE5VdVVqQU1JUXQvRjJuYjczU2pHcEh0eVZiRmI0TzEzMTZ3?=
 =?utf-8?B?QWovZFpubTIxb2ZjQk4xM3NDQ2VNVkFwQU5TNXZBWWsvckRiNm1uVXJHWkRG?=
 =?utf-8?B?Y2JqTXlHSzBzR1R5YTliK0liOFpaRGkyaHUzTmFSNThuTTNFeVk2S3gxbWpH?=
 =?utf-8?B?dkI4MisyN0pnRmZnNEUva2xjTWUwTm9mMW1JM0FvMFBTUDM5SWpSRmJZdzJD?=
 =?utf-8?B?ZWJMbHJIcTF3UGcrd2UvemdFR21DWGdwY3QwU0pMMnArTENDM01KOXBPdFFP?=
 =?utf-8?B?aGcwUnZkODBXenlZdWZoODljbHg3WnpISXNDQWVrWjBjM09iMXkwRzFtTWla?=
 =?utf-8?B?OTR6ejgwL0h4NHVvUTZyazlMcTVGY21ZS1NNd1lsdG5PUUplaUFEK3I2T29r?=
 =?utf-8?B?MXNHVUdQbk4xRHhEQ3lDTzA2RWQyTXZwWVFEbjJSQjZ4SXVHdEE2enVvSnJS?=
 =?utf-8?B?TWllaU9uSTN0QmZDZ1BQTkZsQk1MSURGOS93ZlNTTHB3aE45VEhJeUw4bzg3?=
 =?utf-8?B?ckZ1Tm5FZ05UL3h5NFphKy91UTBzSUhQbWM2QklkZnIxbDFadlRMWnU2ajFj?=
 =?utf-8?B?bTFVcmYrdEdBWERaOXBCa2hTbkM4NG8vK1VCcFpXUjE5Y3dUNkRGSVNVSEox?=
 =?utf-8?B?ekJtNU5TTDFkS0JlZG1XTjd2bjc3TVE0RDVTQXlsaWFkemlsYkpsOTlGazU2?=
 =?utf-8?B?cmErZml5TVlEYjAxTHFqc3daWUJWN1N6YjVUVmhLMDhHSTJ1YWFFcDAwTU0y?=
 =?utf-8?B?eEQ2NFVQWUw5SE5CNWtiUFgxb0Zzdmt4ckpNbFVkeS83clZoWjE1cCtPekQr?=
 =?utf-8?B?dklTRkpTc0g2Y3hGV1ZROHlsdEVnb0I0cFJxQ3VaSkZUUmJ6TVNuUVN6Rkla?=
 =?utf-8?B?bnJyNTdUaHFleVJrVzJDVStldTg3TzZXeWM1Y1Y1a2gxMm9VRitHdzdiaXd3?=
 =?utf-8?B?TVZyT2FISVFhMkZEZjduMnIxOGNWeHM3eGNXdmVBOFQzMWN1cnZMVFNWUUk1?=
 =?utf-8?B?OEZSbElBLzZsaWZlVkNlaEpsc2dSQzBpU0RPVW9XUWJXSmlyNGlSN1djbEZy?=
 =?utf-8?B?TEpBcmpEd25iQUU4QkNHcUdZTCtBWGxiZXpqb1RYakQ5QWUzUmZKVExMNmNx?=
 =?utf-8?B?N2JuMS9RV25pTkhYT2JqZ0tIc1lPQWxtWUlFNC9ETGJEc3dlSWpMeFVlNFVC?=
 =?utf-8?B?TVJxd0ZSWldPNEpUU2srM0ZKN3MwcmdmVUVnQ0N1dG50Vjl2VUI5SVpVRTRl?=
 =?utf-8?B?YzVsMVVJV1Y4WUs5YU1UYTFmcnA3OUYwUWNsNy9IL2hISmRHa0dqOFpjclBC?=
 =?utf-8?Q?iH7YN1G9rEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3VtSXJXVDB4d3VCRFVhTFdjVmNPVWF6YkZEUlhsUkR4YnczazBCSU1jaWtW?=
 =?utf-8?B?KzJTNHRyTjd6bytYcjJSbms1RWZnNHJPMWQzbXZUUEZHSFZqbnEranU4TFNq?=
 =?utf-8?B?d3g2Q0FCUGliTkdBVndDMG9JSFo5eExlRnE2cUdUZDFwYVprQ21xSWJKWURT?=
 =?utf-8?B?V0xic3gwRUxQMnVBdTNPZUl6b2k2VGhEaGxjU1Y0dS8xay9NdVVQb3Z1SC94?=
 =?utf-8?B?cStTTnhNSWsxY01qVEMyckcyZjVZVGx3YlhWeUFPLzNOcXcwWWt2bGEzaHFi?=
 =?utf-8?B?WjRWRmRySzVmTHVMUjVLbEVpUEl4N1ErSng4cnFSdkcrNHp6WlFSQm84anJ6?=
 =?utf-8?B?UGVnU0tvSVdwem9FNDdRWHdaVnBxQjgvZVBNaFZPdGo0K0VOM0ZmeTNjYncy?=
 =?utf-8?B?cE93d1FScFdTaUR3bjlDeWV4QmpPTFR6VENEZk1CRzYzai9VOEo3R3ZFaVIz?=
 =?utf-8?B?Wng0c2l3eFFqdHRDUkhuZnNFaCtTMk1mZkt4Mm9yblBPKzZMWkk2dkxJd1Jn?=
 =?utf-8?B?WFVFOC9LRisxTThiclloRTI3NGtCZ09MUmdreEJ2anIwVkpMZ29SVk5PN3Vt?=
 =?utf-8?B?dDVTOHI5TTRMaHZvbnNSUC9qQThtdVZqZlRtSnI4TWJRV0gxT0RKZld6bTVi?=
 =?utf-8?B?NzhWMGFqdkVwaWUvRDdDYVdJU1llenoyaHZ4Y1dQL0ZienR1SUhhbFU3ZW1y?=
 =?utf-8?B?Unlxd1pOWThrWm4xN0U1L08rRWhpWDJlQ0cwdS9NWnFTc0VScWZhWmNqUkVG?=
 =?utf-8?B?eTZRVHdvc0laZ1BwdE5DU2pyblAyRUp1QWVaK05DakozT0ZFdmsxaXJpSFk5?=
 =?utf-8?B?Ykw0ZnJPc1hZZzl6blFtVDZJTzV2RFdNQStBcDk5SlB4VDdOU2xnMUZwUGta?=
 =?utf-8?B?UnRBRG10WXlJSHJaOEpsN1p3NVVvWG5vb3k4bnFtZi9ER3lzTWx0WGFtUWRH?=
 =?utf-8?B?SFRmY2ZVVG0zL1F4N3I2U2pXSjlJK0lGcnhHcFB2SjJxLy85ajNZM2JDYURk?=
 =?utf-8?B?UWw5TnNzRW11MWVnUnJORGZHakI5dHlJczd5ZzhGbDlKakdMTlNJcDBSU0Jm?=
 =?utf-8?B?ZUw3d01YbzdTYXJ0ek4zMVozMzY2SFRyclJKbE9uUGF3SCtMS2ZKSC9SUXlz?=
 =?utf-8?B?aWRGb2I0eFE2WXJVZDR5UXBaQTlnL1p1NGt4ekp0R1pLalU2ODAxZnNPeXJp?=
 =?utf-8?B?eUdCdkNibFZscHdTa3F0azN6MzJNK2NQc2Q2KzRNbXlqQnJQRDRZMkJpTVBG?=
 =?utf-8?B?M01jYk9pbGxoOWFWR2hNVERpdElUSXNGbFhDZW02cXhORCtPLzNKRmI5SDU0?=
 =?utf-8?B?SUFFbWZ1a3lrNTJ3ZE9KcXdiMnhka2hXaVVsTjdJQnA2MFJPWjBzWEpQcjF2?=
 =?utf-8?B?OXpOT2g5dGhxVndTUHJHUXZoSlkxY3lqQ09VNk01MythVE9iVzVpQ252Yk1V?=
 =?utf-8?B?VDZkUFhoSjVxenBVdE0zLzBzaEp6OElSc0FoT3RKYmpiL2hDN1dQYkRQVTdy?=
 =?utf-8?B?VHpkZm5ZbXMxQjRaeUJNUy9vQUhVK2FNa1h6eU4veDUrYndnc1IxNzN3dE9B?=
 =?utf-8?B?S3VkUFppQitKbkhVZHRlRmExR1dRYkxUKzZLTHRVcmd6TnBlSFJrZkRhd3Ez?=
 =?utf-8?B?YUtkT0IySHF3TlJjRm8yV0tpaGtSTGVObGtrQWJVWDl3OWZuVFFINXM1ajFB?=
 =?utf-8?B?VGdPRE5YNGRkdktUOVE2ZDN2MjVPMm1Nd3k2bENkTVJtV2JubFBzOXZ4S1l6?=
 =?utf-8?B?UXFRTjlmMVU5WnpIRWcxanFCT0hoSWlsVEVWNk1aZzZEdUNuTm5ORytRNDBL?=
 =?utf-8?B?ejQyRm9tMXRTNENDUzY5T0tsTU9LczhpRjM4UnBjVEFZd2dlWnU3Y084akdV?=
 =?utf-8?B?cm9iWFZabExJcHBkTFZhblM0bHY0T0luQmJpc3BBZzVjTnFHVUhvaEQyalB2?=
 =?utf-8?B?Q0JncjEycm9kYW1yMS9CSjVqMjhQbFRqaGRJUDNOOXpBKzRnVjlqc2FRbHZJ?=
 =?utf-8?B?ZkljTFM3RkdmNDVnandZVzFla1pzYTZweS9vMjlINzRKNmNYdjFJRk9iYXBH?=
 =?utf-8?B?SVlNS1FWOGpPM00wMUcxYldGc3JRNjAwQTVlUS9rL1hNaEZpM1htYU5zb2Mv?=
 =?utf-8?B?NCttVytYcEJhN3libVYwUzRqVWJjbkRNM1NZZnZHdEtZWFJrSzlmOXZzYWxr?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a49e17-070b-4ac9-d13f-08ddadc1a8a1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:09:02.7656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoHMS576qnYYe2s8Dpjy56d6Hx/ZGwuFZ66BJPDlpnHF/pVe/LtMpEAHKOhunrm+xIn29u3qeC3kLoVj6gEHOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
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

On Mon, Jun 16, 2025 at 01:20:16PM +0200, Thomas Hellström wrote:
> Hi,
> 
> Wait, let me take a closer look. I got the impression from the commit
> message that parallelization was done on a lower level than it actually
> was.
> 

Yea ok, I replied to other responses, let's continue the conversation
there. FWIW I think this correct level to do this.

> Thomas.
> 
> 
> On Mon, 2025-06-16 at 01:58 -0700, Matthew Brost wrote:
> > On Mon, Jun 16, 2025 at 10:28:16AM +0200, Thomas Hellström wrote:
> > > On Sun, 2025-06-15 at 23:47 -0700, Matthew Brost wrote:
> > > > The migrate_vma_* functions are very CPU-intensive; as a result,
> > > > prefetching SVM ranges is limited by CPU performance rather than
> > > > paging
> > > > copy engine bandwidth. To accelerate SVM range prefetching, the
> > > > step
> > > > that calls migrate_vma_* is now threaded. This uses a dedicated
> > > > workqueue, as the page fault workqueue cannot be shared without
> > > > risking
> > > > deadlocks—due to the prefetch IOCTL holding the VM lock in write
> > > > mode
> > > > while work items in the page fault workqueue also require the VM
> > > > lock.
> > > > 
> > > > The prefetch workqueue is currently allocated in GT, similar to
> > > > the
> > > > page
> > > > fault workqueue. While this is likely not the ideal location for
> > > > either,
> > > > refactoring will be deferred to a later patch.
> > > > 
> > > > Running xe_exec_system_allocator --r prefetch-benchmark, which
> > > > tests
> > > > 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s
> > > > with
> > > > this patch on drm-tip. Enabling high SLPC further increases
> > > > throughput
> > > > to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16
> > > > GB/s.
> > > > Both
> > > > of these optimizations are upcoming.
> > > > 
> > > > v2:
> > > >  - Use dedicated prefetch workqueue
> > > >  - Pick dedicated prefetch thread count based on profiling
> > > >  - Skip threaded prefetch for only 1 range or if prefetching to
> > > > SRAM
> > > >  - Fully tested
> > > > 
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Hi,
> > > Is this really the right place to do optimizations like this?
> > > 
> > 
> > Yes, for now.
> > 
> > > The migration takes place in xe_svm_alloc_vram() and is being moved
> > > to
> > > drm_pagemap_populate_mm(). If those functions are considered to be
> > > slow
> > > then they should be optimized, rather than calling them multiple
> > > times
> > > in parallel from an outer layer? 
> > > 
> > 
> > Shared code with an already-parallel fault handler... Prefetch is
> > just
> > adding parallelism too.
> > 
> > > Before doing something like this I think we need to consider
> > > 
> > > 1) Why are the migrate functions so cpu consuming? Do we have a
> > > performance profile for it?
> > 
> > Yes, I have profiled this. On BMG, a 2MB migrate takes approximately
> > 300µs of CPU overhead in the migrate_vma_* functions, while a copy
> > job
> > takes around 130µs. The copy must complete between setup and
> > finalize,
> > which serializes this flow.
> > 
> > Thus, as of now, the only way to saturate the copy engine is to use
> > threads so that CPU cycles can overlap.
> > 
> > Have you caught up on Nvidia's series [1] and what Francois is
> > working
> > on? I'd guess we'll go from ~300µs to ~7µs once that lands.
> > 
> > I don't know why the migrate_vma_* functions take so long—the core MM
> > code is tough to read. I suppose I could hack it to find out.
> > 
> > [1]
> > https://lore.kernel.org/linux-mm/20250306044239.3874247-1-balbirs@nvidia.com/
> >  
> > 
> > > 2) Do we actually *want* to use 5 CPU cores for this?
> > 
> > Yes, I profiled this with a test issuing 64MB prefetches—5 threads
> > was
> > ideal. I have a comment in the code about this. Once [1] lands, we’ll
> > likely only need 2 threads on BMG. That would probably get us to a
> > bus
> > 8× faster than BMG; for 16×, we might need more threads. But I think
> > we’ll always want at least 2, as there will always be some CPU
> > overhead
> > that limits copy bandwidth due to serialization.
> > 
> > > 3) Isn't a single CPU write-combined non-temporal CPU memcopy
> > > enough to
> > > saturate the system->VRAM bandwith?
> > > 
> > 
> > I'm not entirely following (see above), but almost certainly not.
> > 
> > Maat
> > 
> > > Thanks,
> > > Thomas
> > > 
> > > 
> > > 
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  31 ++++++-
> > > >  drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
> > > >  drivers/gpu/drm/xe/xe_vm.c           | 128
> > > > +++++++++++++++++++++----
> > > > --
> > > >  3 files changed, 135 insertions(+), 26 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > index e2d975b2fddb..941cca3371f2 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > @@ -400,6 +400,8 @@ static void pagefault_fini(void *arg)
> > > >  
> > > >  	destroy_workqueue(gt->usm.acc_wq);
> > > >  	destroy_workqueue(gt->usm.pf_wq);
> > > > +	if (gt->usm.prefetch_wq)
> > > > +		destroy_workqueue(gt->usm.prefetch_wq);
> > > >  }
> > > >  
> > > >  static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue
> > > > *pf_queue)
> > > > @@ -438,10 +440,24 @@ static int xe_alloc_pf_queue(struct xe_gt
> > > > *gt,
> > > > struct pf_queue *pf_queue)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static int prefetch_thread_count(struct xe_device *xe)
> > > > +{
> > > > +	if (!IS_DGFX(xe))
> > > > +		return 0;
> > > > +
> > > > +	/*
> > > > +	 * Based on profiling large aligned 2M prefetches, this
> > > > is
> > > > the optimial
> > > > +	 * number of threads on BMG (only platform currently
> > > > supported). This
> > > > +	 * should be tuned for each supported platform and can
> > > > change on per
> > > > +	 * platform basis as optimizations land (e.g., large
> > > > device
> > > > pages).
> > > > +	 */
> > > > +	return 5;
> > > > +}
> > > > +
> > > >  int xe_gt_pagefault_init(struct xe_gt *gt)
> > > >  {
> > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > > -	int i, ret = 0;
> > > > +	int i, count, ret = 0;
> > > >  
> > > >  	if (!xe->info.has_usm)
> > > >  		return 0;
> > > > @@ -462,10 +478,23 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
> > > >  	if (!gt->usm.pf_wq)
> > > >  		return -ENOMEM;
> > > >  
> > > > +	count = prefetch_thread_count(xe);
> > > > +	if (count) {
> > > > +		gt->usm.prefetch_wq =
> > > > alloc_workqueue("xe_gt_prefetch_work_queue",
> > > > +						      WQ_UNBOUND
> > > > |
> > > > WQ_HIGHPRI,
> > > > +						      count);
> > > > +		if (!gt->usm.prefetch_wq) {
> > > > +			destroy_workqueue(gt->usm.pf_wq);
> > > > +			return -ENOMEM;
> > > > +		}
> > > > +	}
> > > > +
> > > >  	gt->usm.acc_wq =
> > > > alloc_workqueue("xe_gt_access_counter_work_queue",
> > > >  					 WQ_UNBOUND |
> > > > WQ_HIGHPRI,
> > > >  					 NUM_ACC_QUEUE);
> > > >  	if (!gt->usm.acc_wq) {
> > > > +		if (gt->usm.prefetch_wq)
> > > > +			destroy_workqueue(gt->usm.prefetch_wq);
> > > >  		destroy_workqueue(gt->usm.pf_wq);
> > > >  		return -ENOMEM;
> > > >  	}
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > index 7def0959da35..d9ba4921b8ce 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > @@ -239,6 +239,8 @@ struct xe_gt {
> > > >  		u16 reserved_bcs_instance;
> > > >  		/** @usm.pf_wq: page fault work queue, unbound,
> > > > high
> > > > priority */
> > > >  		struct workqueue_struct *pf_wq;
> > > > +		/** @usm.prefetch_wq: prefetch work queue,
> > > > unbound,
> > > > high priority */
> > > > +		struct workqueue_struct *prefetch_wq;
> > > >  		/** @usm.acc_wq: access counter work queue,
> > > > unbound,
> > > > high priority */
> > > >  		struct workqueue_struct *acc_wq;
> > > >  		/**
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 6ef8c4dab647..1ae8e03aead6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -2885,52 +2885,130 @@ static int check_ufence(struct xe_vma
> > > > *vma)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op
> > > > *op)
> > > > +struct prefetch_thread {
> > > > +	struct work_struct work;
> > > > +	struct drm_gpusvm_ctx *ctx;
> > > > +	struct xe_vma *vma;
> > > > +	struct xe_svm_range *svm_range;
> > > > +	struct xe_tile *tile;
> > > > +	u32 region;
> > > > +	int err;
> > > > +};
> > > > +
> > > > +static void prefetch_work_func(struct work_struct *w)
> > > >  {
> > > > -	bool devmem_possible = IS_DGFX(vm->xe) &&
> > > > IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> > > > -	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > > > +	struct prefetch_thread *thread =
> > > > +		container_of(w, struct prefetch_thread, work);
> > > > +	struct xe_vma *vma = thread->vma;
> > > > +	struct xe_vm *vm = xe_vma_vm(vma);
> > > > +	struct xe_svm_range *svm_range = thread->svm_range;
> > > > +	u32 region = thread->region;
> > > > +	struct xe_tile *tile = thread->tile;
> > > >  	int err = 0;
> > > >  
> > > > -	struct xe_svm_range *svm_range;
> > > > +	if (!region) {
> > > > +		xe_svm_range_migrate_to_smem(vm, svm_range);
> > > > +	} else if (xe_svm_range_needs_migrate_to_vram(svm_range,
> > > > vma, region)) {
> > > > +		err = xe_svm_alloc_vram(vm, tile, svm_range,
> > > > thread-
> > > > > ctx);
> > > > +		if (err) {
> > > > +			drm_dbg(&vm->xe->drm,
> > > > +				"VRAM allocation failed, retry
> > > > from
> > > > userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> > > > +				vm->usm.asid, &vm->svm.gpusvm,
> > > > ERR_PTR(err));
> > > > +			thread->err = -ENODATA;
> > > > +			return;
> > > > +		}
> > > > +		xe_svm_range_debug(svm_range, "PREFETCH - RANGE
> > > > MIGRATED TO VRAM");
> > > > +	}
> > > > +
> > > > +	err = xe_svm_range_get_pages(vm, svm_range, thread-
> > > > >ctx);
> > > > +	if (err) {
> > > > +		drm_dbg(&vm->xe->drm, "Get pages failed,
> > > > asid=%u,
> > > > gpusvm=%p, errno=%pe\n",
> > > > +			vm->usm.asid, &vm->svm.gpusvm,
> > > > ERR_PTR(err));
> > > > +		if (err == -EOPNOTSUPP || err == -EFAULT || err
> > > > == -
> > > > EPERM)
> > > > +			err = -ENODATA;
> > > > +		thread->err = err;
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET
> > > > PAGES
> > > > DONE");
> > > > +}
> > > > +
> > > > +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op
> > > > *op)
> > > > +{
> > > > +	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > > > +	u32 j, region = op->prefetch_range.region;
> > > >  	struct drm_gpusvm_ctx ctx = {};
> > > > -	struct xe_tile *tile;
> > > > +	struct prefetch_thread stack_thread;
> > > > +	struct xe_svm_range *svm_range;
> > > > +	struct xarray prefetches;
> > > > +	bool sram = region_to_mem_type[region] == XE_PL_TT;
> > > > +	struct xe_tile *tile = sram ?
> > > > xe_device_get_root_tile(vm-
> > > > > xe) :
> > > > +		&vm->xe->tiles[region_to_mem_type[region] -
> > > > XE_PL_VRAM0];
> > > >  	unsigned long i;
> > > > -	u32 region;
> > > > +	bool devmem_possible = IS_DGFX(vm->xe) &&
> > > > +		IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> > > > +	bool skip_threads = op->prefetch_range.ranges_count == 1
> > > > ||
> > > > sram;
> > > > +	struct prefetch_thread *thread = skip_threads ?
> > > > &stack_thread : NULL;
> > > > +	int err = 0;
> > > >  
> > > >  	if (!xe_vma_is_cpu_addr_mirror(vma))
> > > >  		return 0;
> > > >  
> > > > -	region = op->prefetch_range.region;
> > > > +	if (!skip_threads)
> > > > +		xa_init_flags(&prefetches, XA_FLAGS_ALLOC);
> > > >  
> > > >  	ctx.read_only = xe_vma_read_only(vma);
> > > >  	ctx.devmem_possible = devmem_possible;
> > > >  	ctx.check_pages_threshold = devmem_possible ? SZ_64K :
> > > > 0;
> > > >  
> > > > -	/* TODO: Threading the migration */
> > > >  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > > > -		if (!region)
> > > > -			xe_svm_range_migrate_to_smem(vm,
> > > > svm_range);
> > > > +		if (!skip_threads) {
> > > > +			thread = kmalloc(sizeof(*thread),
> > > > GFP_KERNEL);
> > > > +			if (!thread)
> > > > +				goto wait_threads;
> > > >  
> > > > -		if
> > > > (xe_svm_range_needs_migrate_to_vram(svm_range,
> > > > vma, region)) {
> > > > -			tile = &vm->xe-
> > > > > tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> > > > -			err = xe_svm_alloc_vram(vm, tile,
> > > > svm_range,
> > > > &ctx);
> > > > +			err = xa_alloc(&prefetches, &j, thread,
> > > > xa_limit_32b,
> > > > +				       GFP_KERNEL);
> > > >  			if (err) {
> > > > -				drm_dbg(&vm->xe->drm, "VRAM
> > > > allocation failed, retry from userspace, asid=%u, gpusvm=%p,
> > > > errno=%pe\n",
> > > > -					vm->usm.asid, &vm-
> > > > > svm.gpusvm, ERR_PTR(err));
> > > > -				return -ENODATA;
> > > > +				kfree(thread);
> > > > +				goto wait_threads;
> > > >  			}
> > > > -			xe_svm_range_debug(svm_range, "PREFETCH
> > > > -
> > > > RANGE MIGRATED TO VRAM");
> > > >  		}
> > > >  
> > > > -		err = xe_svm_range_get_pages(vm, svm_range,
> > > > &ctx);
> > > > -		if (err) {
> > > > -			drm_dbg(&vm->xe->drm, "Get pages failed,
> > > > asid=%u, gpusvm=%p, errno=%pe\n",
> > > > -				vm->usm.asid, &vm->svm.gpusvm,
> > > > ERR_PTR(err));
> > > > -			if (err == -EOPNOTSUPP || err == -EFAULT
> > > > ||
> > > > err == -EPERM)
> > > > -				err = -ENODATA;
> > > > -			return err;
> > > > +		INIT_WORK(&thread->work, prefetch_work_func);
> > > > +		thread->ctx = &ctx;
> > > > +		thread->vma = vma;
> > > > +		thread->svm_range = svm_range;
> > > > +		thread->tile = tile;
> > > > +		thread->region = region;
> > > > +		thread->err = 0;
> > > > +
> > > > +		if (skip_threads) {
> > > > +			prefetch_work_func(&thread->work);
> > > > +			if (thread->err)
> > > > +				return thread->err;
> > > > +		} else {
> > > > +			/*
> > > > +			 * Prefetch uses a dedicated workqueue,
> > > > as
> > > > the page
> > > > +			 * fault workqueue cannot be shared
> > > > without
> > > > risking
> > > > +			 * deadlocks—due to holding the VM lock
> > > > in
> > > > write mode
> > > > +			 * here while work items in the page
> > > > fault
> > > > workqueue
> > > > +			 * also require the VM lock.
> > > > +			 */
> > > > +			queue_work(tile->primary_gt-
> > > > > usm.prefetch_wq,
> > > > +				   &thread->work);
> > > > +		}
> > > > +	}
> > > > +
> > > > +wait_threads:
> > > > +	if (!skip_threads) {
> > > > +		xa_for_each(&prefetches, i, thread) {
> > > > +			flush_work(&thread->work);
> > > > +			if (thread->err && (!err || err == -
> > > > ENODATA))
> > > > +				err = thread->err;
> > > > +			kfree(thread);
> > > >  		}
> > > > -		xe_svm_range_debug(svm_range, "PREFETCH - RANGE
> > > > GET
> > > > PAGES DONE");
> > > > +		xa_destroy(&prefetches);
> > > >  	}
> > > >  
> > > >  	return err;
> > > 
> 
