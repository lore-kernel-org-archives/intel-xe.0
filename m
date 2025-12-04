Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FBCD29FAE
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 19:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A4510E9AD;
	Thu,  4 Dec 2025 19:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iuE6FOMy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550ED10E9AD
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 19:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764874975; x=1796410975;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wbYMeico6uEo/uuo1F0u0t9uc4IUIWE7lLje022epLQ=;
 b=iuE6FOMykNTbslla91oR306fxENPK4VKmkPCi2m0yhNH8iLGr1/jVcMz
 h+/GCyVipxVS2TF5DjP3a4OAsTEj6rnS7qP/uztgYAOdDc1bpAe06IdD3
 1MbldGLUzb1S1NKZZgvkdN7NaMOsJvbHTziVzxXe6i+9Dga107cKHqlfX
 WPsukIjps8VuYX4nXw3nvu5aVgOghCKC4JM1i4G4ycvxiqYeVxP2cgAa8
 oi7K+BkpigJN8rne3a9Q6yD9D8LWxZsCmzawCq+BRIgIJakMeZBDT5qy6
 YCUH2BW06fDVAOOcVU6j/TTKJt+bhIND/goHLvfaweJ0vpbff0x3sIdmD A==;
X-CSE-ConnectionGUID: lZSeMp3kQ3+AJqdoYEJzxg==
X-CSE-MsgGUID: PbX9di62TJK2NlTaINRJaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78016950"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="78016950"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:02:55 -0800
X-CSE-ConnectionGUID: If4vcv+/SzmmXtVo2Mdkww==
X-CSE-MsgGUID: yLGR6Qb2SHitl7wjldTpWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="200192196"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:02:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:02:55 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 11:02:55 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:02:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGxdb6EILXOk3L15PGKtc9mkT6Ietvv5IMA6iCZ2ZQyW2ZGJFeMVku1y2GiKdDRt9/iZJgCh34ZbS7Vah6XoME5wAV1lT9AvCrZretEtgrzdZUzxhpOkfS9nf9A5zw7KU9YFZHLubHM8dX5u1w36lnuJg3NVRwjYZveGLkc/xcXZREKF7ir0iwevmBGALpCmJRC1b2AXZknZTlaSrVPrKglp4InmaGUGN2MTsdXD9+N9ATAMUXl554Ep+XUp7fKKhfnt16jPYgDdnI1XVlM/A2YLS8LvT3VCC2EgLmiRUHGwNAUN7WdZGwsdaVcUx7wl+JVYX7X51BQBy4gUHKf9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbYMeico6uEo/uuo1F0u0t9uc4IUIWE7lLje022epLQ=;
 b=k4r7MzYs+p+swKIHxh0+AAI5Oo/A9FLgUaGEshfPhpzyVz50pusXxSjYmq3ZYvysi7D7BumZXfbZgzTGd4T55Ab4FcCR8tv1rartMI4GBjyYHaQf/F6r71ZbwVkh/2G/7HS2i4iKHduRZU3zXSWUeRo/63NuUyEFWYfumrDoz7R/H/1QieZ90Q9O5V/7oM0IMBsuj1gqEoUknJw7hdwZqr+3oliz1XQx1oOObKFWYXIQ9Vay47ZxAi8vS4+6iLE4wtcBdVpY9EY1ZPAHVAqoB/RrlB4oe5nme/HUDYJ1d8zgl1AtKfJg1a1go4gzFXflY9bdlfhif9wygugkCoPqiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by DS0PR11MB6494.namprd11.prod.outlook.com (2603:10b6:8:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 19:02:52 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 19:02:52 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 2/2] drm/xe: expose PAT software config to debugfs
Thread-Topic: [PATCH v5 2/2] drm/xe: expose PAT software config to debugfs
Thread-Index: AQHcZKfN1JsktcmqYESgCDhe+kPMnrUQiu+AgABUoVCAAO0bgIAACvfg
Date: Thu, 4 Dec 2025 19:02:52 +0000
Message-ID: <SA3PR11MB8046B922CE3EBAAA22BD3EED86A6A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251117230156.366860-1-x.wang@intel.com>
 <20251203225355.24972-1-x.wang@intel.com>
 <20251203225355.24972-2-x.wang@intel.com>
 <20251203231115.GQ4065316@mdroper-desk1.amr.corp.intel.com>
 <SA3PR11MB8046FC1CA452CD5ABFD81F8586A6A@SA3PR11MB8046.namprd11.prod.outlook.com>
 <20251204182247.GD4164497@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20251204182247.GD4164497@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|DS0PR11MB6494:EE_
