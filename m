Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354DDCCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 21:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C5810E9D6;
	Thu,  6 Nov 2025 21:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQ7Eo82m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F37E10E9CC;
 Thu,  6 Nov 2025 21:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762463640; x=1793999640;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=8+AXZsKNrqPc6Aby49nejF/6rq20IDLDaKbKORGsluY=;
 b=MQ7Eo82mNxH1zQOfer9a3BbhMcaW/B6cwRbXN4eLbrAQ/Z9/8TMAdLZr
 9ChFBwMsVAh/JrQ4wVlU5VrbiGuAtDlMJijMNxyXEHnKjZZI/v4ywg+Su
 tcNK/xmhK/2CcIB4JGrB95/YolAFhiSaTWnev0+UAoTlnYXtDR6YnpjyV
 2mm3UEOc/n/2u/6RN9FSRgdkeMAKqizHPP4O061a+qUUbhBnaayYVrhFi
 YsnqyL/JE2PJdYO+/IMLXpiZyoWENXacByOtXS/h6MOMYDzKgdpfoDuqU
 7qFbWQBSwvBp7U8rzmzVWLS4PFoQ+i9OqRPLKvNddH/cpbeqM0mH330FL A==;
X-CSE-ConnectionGUID: CT8gP+lST4OaRY5+k8IEGw==
X-CSE-MsgGUID: yKvCC3BDRymTmycgkEk0cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="67225892"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="67225892"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 13:14:00 -0800
X-CSE-ConnectionGUID: PebNVJR0Sbu5htS2JLIhJQ==
X-CSE-MsgGUID: Ex5uetvrRpesMRgh0XAzHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="187161067"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 13:13:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 13:13:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 13:13:58 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 13:13:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j13gDA6DCGfrctc0lTpsDmGhMIPwbJh4mclujWSezMpt/jtlkMMFzn5is+fjOzqQ6+AdjlgjuzKihtJZZidFydvh8GtYvc0tmuaxsFNd6YXPF3M3AVbZ8ZGDMWcVkjCQARFr/9kDJXlBpTJWQjdr1Ej1F5GyF7GJ0XZ6LBNu7CemHiMC5AT2wDvsOHwVsNPGqQo6KJLhnmGSvj0fEE8GbJ/QLPzfYpV3n2iTmulUEBzWj6LRazLArqDo5WG1J6kmhZATki/ThTlKJZdWzjEAmGHtWFHo6cmJwn2wQPZkl5Yjtf6hM3Bjhq0Sy7nzynxO/6uYimNdJ7MpL/1Vioe1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVFcRA/GMhALP70E+lWwtYST2CBmYGpmDZwynW4DgFs=;
 b=SCVz/Fx7zmUw5lIpXZrjkLJ+2+5Dc2yI6dckjtuvRRSOWZR7FKQNo+/wjpYHzgEUgJcHsxe4046JDuBLuVdy26ztfFPc8f06tE+Plf/7iD6t2lpBq7291tPLfVXahOdDlxIkHzIPT1+NdB6F5sYKsV5kvxe1uacHbR3qdFscvmk8FEk+23KLwbjcvnw0X0eTyvaBKyvD7lqkI92q8CDDscqTtJhF+Z1UcL33CZF8AMnnBlHRSfnHZhgSpYWuoKcbHDsJYBUnG4ciSYHwjlrtCzD7jkrq4RA6RM9ZgYt27j96FxVwmr2zlhzCs4nC8PfNF+bW9MQixDHWQkLgCkA/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6723.namprd11.prod.outlook.com (2603:10b6:510:1af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 21:13:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 21:13:56 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176238252248.20673.8647482666171072719@10055242dc62>
References: <20251105140651.71713-19-gustavo.sousa@intel.com>
 <176238252248.20673.8647482666171072719@10055242dc62>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for Reviewed patches from:
 [PATCH v3 00/29] drm/i915/display: Add initial support for Xe3p_LPD
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Date: Thu, 6 Nov 2025 18:13:51 -0300
Message-ID: <176246363150.3117.18000745930665542292@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::34) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ecc21f-5208-467e-78bb-08de1d796592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uk9UTkNrUnRvaHNsWTluNzE3ODNtMm96R0RZS01IeE5nY1lndUpTN093cWtV?=
 =?utf-8?B?RCtKN2J1YnJaamhTK0dvVE03Q2NNYjdBakR2YTNENFdWOEhTQWN0aCtzeVdI?=
 =?utf-8?B?QTRTNG5qbVdoSjUrMmw3bTJWOW8rU0hUMS9ZNzVpcC9TR1FvWGpYcEdGYjJ1?=
 =?utf-8?B?alJRNmdhVFcyMFg0amJmcXlLamFzcFVhV0twOWZJdVg4UXZXTksyREEwSXRW?=
 =?utf-8?B?Wit1NE93dittOVFsQWRia2FSa1ZrQU5xRlBJa2tDSDhlSGs4czVOZ1pxMHNn?=
 =?utf-8?B?aXdOS3NmSS9qeTRYdlhydGpoQ3hhbFYwSmxaYkRBS1NLL3Vxb1Q5NDJhT1Uv?=
 =?utf-8?B?QVpySnNVcjFtNHJxQWVabFFvVUtlNURHYXcrb0ZsUzNtOVRWWS9walpFbS9H?=
 =?utf-8?B?VDhyYytoSEp3VFNaZDNMcDBtaE5tZUg0VFBlMHhXTWtmSEt1REZKUys1dHdR?=
 =?utf-8?B?Y0V4Ujd6QWNoaHI2UnR3ZlVqYUgxaEJnbWhOcFNPZ2MrcE95eG1LZUlTQTZI?=
 =?utf-8?B?ODVPK1IybW5PVXhGZ3FsWWxKc1dDMVZua2dpeXFiOXVmeDlYTGtXa0tZeW9l?=
 =?utf-8?B?VnBxck15eTlkcWlvQmZZN0dNWUZhUFR4SGFDUUd0djlCc2VNVm1TOVYzVzlL?=
 =?utf-8?B?SFUzcUkwWVNMVFlQUnpDNE5RQUdlOXYzaUNhVy9pZEJwTmxuM1A3ZGNNMmpt?=
 =?utf-8?B?U2Z0YjA0d0l5amM1ZFg5aFZxT1VtWHNqa2dUZ0d3L1lraGlyMjYwclgxZFlu?=
 =?utf-8?B?NVplSTc5bk1QZ2dWYXAzNWR6cUpNWEY4Zi95VGZRL2pGYUhrMDZMdENaVEZX?=
 =?utf-8?B?M0docTFpQm1XYTNqQmlkOG4wQ0NXTGlCWVQ1bk9tNzNkTUY3aGF2ZE5oc3Jx?=
 =?utf-8?B?ZkdMODNZMnc1K3FXMW5nZWFpQWVqc0s5TTZhZVRhKzlFUXBFcmp2Sko1VVNn?=
 =?utf-8?B?V1ZYWmp0OU8xWWpGalNlWG9jYkh5QkxnbjRpV1Y3OVdXUVF6YU1KcW1zcHRH?=
 =?utf-8?B?czRJRCtaWkRrSmpnaUdmYkJtSjJUVzFyYnpqVEhPWGFaUkJIc0ZqOWxkS05v?=
 =?utf-8?B?ekFOQWdiaTNkMkt3b0pTSE1rdHE0QW5BY0oxQURyZHcwektwYmVkQ1MyNVA2?=
 =?utf-8?B?bHFOWHFUTTJTbUpUc2tSOWhsdHlnMGJteGxGNkR0OW5sOWJxTUlIUTRycE0y?=
 =?utf-8?B?QzJNT1pRSnRWTjNEM0RFU1JqRWNuOG5hOHExOVBsU0g1c0VBS0JqdDdSUXpk?=
 =?utf-8?B?YXBWY01ER2VxRkU3TllQWVpkc1cxTENlbnZmNFV2ZzdvTFRMb2VFalFvUWVs?=
 =?utf-8?B?aHpGay9EMHdsODFTa0pjem9GWjUwSDVSMDkwbmhjZEcvS2swUFhQRXhjdWdm?=
 =?utf-8?B?MjlkTjlCK2w1cGk2UXM5N2d5R1dJajNQbHFjbFpxYlRkdUZ2RHQ4OXM5L2xz?=
 =?utf-8?B?blBpeVV3WTJTSzJoaFhQaldtR0pnb2J1RmU4ekltYjArQVQ0aFVMbTlNZHNV?=
 =?utf-8?B?RjhvdEJPRmd3eGhZUUtwNUpHYzhvc2ZITzl3Z3RQRjR3UHVyWlpFVjJ5bWFV?=
 =?utf-8?B?SVB5Mk5XMGhudi9JVDJnUmZBS2RiTHFwbkVWWEQvNVlUZ2x5N08xYjdaY1I4?=
 =?utf-8?B?OXZTYzZDUis1WUVRbjcxbWdzcXdlMlBmTE5SNXMybTFkVDNLc3pBTlBNWkNZ?=
 =?utf-8?B?QnIvdnY0NElWbnE0L29KampsRVR2MkFCaUlBaDU2UkM1c3dCNFFYZGFic1NC?=
 =?utf-8?B?NU5IVHJRWUFKZFZZNEYvYjROQ2w5UHBDSmxCSVpHaHU3UzE2eUE1U2tFenRH?=
 =?utf-8?B?bEw1eGtVT3dkM0dCL2ordUlOWC9XcnppZ3RXYURRWHlwd1Nia3ZMUzVRcjdy?=
 =?utf-8?B?aWFxeUljU05pMjNRcnNOQi9lQjdQL1dwcUpQRmxrdXN5UXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUgxdG04NGtRMC9TTnQvZXBKN3JqdGR4a3VKY2FBUmoxdEN5NlRUNTYraWli?=
 =?utf-8?B?SE1Wa052bVJHTjVocUVINmZGN3dPVnM4eFRQK3R1MUN1QVNaZFZrdHN5OFFw?=
 =?utf-8?B?KzllR3A4RTQ5TVlGVnhGd1RXMUdQeERUSGx6c2t0VGVCV3djclN0R2xRN1RS?=
 =?utf-8?B?cHJUZGRwcm5ONUQ5Q25FMk11VEs2ME5WNW9Obk1XKzQzMm5HaEp3Z0NsaWFj?=
 =?utf-8?B?d2lzS2huT3BIcTZMNGVxNlNwMXg2aGIrWlF0SWxPK0gyR2UwMUQ0Vm5WRjR3?=
 =?utf-8?B?RDdPeFVUNHlDbnhiTy9QblZaRzZZYkV6WTJ5anNXd0Z6QTltSWFTZlRTd1U5?=
 =?utf-8?B?T2x5MkRmbnB5OWNJKy8vM3ZTN09Ocml3djNxNzhCVGlLcXFFU29aUTNyNXpR?=
 =?utf-8?B?UkJKRy9XVGVxOGk2SFVsTVRROWZFVFVQbXgvUTBtYm9kQUJRQThJeGcybDNL?=
 =?utf-8?B?d09LcG9SMmpkTEZ4SU02V3VWQU5CNXpVSjYva0FqVkVHQmZaYVRURXNuRmQ3?=
 =?utf-8?B?V09teXh5NXo0NFJpbEl2ckNSWVRyK0UvMUpOSkVYRFNPOFNJc3Z5RkwyWTlu?=
 =?utf-8?B?T2J1RDV4VXkzanVmWmRZVnU5Nll6SG8zTENUeE9WVnZaQ3l4aW5SbGFHOVYw?=
 =?utf-8?B?dmphM09DNGxqWUxHK2c3bzFmc2FBRWVHNnNSWmt6ejRPRld6SE5YUnVvNmlo?=
 =?utf-8?B?ZTZaWlM3UUVuVHNrdm1uVG8ybHM3Q3JrekFZVG94bGVCcTNlaWdUK241cnZS?=
 =?utf-8?B?Sjd4RHJvcW9rS2tPSTN6TUVjTUVXWjEyMU5Bazg0WG5Ga2wrc1hWNDZhZ1N4?=
 =?utf-8?B?MlVqWlpYeCtLakNlZHNMT3I5NWZLMzlxMlZKRC81Y3lkQ1Q4eEZ6VXhIU05l?=
 =?utf-8?B?eVhKSjI3cVpIbVVCZi83Wjd5OEFyb2VnSXpaZm15M3hGT2lPY002L1FHSjd6?=
 =?utf-8?B?M1g0cWNLanNMRnB4ZGRNaVZEQll6VkphVXVGVzFHYjhLV3VGZGdXeFVCWjJM?=
 =?utf-8?B?NzR2WXlzZHFScHp4QUNzQVRwdFhhaTJZd0E0djliVGg1dTkvSVNUUG9xeFY4?=
 =?utf-8?B?eFl6L0Q1THhyYlNvZmtnbktwSXRlbk5BbTFWdm50aDJoQy80bFRJVjk5K0V4?=
 =?utf-8?B?a2ttWlcySjNDQXFUNzBLQm9vd2lNZlBjS0hvY0ZFNkFJY0RVd0NHaG5uZWhN?=
 =?utf-8?B?bVA1SzR0Z3diWTVZRkNNeFVSMzNmMFNycHc3ajRrK0x0a1VDZldvZ1lJT1Jn?=
 =?utf-8?B?UGZHbkhjRGIwUTgrT3JDcVZnb3pnQklxcitCbWd5d1RYSkwwODRpakUwVklm?=
 =?utf-8?B?VGJPQ1BPN2J0Zy80V08yZ0N3ZXMxcmVpbFI1cENXRHRkclhJWklNTUhnQnZS?=
 =?utf-8?B?MjVOSEkwRnlKMHJTNHFtL2c4NEtidThOL3VodVMvNkpMYUpSSHovVEcwWnE4?=
 =?utf-8?B?MG1weCtlS0ZKWXpkcTN1N3Fuc3VDajUvM09CM2JBVHJNci8xeVg1cThGVnpx?=
 =?utf-8?B?SHBEeUQzbXlyZUZOQ2FEL3RJUkFiZDhiaC9jNXYwWXZPT2VoMUhnbUwyM1VN?=
 =?utf-8?B?ajFkWGw0WnFLTUt6aUVKaVk5OFZWR1liK284TXdPeDlXbms3ZnRNOVc1Ry9t?=
 =?utf-8?B?NlJDYXNhNnpxTzVkaE5kMkdLUjNEYW00M0VTTElrYm9DUGdFKzljMjNBdkVB?=
 =?utf-8?B?UHZRcm1NZFFrQUROaTNLMjN4ZythVDlEUFExOG5RY2lBZ29GL0RHNGRFZGZr?=
 =?utf-8?B?N3hmNmJhREY0VitORWgvWCtscC9FaFlYYWhMb2VPZVh4MXJ6K2FiWC9EczNQ?=
 =?utf-8?B?TnZnblU3YmhGSnl1ZTZYMkxybXdwaGRBQTc3K1Q5VUgxYlpuekM1YmpsQllS?=
 =?utf-8?B?RDFkVjZ3cjZYQTVGTEoyY0NaeVBCdkNQRzlDbzNEZDFhV3NDUjhLZFpYYSt6?=
 =?utf-8?B?ckdSTExnc3ZROVNGRm92SzdpMTlGc01vNTV1azFnNHAxNDRHMC9DTU1EcHRI?=
 =?utf-8?B?ZXhSdk1qekdQL3d1OHJCL0g0ZkF0Ym15K1R4N1NBQjRkeGwxa2dKLzFMdEh3?=
 =?utf-8?B?NFpkZlMxK1JuOXJ5VUFXcG9ubDdIaFl6YW9HVnJxWEZ0WlZjTk5nZHRHdTFV?=
 =?utf-8?B?NW9sTmRZTkliU2Q0VWdQVWJxVXFDUGdNeCtKQjNQeGllajhhemEwTkE1QlJH?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ecc21f-5208-467e-78bb-08de1d796592
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 21:13:56.7324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XWiSICakSWm0KKEF1cg0CdFIVLsuCX13ugQixu5PqoErM/JHQwTZ0qhF9kNASk42jOB/IQyAWkGgXWBZ4WMfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6723
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

Quoting Patchwork (2025-11-05 19:42:02-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: Reviewed patches from: [PATCH v3 00/29] drm/i915/display: Add init=
ial support for Xe3p_LPD
>URL   : https://patchwork.freedesktop.org/series/157072/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc=
_FULL -> xe-pw-157072v1_FULL
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-157072v1_FULL absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-157072v1_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1570=
72v1_FULL:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_cursor_crc@cursor-random-256x256@pipe-d-hdmi-a-6:
>    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incom=
plete
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4048-8043455e28fb7b80=
89e55e4390547a4c3d7bd4dc/shard-dg2-432/igt@kms_cursor_crc@cursor-random-256=
x256@pipe-d-hdmi-a-6.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157072v1/shard-dg2=
-436/igt@kms_cursor_crc@cursor-random-256x256@pipe-d-hdmi-a-6.html

The shard results for i915 show that this test is passing on DG2 for
cursor-random-256x256 and some other variations:

    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_157073v1/shards-all.=
html?testfilter=3Dkms_cursor_crc@cursor-random

Since this series is only touching i915 display code, it is unlikely
that the incomplete result is related to this series.

The other incomplete, unfortunately not shown here, is for
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs[1], and it appears to be
related to https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3113
and not to this series.

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157072v1/shard-dg2-433/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

--
Gustavo Sousa