x-ms-office365-filtering-correlation-id: 65ffcbb0-97fc-4dd6-4274-08de3367b9a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?UTRNV2c3b04vZGwycGhIaldlNGZxb1lNSFQyb1ZWRzBUZXlaTjVSbFdGNEpY?=
 =?utf-8?B?R2VjSXloWWl2RkJ1OE9TK0hMZ1hsc0NpSi9JbFdEa2p4ek1TdnFQNUhPQUJS?=
 =?utf-8?B?WHlSOUdEYlI3UUNwZXhLTEh2VlBDRWxPbWxzUkJncS85cHUvUm1QdDVNOXFM?=
 =?utf-8?B?MUc4ZTF1aXVCY0hjQTVuREF5NTltc1JYOXpRY0RXL1NZR0hwR0NRVzNETllr?=
 =?utf-8?B?MGROaEE2SlN4eHNmWWFoTWZLZzAyYWl3RFYvUjFTWENOT0JxZUp3ZTBodkdP?=
 =?utf-8?B?RkhVTFhhLzZaSGFkMVRqb1NsRVQrV3pUSU9BcmR6a0F3QWdEMzhrT0hKODM1?=
 =?utf-8?B?WFMycWUxeGpVUDcvUnBvOVB2bVRWVlowTWFYWEkzZ2hZaGcxSWkzS2dFbFNE?=
 =?utf-8?B?VzlTKzNVUFE1b3ozUzgxbVVkOHYvVnZWNkZVdCtnc2FmZmltcjc1OFVEYTdR?=
 =?utf-8?B?QzJ2R201T1hSVkcyVHEwWm9SbVQveWE5MTZ3U2dlUlZ6djZYYVJoVGN0WWNB?=
 =?utf-8?B?b29GQjc3ZUJxNm0reXYwSHovTmZyZ0RzN1NDMjQ0MG42U2tsbmJWSWlBcjRn?=
 =?utf-8?B?R0RVQW5CdjNZNjVPd1p4VzBZN2kxUFhWNDlJUVBSR091bkdZZ2JLUThSUmJo?=
 =?utf-8?B?UGVBdWRWd21BeG05ZU5ZUk9ZZlcxSXFYckk4a2pJR1U5QzRSMkowTDhFbGRt?=
 =?utf-8?B?dGJIZjhyK2paWldsRjVBWDUzQW13eGo4OE54OWVyM0NEZVdVWlhDeGlDV0VY?=
 =?utf-8?B?VDY0VDU2MEVmdmdQU3JIU1BncHpqWXk3OHVldGpCMGRKRUEyZ0dpZHI2dEpL?=
 =?utf-8?B?aGw0NzI4eisxYVdiZHU1RUtFRGtUY3I0cGZQNTRlUWhqWXdvT2duK2dNdFkz?=
 =?utf-8?B?WEp1RDZabnZNNkM2K1IvcGtGcFlPR0t0cmFLUk8rUmROam1DNnNRR1g5SVp5?=
 =?utf-8?B?Sjl1bUJ6VXI5Z3VUb2IrS3VQclZ6Z2dUVWRGU29hZmd4STN3VU9vUWdWY2cv?=
 =?utf-8?B?a095eU1POUc5SXg1TmprRy9oMGdKQW9NLzJSd25XdGdYQ2JiM3FNVTE5YkJJ?=
 =?utf-8?B?ZkdLcWFUdjBrem9HeXJDeFJ5YUdoVndVT2tEa1EzMDU1RUEvc1RMblBNYzUz?=
 =?utf-8?B?SDNXRC9MdHVKdGl1Q3pzaURwWDZHOWJRVTNNNWhYK2d2WGJhN0Z0LzRXd2hO?=
 =?utf-8?B?OERRRjRDTTRHZHIreXFxSHZVckMveEtGMFhwYkp1QXFVYTNRMFIyRStvOFhI?=
 =?utf-8?B?bmFzM2Z4ZXQ1NFIrRmlwL3AvZU1YdFl1aWo2UU4wamZhUjd0R1JFME1ndXBz?=
 =?utf-8?B?U0xzWkhBUG41NXBVNWNNejJUM3dLSExGdDNpSjhhbjFtcjZ3RzlManhSUTJp?=
 =?utf-8?B?cFhtUjhBaFJtWlJZc2MvOWtnQWR5dFllaGRZVFgvOG1kQjFVU2Y3SUhWd2R6?=
 =?utf-8?B?NDcwLy9kQXlLeHhEMHduQW5XY1M3YXJ4UVZiSHVZQTBxVlUzMFd4b0U3YXJU?=
 =?utf-8?B?SkxwYjJOZGxaNzY0WmFEakUyeVpBcCszL1kraVZ0YU1FQ0VzMkFGdi8yYTdQ?=
 =?utf-8?B?THZtYmpCV2ZXNkVUUUM5VFpONFh1TUlXcHdzOWhFOXFsa21qdEd2SVAvTFNr?=
 =?utf-8?B?MFR1Y2cxbEFZaDVoL2dlZERUWGRTUjk1blQ5QnhiNURmSVhFbHpXdm4wQWVO?=
 =?utf-8?B?TlFTS0djTDZuY0paaFpLTmZDMWpoREZ3SzZxNUsvQjRPWWVYRnZpUG14enA5?=
 =?utf-8?B?eXlrdDFkZnhudzc5VTY5UTNHME5LWW1sS0JhWUdSa3BJdlUzSXVFS3hJYVM4?=
 =?utf-8?B?QlpOR05rOGxHRjFGTCt1WXZXY2dzbUs5R1BJaE9wd1pBVlpuenVHWnBVK2U0?=
 =?utf-8?B?cy82cHZTbitjMVN5TmNjN3NrRENTNE4wbmt2Rkw2Y25qakI0SkZwVW82OE5E?=
 =?utf-8?B?UGVnM1k5NFAxRTVObnJBTUVnQzd0WHJFbWg0OTkwTjVZcHMxRFo0Y0h2clZp?=
 =?utf-8?B?cUdzK2Z3dW1ZK01EUnZUL21xSXlDM3VWTXNqQm1zM0FDOUtsamtOSG1HaU16?=
 =?utf-8?Q?mhJrXZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXNyZ3BkMElZV054ZnppZTJ1QlV3ZHFBNURiVy85aVhIaCtEaXFtQkNDejRQ?=
 =?utf-8?B?dTNXWEk2Q3pPS0hWUkdjRDV2dVFrVWM1THBuakplUWQwbVQyK2VaTUxUTlpB?=
 =?utf-8?B?dHBHa3lnZ2NwbnBaaGtTZVEyRXdpVWE4TUVTNXlISVQxTUF1bHdCZDNZMnY1?=
 =?utf-8?B?bjBaSjd3eTdnd0VhMkNpcldOcEJuRGx2ZjZ3K3IzOVVwOHBZMHl5VnBqejJZ?=
 =?utf-8?B?SURWRUVXYmRKdS94UVdWQ3ZNcVRoZXFxQzJMSExCWTVaMThRcnFxNGsvd1RR?=
 =?utf-8?B?b0tSZmdFZWRHYmppalcvemg4dHAyb1ozK1cwZStPSmg3UXUzMFRJU0xkNUpY?=
 =?utf-8?B?aEZOdFBsR3E4TzRick1UUE8vKzdvV0pXcm9Qd3huMFJYMFd5eUZxQVNzVVFp?=
 =?utf-8?B?Q1dCYXNxSFFBemZzc0w3NFVKeUl2eURTc0Q3Q2U5TFdzNEtockpBa1QvaTY2?=
 =?utf-8?B?Y1k2TUp3NThPbTJzR2g0cHNvcW5MTHBQRkVTNVVURFNLclg3a3dwRzNhVk10?=
 =?utf-8?B?ZmUyQ1F3Z3hpQlExb1NpbWFOY0tXbllFUjJFdUE3R3JBTVU4V0lwSTRscnl3?=
 =?utf-8?B?WW9LenNxSmMrWW9CdFNHNHJGWU5EM29yeFVkZkVZL3VHcHBYczZ2bml6YmU5?=
 =?utf-8?B?RmRKS1VlcHk2TVlpS2VkZ2szcXc5TU5TQk5MS1dXdHcyZWZQUFlTOTZWT2hW?=
 =?utf-8?B?dnBOSm1BVzV0WHA2Y0ovZjJTeGprYUJPdmdiWWlFbENaUWNiS25USHZBWmtq?=
 =?utf-8?B?WitiNWhxTkhkMFpiN0oyQ2NnLy9WMzlzWXdjTGgwdWVyWHp5RnpoaGQrelFT?=
 =?utf-8?B?TGlKWXB4VDBMR05sa3VzUHlzLzZvN3ZEK3hJb3ZMT3kza3cxS2g1cS9uM21o?=
 =?utf-8?B?ajRNQjJqRkVZTFZWTG1VaUVoNnN3bEtsY2lycXBqOTJOQTVyOGhaaW5yT1J6?=
 =?utf-8?B?akpwbDBhOFc2b3Q1OG5iRS9kME8zbkRacytQT2E2Y2U1TllpaFVZWG9EQmNz?=
 =?utf-8?B?VWpYb20xQno5bmxpMzR0Sk83Ylc1MVhhQTFsZEt1YklnWFRLdForNHFNcnJI?=
 =?utf-8?B?M3gxQkFBWE02YjV3bU5LNXVhU2swZ1A3RlBSQlk3L0VieVFxWW80VysyUUMy?=
 =?utf-8?B?RFNzZlBWYjloaXFSSk44UzJIOXN3MFVabGd4aGtrTUZReWhGMEZIaS9Ld3o2?=
 =?utf-8?B?RUxpTWs4L0xXRnVGZVdLbkJGUzZlYzZXampPZU5qOUc2dzA0ZnhUM0RoR1E2?=
 =?utf-8?B?WXF2RHV6UC82bWg0ZzBCOVF6bCtCdVhZV2JkVklJUEtibWVnbHlFY1RGb085?=
 =?utf-8?B?ZlNjbDA2Z2p1OTJJNkxrV254MjlqblpyZVpkUHhTUXRVaHZ4VEh3VVF1bnRH?=
 =?utf-8?B?NTFJdG5JS01jdG82NHRIa216bHA2YTN2RVA3akZwb29OUjM1ZXBmb2lCeHBF?=
 =?utf-8?B?S3o4Zm5BUHZlMzNmUnJvYmxXQnFDR29Tci9FSkxOYU53ZzVQSXM4MEN5aktv?=
 =?utf-8?B?R3BIYmJWTDJIY3hqMVBvc0pDaGNMYVFOYktra3dzZFdoM0ZRTGV0LzVIZ3NC?=
 =?utf-8?B?dFFRYjgxZlBpT1RETVB1YUdXQkVKSXNiUThQenFNZUJveDZUTlc5VUN6L1Fr?=
 =?utf-8?B?bmZVZkRyQytJRk1wTUx4bG5Hc1BLczhyWmdWbk9aNmRyR0pHQjJSR1hMRWc1?=
 =?utf-8?B?V0d0aFhpTEk2blhXSktKdkIwTDZkOC9KbXJURnZCcUM3YmdneGxoSHlNT1Y0?=
 =?utf-8?B?Ym5WdVVIUzNBVmk0WnM0OGpURXFxQTJzREU4WDlIRlduL2J6eTNhL2VSYjl1?=
 =?utf-8?B?RUVqU2IvVkhZUU45ZzF4NElSRXNnSWx5N2h6VkE0bCtrSkxDNEJYZEIvTGVO?=
 =?utf-8?B?ZVlCejhMdDc2TDlLZVR6R1QwR3R6cUswSTd0NGx6TzFoSzFMeEFXRkV0bFlV?=
 =?utf-8?B?ckMzalFwaE5HVG5Mb1NVSmQxRHczeUJWY3JNV2t1OVBsa1FzbFNlUmFhNnJw?=
 =?utf-8?B?aEp1WXZtZzlMSXZNTWlFcXBMR3U3TGpDajg5MTFGcHhIcWRpYXVTQSsyMFI0?=
 =?utf-8?B?ZkFYcFRhL1ZXRzliMXlMNGkzdVJqUXM2M1FoNmVhTTh0KzM2bkJSaGFEMzZv?=
 =?utf-8?Q?CwBo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ffcbb0-97fc-4dd6-4274-08de3367b9a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 19:02:52.2687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WbVijYZtaYTg4oU245SIh3uoiiTWVOQGH7YzK/Tej61suMcfQkaeyfTtz7PW7HrfKxKYJhlhdVAl/EG/EjpU5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6494
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9wZXIsIE1hdHRoZXcg
RCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIERlY2VtYmVy
IDQsIDIwMjUgMTA6MjMNCj4gVG86IFdhbmcsIFggPHgud2FuZ0BpbnRlbC5jb20+DQo+IENjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExpbiwgU2h1aWNoZW5nIDxzaHVpY2hlbmcu
bGluQGludGVsLmNvbT47DQo+IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwuY29tPjsgTmlrdWxh
LCBKYW5pIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+OyBDYXZpdHQsDQo+IEpvbmF0aGFuIDxqb25h
dGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDIvMl0gZHJt
L3hlOiBleHBvc2UgUEFUIHNvZnR3YXJlIGNvbmZpZyB0byBkZWJ1Z2ZzDQo+IA0KPiBPbiBXZWQs
IERlYyAwMywgMjAyNSBhdCAwODozMDoxNFBNIC0wODAwLCBXYW5nLCBYIHdyb3RlOg0KPiA+DQo+
ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBSb3Blciwg
TWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+ID4gU2VudDogV2VkbmVz
ZGF5LCBEZWNlbWJlciAzLCAyMDI1IDE1OjExDQo+ID4gPiBUbzogV2FuZywgWCA8eC53YW5nQGlu
dGVsLmNvbT4NCj4gPiA+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExpbiwg
U2h1aWNoZW5nDQo+ID4gPiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFs
ZXguenVvQGludGVsLmNvbT47IE5pa3VsYSwNCj4gPiA+IEphbmkgPGphbmkubmlrdWxhQGludGVs
LmNvbT47IENhdml0dCwgSm9uYXRoYW4NCj4gPiA+IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29t
Pg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAyLzJdIGRybS94ZTogZXhwb3NlIFBBVCBz
b2Z0d2FyZSBjb25maWcgdG8NCj4gPiA+IGRlYnVnZnMNCj4gPiA+DQo+ID4gPiBPbiBXZWQsIERl
YyAwMywgMjAyNSBhdCAxMDo1Mzo1NVBNICswMDAwLCBYaW4gV2FuZyB3cm90ZToNCj4gPiA+ID4g
VGhlIGV4aXN0aW5nICJwYXQiIGRlYnVnZnMgbm9kZSBkdW1wcyB0aGUgbGl2ZSBQQVQgcmVnaXN0
ZXJzLg0KPiA+ID4gPiBVbmRlciBTUi1JT1YgdGhlIFZGIGNhbm5vdCB0b3VjaCB0aG9zZSByZWdp
c3RlcnMsIHNvIHRoZSBmaWxlDQo+ID4gPiA+IHZhbmlzaGVzIGFuZCB1c2VycyBsb3NlIGFsbCBQ
QVQgdmlzaWJpbGl0eS4gQWRkIGEgVkYtc2FmZQ0KPiA+ID4gPiAicGF0X3N3X2NvbmZpZyIgZW50
cnkgdG8gdGhlIFZGLXNhZmUgZGVidWdmcyBsaXN0LiBJdCBwcmludHMgdGhlDQo+ID4gPiA+IGNh
Y2hlZCBQQVQgdGFibGUgdGhlIGRyaXZlciBwcm9ncmFtbWVkLCByYXRoZXIgdGhhbiBwb2tpbmcg
SFcsIHNvDQo+ID4gPiA+IFBGIGFuZCBWRiBpbnN0YW5jZXMgcHJlc2VudCB0aGUgc2FtZSB2aWV3
Lg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIGxldHMgSUdUIGFuZCBvdGhlciB0b29scyBxdWVyeSB0
aGUgUEFUIGNvbmZpZ3VyYXRpb24gd2l0aG91dA0KPiA+ID4gPiBjYXJyeWluZyBwbGF0Zm9ybS1z
cGVjaWZpYyB0YWJsZXMgb3IgbWlycm9yaW5nIGtlcm5lbCBsb2dpYy4NCj4gPiA+ID4NCj4gPiA+
ID4gdjI6IChKb25hdGhhbikNCj4gPiA+ID4gLSBPbmx5IGFwcGVuZCAiKCogPSByZXNlcnZlZCBl
bnRyeSkiIHRvIHRoZSBQQVQgdGFibGUgaGVhZGVyIG9uIFhlMisNCj4gPiA+ID4gICBwbGF0Zm9y
bXMgd2hlcmUgaXQgYWN0dWFsbHkgYXBwbGllcy4NCj4gPiA+ID4gLSBEZWR1cGxpY2F0ZSB0aGUg
UFRBL0FUUyBtb2RlIHByaW50aW5nIGJ5IGludHJvZHVjaW5nIHRoZSBzbWFsbA0KPiA+ID4gPiAg
IGRybV9wcmludGZfcGF0X21vZGUoKSBoZWxwZXIgbWFjcm8uDQo+ID4gPiA+DQo+ID4gPiA+IHYz
OiAoTWF0dCkNCj4gPiA+ID4gLSBQcmludCBJRFhbWEVfQ0FDSEVfTk9ORV9DT01QUkVTU0lPTl0g
b24gZXZlcnkgWGUyKyBwbGF0Zm9ybSBzbw0KPiB0aGUNCj4gPiA+ID4gICBkdW1wIGFsd2F5cyBy
ZWZsZWN0cyB0aGUgdmFsdWUgdGhlIGRyaXZlciBtaWdodCB1c2UgKGV2ZW4gaWYgaXQgZGVmYXVs
dHMNCj4gPiA+ID4gICB0byAwKSBhbmQgZnV0dXJlIElQIHJldmlzaW9ucyBkb27igJl0IG5lZWQg
ZXh0cmEgY29uZGl0aW9uIHR3ZWFrcy4NCj4gPiA+ID4NCj4gPiA+ID4gdjQ6DQo+ID4gPiA+IC0g
RHJvcCB0aGUgZHJtX3ByaW50Zl9wYXRfbW9kZSBtYWNybyBhbmQgaW50cm9kdWNlIGEgcmVhbCBo
ZWxwZXINCj4gPiA+ID4gICB4ZTJfcGF0X2VudHJ5X2R1bXAoKS4gKEphbmkpDQo+ID4gPiA+IC0g
UmV1c2UgdGhlIGhlbHBlciBhY3Jvc3MgYWxsIFBUQS9BVFMvUEFUIGR1bXBzIGZvciB4ZTIrIGVu
dHJpZXMgdG8ga2VlcA0KPiA+ID4gPiAgIG91dHB1dCBmb3JtYXQgaWRlbnRpY2FsLg0KPiA+ID4g
Pg0KPiA+ID4gPiB2NTogKE1hdHQpDQo+ID4gPiA+IC0gU3BsaXQgdGhlIG9yaWdpbmFsIHBhdGNo
IGludG8gdHdvOiBvbmUgZm9yIHJlZmFjdG9yaW5nIGhlbHBlcnMsIG9uZSBmb3INCj4gPiA+ID4g
ICB0aGUgbmV3IGRlYnVnZnMgZW50cnkuDQo+ID4gPiA+DQo+ID4gPiA+IENDOiBKYW5pIE5pa3Vs
YSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiA+ID4gPiBTdWdnZXN0ZWQtYnk6IE1hdHQgUm9w
ZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFhp
biBXYW5nIDx4LndhbmdAaW50ZWwuY29tPg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogSm9uYXRoYW4g
Q2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9kZWJ1Z2ZzLmMgfCAgMSArDQo+ID4gPiA+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcGF0LmMgICAgICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmggICAgICAgIHwg
IDEgKw0KPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspDQo+ID4gPiA+
DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfZGVidWdmcy5j
DQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2RlYnVnZnMuYw0KPiA+ID4gPiBp
bmRleCA3YzNkZTY1MzkwNDQuLmU0ZjM4YjUxNTBmYyAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X2RlYnVnZnMuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfZGVidWdmcy5jDQo+ID4gPiA+IEBAIC0yMDksNiArMjA5LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0DQo+ID4gPiB2Zl9zYWZlX2RlYnVnZnNfbGlz
dFtdID0gew0KPiA+ID4gPiAgCXsgImRlZmF1bHRfbHJjX3ZjcyIsIC5zaG93ID0geGVfZ3RfZGVi
dWdmc19zaG93X3dpdGhfcnBtLCAuZGF0YQ0KPiA+ID4gPiA9DQo+ID4gPiB2Y3NfZGVmYXVsdF9s
cmMgfSwNCj4gPiA+ID4gIAl7ICJkZWZhdWx0X2xyY192ZWNzIiwgLnNob3cgPSB4ZV9ndF9kZWJ1
Z2ZzX3Nob3dfd2l0aF9ycG0sIC5kYXRhDQo+ID4gPiA+ID0NCj4gPiA+IHZlY3NfZGVmYXVsdF9s
cmMgfSwNCj4gPiA+ID4gIAl7ICJod2NvbmZpZyIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaG93
X3dpdGhfcnBtLCAuZGF0YSA9DQo+ID4gPiBod2NvbmZpZw0KPiA+ID4gPiB9LA0KPiA+ID4gPiAr
CXsgInBhdF9zd19jb25maWciLCAuc2hvdyA9IHhlX2d0X2RlYnVnZnNfc2ltcGxlX3Nob3csIC5k
YXRhID0NCj4gPiA+ID4gK3hlX3BhdF9kdW1wX3N3X2NvbmZpZyB9LA0KPiA+ID4gPiAgfTsNCj4g
PiA+ID4NCj4gPiA+ID4gIC8qIGV2ZXJ5dGhpbmcgZWxzZSBzaG91bGQgYmUgYWRkZWQgaGVyZSAq
LyBkaWZmIC0tZ2l0DQo+ID4gPiA+IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jIGluZGV4DQo+ID4gPiA+IGI4MTQ2NzI0YTYwZS4uMjFm
MDUzYzQxODk5IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0
LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jDQo+ID4gPiA+IEBA
IC01ODEsMyArNTgxLDYyIEBAIGludCB4ZV9wYXRfZHVtcChzdHJ1Y3QgeGVfZ3QgKmd0LCBzdHJ1
Y3QNCj4gPiA+ID4gZHJtX3ByaW50ZXIgKnApDQo+ID4gPiA+DQo+ID4gPiA+ICAJcmV0dXJuIHhl
LT5wYXQub3BzLT5kdW1wKGd0LCBwKTsgIH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArLyoqDQo+ID4g
PiA+ICsgKiB4ZV9wYXRfZHVtcF9zd19jb25maWcoKSAtIER1bXAgdGhlIHNvZnR3YXJlLWNvbmZp
Z3VyZWQgR1QgUEFUDQo+ID4gPiA+ICt0YWJsZQ0KPiA+ID4gaW50byBhIGRybSBwcmludGVyLg0K
PiA+ID4gPiArICogQGd0OiB0aGUgJnhlX2d0DQo+ID4gPiA+ICsgKiBAcDogdGhlICZkcm1fcHJp
bnRlcg0KPiA+ID4gPiArICoNCj4gPiA+ID4gKyAqIFJldHVybjogMCBvbiBzdWNjZXNzIG9yIGEg
bmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLg0KPiA+ID4gPiArICovDQo+ID4gPiA+ICtp
bnQgeGVfcGF0X2R1bXBfc3dfY29uZmlnKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCBkcm1fcHJp
bnRlciAqcCkgew0KPiA+ID4gPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3Qp
Ow0KPiA+ID4gPiArCWNoYXIgbGFiZWxbUEFUX0xBQkVMX0xFTl07DQo+ID4gPiA+ICsNCj4gPiA+
ID4gKwlpZiAoIXhlLT5wYXQudGFibGUgfHwgIXhlLT5wYXQubl9lbnRyaWVzKQ0KPiA+ID4gPiAr
CQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlkcm1fcHJpbnRmKHAs
ICJQQVQgdGFibGU6JXNcbiIsIEdSQVBISUNTX1ZFUih4ZSkgPj0gMjAgPyAiICgqID0NCj4gPiA+
IHJlc2VydmVkIGVudHJ5KSIgOiAiIik7DQo+ID4gPiA+ICsJZm9yICh1MzIgaSA9IDA7IGkgPCB4
ZS0+cGF0Lm5fZW50cmllczsgaSsrKSB7DQo+ID4gPiA+ICsJCXUzMiBwYXQgPSB4ZS0+cGF0LnRh
YmxlW2ldLnZhbHVlOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJCWlmIChHUkFQSElDU19WRVIoeGUp
ID49IDIwKSB7DQo+ID4gPg0KPiA+ID4gSSB0aGluayB3ZSdyZSBtaXNzaW5nIGEgIkdSQVBISUNT
X1ZFUngxMDAoeGUpID09IDM1MTEiIGNoZWNrIGF0IHRoZQ0KPiA+ID4gdG9wIG9mIHRoaXMgbGFk
ZGVyIHRoYXQgd291bGQgdXNlIHRoZSB4ZTNwX3hwYyBkdW1waW5nIGZ1bmN0aW9uLg0KPiA+ID4N
Cj4gPiA+IEZvciBjb25zaXN0ZW5jeSB3aXRoIHhlX3BhdF9pbml0X2Vhcmx5KCkncyBsb2dpYywg
eW91IG1pZ2h0IHdhbnQgdG8NCj4gPiA+IG1ha2UgdGhpcyBjb25kaXRpb24gIkdSQVBISUNTX1ZF
Uih4ZSkgPT0gMzAgfHwgR1JBUEhJQ1NfVkVSKHhlKSA9PQ0KPiA+ID4gMjAiIHNvIHRoYXQgYm90
aCBhcmUgdXNpbmcgdGhlIHNhbWUgc2VsZWN0aW9uIGxvZ2ljLg0KPiA+ID4NCj4gPiBJIGhhdmUg
bWFkZSB0aGUgIHhlM3BfeHBjIGR1bXBpbmcgZnVuY3Rpb24gdXNpbmcgdGhlIHNhbWUgZm9ybWF0
IGFzIHRoZQ0KPiB4ZTJfZHVtcCBpbiB0aGUgZmlyc3QgcGF0Y2gsIHNvIGhlcmUgd2UgY291bGQg
anVzdCB1c2UgdGhlICBHUkFQSElDU19WRVIoeGUpID49DQo+IDIwLg0KPiANCj4gT2gsIEkgbWlz
c2VkIHRoYXQgb24gdGhlIGZpcnN0IHBhdGNoLiAgVGhhdCBicmVha3Mgb3VyIGFiaWxpdHkgdG8g
Y29tcGFyZSB0aGUgb3V0cHV0DQo+IG9mIHRoZXNlIGRlYnVnZnMgZGlyZWN0bHkgd2l0aCB0aGUg
YnNwZWMgKHNpbmNlIG5vdyB3ZSdyZSBwcmludGluZyBhbg0KPiB1bmRvY3VtZW50ZWQgQ09NUF9F
TiB2YWx1ZSB0aGF0IGlzbid0IHByZXNlbnQgaW4gdGhlIHNwZWMuICBJIHRoaW5rIGl0IHdvdWxk
IGJlDQo+IGJldHRlciB0byBrZWVwIGEgc2VwYXJhdGUgWFBDIHByaW50aW5nIGZ1bmN0aW9uIHNv
IHRoYXQgd2Ugc3RheSBhbGlnbmVkIHdpdGggdGhlDQo+IHNwZWMgYW5kIGRvbid0IGNvbmZ1c2Ug
cGVvcGxlLg0KPiANCg0KT0sgSSB3aWxsIGFkZCBhbm90aGVyIGhlbHBlciBmb3IgeGUzcF94cGMg
aW50byB0aGUgZmlyc3QgcGF0Y2guIA0KPiANCj4gTWF0dA0KPiANCj4gPg0KPiA+ID4NCj4gPiA+
IE1hdHQNCj4gPiA+DQo+ID4gPiA+ICsJCQl4ZV9wYXRfaW5kZXhfbGFiZWwobGFiZWwsIHNpemVv
ZihsYWJlbCksIGkpOw0KPiA+ID4gPiArCQkJeGUyX3BhdF9lbnRyeV9kdW1wKHAsIGxhYmVsLCBw
YXQsICF4ZS0NCj4gPiA+ID5wYXQudGFibGVbaV0udmFsaWQpOw0KPiA+ID4gPiArCQl9IGVsc2Ug
aWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX01FVEVPUkxBS0UpIHsNCj4gPiA+ID4gKwkJCXhl
bHBnX3BhdF9lbnRyeV9kdW1wKHAsIGksIHBhdCk7DQo+ID4gPiA+ICsJCX0gZWxzZSBpZiAoeGUt
PmluZm8ucGxhdGZvcm0gPT0gWEVfUFZDKSB7DQo+ID4gPiA+ICsJCQl4ZWhwY19wYXRfZW50cnlf
ZHVtcChwLCBpLCBwYXQpOw0KPiA+ID4gPiArCQl9IGVsc2UgaWYgKHhlLT5pbmZvLnBsYXRmb3Jt
ID09IFhFX0RHMiB8fA0KPiA+ID4gR1JBUEhJQ1NfVkVSeDEwMCh4ZSkgPD0gMTIxMCkgew0KPiA+
ID4gPiArCQkJeGVscF9wYXRfZW50cnlfZHVtcChwLCBpLCBwYXQpOw0KPiA+ID4gPiArCQl9IGVs
c2Ugew0KPiA+ID4gPiArCQkJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+ID4gPiArCQl9DQo+ID4g
PiA+ICsJfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsJaWYgKHhlLT5wYXQucGF0X3B0YSkgew0KPiA+
ID4gPiArCQl1MzIgcGF0ID0geGUtPnBhdC5wYXRfcHRhLT52YWx1ZTsNCj4gPiA+ID4gKw0KPiA+
ID4gPiArCQlkcm1fcHJpbnRmKHAsICJQYWdlIFRhYmxlIEFjY2VzczpcbiIpOw0KPiA+ID4gPiAr
CQl4ZTJfcGF0X2VudHJ5X2R1bXAocCwgIlBUQV9NT0RFIiwgcGF0LCBmYWxzZSk7DQo+ID4gPiA+
ICsJfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsJaWYgKHhlLT5wYXQucGF0X2F0cykgew0KPiA+ID4g
PiArCQl1MzIgcGF0ID0geGUtPnBhdC5wYXRfYXRzLT52YWx1ZTsNCj4gPiA+ID4gKw0KPiA+ID4g
PiArCQlkcm1fcHJpbnRmKHAsICJQQ0llIEFUUy9QQVNJRDpcbiIpOw0KPiA+ID4gPiArCQl4ZTJf
cGF0X2VudHJ5X2R1bXAocCwgIlBBVF9BVFMgIiwgcGF0LCBmYWxzZSk7DQo+ID4gPiA+ICsJfQ0K
PiA+ID4gPiArDQo+ID4gPiA+ICsJZHJtX3ByaW50ZihwLCAiQ2FjaGUgTGV2ZWw6XG4iKTsNCj4g
PiA+ID4gKwlkcm1fcHJpbnRmKHAsICJJRFhbWEVfQ0FDSEVfTk9ORV0gPSAlZFxuIiwgeGUtDQo+
ID4gPiA+cGF0LmlkeFtYRV9DQUNIRV9OT05FXSk7DQo+ID4gPiA+ICsJZHJtX3ByaW50ZihwLCAi
SURYW1hFX0NBQ0hFX1dUXSA9ICVkXG4iLCB4ZS0NCj4gPiA+ID5wYXQuaWR4W1hFX0NBQ0hFX1dU
XSk7DQo+ID4gPiA+ICsJZHJtX3ByaW50ZihwLCAiSURYW1hFX0NBQ0hFX1dCXSA9ICVkXG4iLCB4
ZS0NCj4gPiA+ID5wYXQuaWR4W1hFX0NBQ0hFX1dCXSk7DQo+ID4gPiA+ICsJaWYgKEdSQVBISUNT
X1ZFUih4ZSkgPj0gMjApIHsNCj4gPiA+ID4gKwkJZHJtX3ByaW50ZihwLCAiSURYW1hFX0NBQ0hF
X05PTkVfQ09NUFJFU1NJT05dDQo+ID4gPiA9ICVkXG4iLA0KPiA+ID4gPiArCQkJICAgeGUtPnBh
dC5pZHhbWEVfQ0FDSEVfTk9ORV9DT01QUkVTU0lPTl0pOw0KPiA+ID4gPiArCX0NCj4gPiA+ID4g
Kw0KPiA+ID4gPiArCXJldHVybiAwOw0KPiA+ID4gPiArfQ0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5oDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BhdC5oIGluZGV4IGI4NTU5MTIwOTg5ZS4uNTc0OWE0ODhkOWE5DQo+ID4gPiA+IDEwMDY0
NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmgNCj4gPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5oDQo+ID4gPiA+IEBAIC00OSw2ICs0OSw3IEBA
IHZvaWQgeGVfcGF0X2luaXRfZWFybHkoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+ID4gPiB2
b2lkIHhlX3BhdF9pbml0KHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiA+ID4gPg0KPiA+ID4gPiAgaW50
IHhlX3BhdF9kdW1wKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCk7DQo+
ID4gPiA+ICtpbnQgeGVfcGF0X2R1bXBfc3dfY29uZmlnKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVj
dCBkcm1fcHJpbnRlcg0KPiA+ID4gPiArKnApOw0KPiA+ID4gPg0KPiA+ID4gPiAgLyoqDQo+ID4g
PiA+ICAgKiB4ZV9wYXRfaW5kZXhfZ2V0X2NvaF9tb2RlIC0gRXh0cmFjdCB0aGUgY29oZXJlbmN5
IG1vZGUgZm9yIHRoZQ0KPiA+ID4gPiBnaXZlbg0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjQzLjAN
Cj4gPiA+ID4NCj4gPiA+DQo+ID4gPiAtLQ0KPiA+ID4gTWF0dCBSb3Blcg0KPiA+ID4gR3JhcGhp
Y3MgU29mdHdhcmUgRW5naW5lZXINCj4gPiA+IExpbnV4IEdQVSBQbGF0Zm9ybSBFbmFibGVtZW50
DQo+ID4gPiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiANCj4gLS0NCj4gTWF0dCBSb3Blcg0KPiBHcmFw
aGljcyBTb2Z0d2FyZSBFbmdpbmVlcg0KPiBMaW51eCBHUFUgUGxhdGZvcm0gRW5hYmxlbWVudA0K
PiBJbnRlbCBDb3Jwb3JhdGlvbg0K
