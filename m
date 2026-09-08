Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC0BC79FAD
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA23210EAF0;
	Tue,  8 Sep 2026 10:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uopm25V+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289D110EAF0
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788861979; x=1820397979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LowYE4W49fj+fUcz51WE5xyavCDMmO6LKFg84cSzMaI=;
 b=Uopm25V+LuqpHgWzdyJVcpNgfqIBuUB2XVlY/3fJ6AgbY70aF0nUUuLH
 3QEIqIZyX9HHIQDdOwMaGZYmvxOlWf35Pnwn+DYPZ+GXSJCRZF780/Mpo
 9HD4eyXwws2ZCWtk/NLj6JUIpVNzBXW8PEyqJfCr8dfH2uoSaIFuN/9+y
 ayLioS2JKEdBuTCtmhNbONRBmkJaZWIF3u7hlM8EdvXSFqeMgmQFieDkn
 ilRphg8p5WGUqMJplpgqEWv1NmlPZiWVt8F1/WyXkT5BQmRTkDdIXT0Tj
 4QZQ9dDM84XFQ1eh+dvqoRgWp4K/k1vUVr90KnWE9c2uV3+LA3Zkq0j6K w==;
X-CSE-ConnectionGUID: bZKNSDh5TcaisLExaAoASA==
X-CSE-MsgGUID: hrB70ZOrS/OhpIIP95IAeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99920487"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="99920487"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:06:19 -0700
X-CSE-ConnectionGUID: KdI8wkEbSquI2lWQVZ5OWg==
X-CSE-MsgGUID: 9FfMEkgnTNyfCVRi7+VKSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="270455080"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:06:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:06:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 03:06:18 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.17)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwSEh3FC/8R+rNZ+YiwkEwmCrDmZPp+4PSykNOJ1bqsUZL4qjHCtqTVnRWVKwoQOmDzoDGc2fc52Hcnymju0XDxmCm6GWBrsNMTu0836ndmiIG9q12mV1aP0ILGErm8T0uJL1jXe5xbmUUQBixGtQQAj2oLLH9/Sk+VyVpPgtxJC3gnpUFz5XSGvYLiSfbz1GWUNlN1An/wcYje9I+0ooQgsICgIs+HAuNxK085ymYW7cr86zWR+jlHxeoNxPbKLLZqp5IhuzIfex9n9aPNSAGFaX3UtjXTWZ52mjbvXTQ5fyV919apG7NGpreGX8eL07Ix3Yn/7jLySvKk9ye+jFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Q6+oJ8mRtBiWmzZUc11ft8w0C7jcJPSO0SmL6W/yCQ=;
 b=wAofl35XGNZKQKs0lzvKY5p4wvqQWqx7gbB+KlPulM7AfRc086U00zvLo4eSNKnfAg7AH4X20LhWZcr8QHJlMLjXwQEbgPiD5hNqr/YXkzD73U+bByW3X3qxCY+LleGIY/obrBEDwaloXmyEuYznOsvuP6zX2fD8MzppqI6JGeG2JmUUYV4D6RPtR2vONYkznZGDeDVRTBM+4kVYrmgoV8F9MVCfFTiWEuMtLSjm6j+S37Z8gDqLO+8TMn4W9IMI/ziuG5j70Q9/SyABp+HXeg4t8GKJkngIEss9WFOaC8d/Nhk2V0XmsJ8CarM1jcdT+AuWbaOrPs8HZJ74L0k6cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA1PR11MB9827.namprd11.prod.outlook.com (2603:10b6:806:4d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 10:06:17 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 10:06:17 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5 2/4] drm/xe/ggtt: Split GGTT into usable and shareable pools
Date: Tue, 8 Sep 2026 12:06:00 +0200
Message-ID: <20260908100602.1626556-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
References: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::23) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA1PR11MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df47e3b-11c3-4547-f6bc-08df0d90d289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 14gAhqOxGjtxOmvebWr89hP64bNpQMTbVC8460LFvF39e+SIR84bcXY/L4q/9G+CcTA/KGwsFmsvNj4hPHbke5XDPREaiToRC/nzY8KJrWAF3KIrWugFOv29kWyrmHAsNCVMUnLD4OzBVugVVBtSuNQvbDb2Q8WhV+MzJRRcLvocKIfHGlC8B9nJsTVGVPXs8ZjtuwrCJYQhlNt57nN+yFdJK+CZCGFzhw1dEqaZNBcwg79CkuGr6LoXCxCvTmXpIOuTDbeqeIOWuqtAJ/lKPfHV0NUC9oTyMR3jMG9i1zaXG7DKzndKqotHpeRLH6BSphb0q7SfZv1fd/WWmjUcB3QNEj2RlNnXKrAHBb2TMW3WpN/chFOE2qMguSRK/B4rxrrNt4pkI/8ANwjuU4XejzqBswFa7rAs7zqqMWOhDS99ZgJTiBG+VwMbV/G8ca9oOavzvSL0csPwLU+0K3BR67cYKldEv5R6ak08erAH4My4hifFAGYoLV0iHHpBryuLHDit6gInH6qxiDK3kIG0jdcDjKa8PwGHuWZMgrEjjeLLUqtVRwL97b+TFm19d74k94HlL7j6TuHk1KNr+tBYIje1tfiYwMQRDcGAqTTplRWMK66JiSyLjFcd9cEo9/cOqAjnGDSOy9qMv5VOGT7MlJLHiWqNZmIX1Eh0Vw/CsgU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1dHRGdZMUptZFVSN0lDTzVXUG5yZkNjOFhUay9uMjhHY3RuSzNKVjZSUE9x?=
 =?utf-8?B?bnpodkhMNXNwMWVEeG1OWTVuYkFpOFFxNisxdWw2anZzbEVCazFwNHp6VmVp?=
 =?utf-8?B?L29Qbnc1SW1hTEhWemV2ZElsQnVBTktwUzhKOW53MytrMllOTDVZVEpDbWVT?=
 =?utf-8?B?ZUIvTjhwaFdjOEJQM054Sm9jS0tpSjkyeWJMN29oSXdBWTR4bkwyWmc0Mkd6?=
 =?utf-8?B?Zk43UUM0bDNNOVhicjJEeFJvL2FWYTRLa01KZWxPb3BsRnRIUUsvaklFZXlW?=
 =?utf-8?B?S1ZrV2VQdlhGVVYyT3dIZDFmNmtuZXhSNVZTZEE0eHFXemFFbVBlY2JrTWdM?=
 =?utf-8?B?WE5OSGZvbTllTUU5YzkvUXp3QlBtRDVDeFNNWXhTL1R1elgvemhsTDNoSmdI?=
 =?utf-8?B?WVp2andPMXRsNXpGWDhxR2xuTUF2N3FVMVZQdnRtcWxSSTBIYlNsd3FJZWFm?=
 =?utf-8?B?WlRENWRldUl1V0c3YWxoUVFOTVBDeFVCeU5wMW0vbFptc1Z5MFk4aTVBMDJl?=
 =?utf-8?B?aE55Qm9JbU50TGY2LytWYWRKd0t5NzlvUC9pY0NPZXZTdTJta1BxZ2dPdE5H?=
 =?utf-8?B?ZU5sOGc0TnVCYmhvbVJYNEs3aXFWWTFEWXZVZDNHYVVtNFJFcU1UZWwxemJ2?=
 =?utf-8?B?cWVaQ1Yza3Zlc1ZOUldzY0hVZE1ubmhKTTNKYm4yemxrK1MxMkE1aCtCQzlj?=
 =?utf-8?B?T0ZZUGxyZVg5ZFZvMDliODFZOENHSHNUZVVRNnFOcGNjeFBSWHNCMmQxTFZG?=
 =?utf-8?B?Wmc3bzRFWUt5dTFNT01RalJJd042MVFFb1VwQTFqSHlXTVZNQzFLNGhQL25G?=
 =?utf-8?B?eWhzYkJqZ2FqSk5wZ2I2NGhHWWlYQ2x0OXB4U0FoY3l6SHFEV29UazBmbERi?=
 =?utf-8?B?dDZBNEc2azhjSkFDOG9ndlVUdTM4dmhFQnd0TWFFMjZ6UG5zcmJ4Ujd0UVRx?=
 =?utf-8?B?NTlxL0pzSGNxRnpHL3BjUGlHVHN4RCsrczJCekpYQi9pQnkxY3VjVTJDRmFW?=
 =?utf-8?B?RTJUU3BJd2RWK3Nva0d2clNYZzBlYjFzZGFyb05ITEtRenFpUHA5aFFVVXB5?=
 =?utf-8?B?YnJDYW5mNlg3VGQxcDBsMy9DOHBuZmtwYUQ3QUs4bmlGdEpwNEVFTW1NYmlt?=
 =?utf-8?B?ZXYwRkRja3F6QnFQNXN3ZTNBRktObmZVNENKa2I3cGRpa0pxVFRUNmgxWE5t?=
 =?utf-8?B?bUUwenFvUGRGU09BNzlialh1WjR3a1ZkSnhERXZsdjdUK2lVSnFjNGZTN2VJ?=
 =?utf-8?B?SEt6S0NFdnRYY0VJb2gxMFNVV3FxclNkUUltdFg4ZFhNUHhESEJIdHdsQVBo?=
 =?utf-8?B?RlJGQ0p6TFd0S3puNGVsUm1TeGxMazlCUVhoNWdDVTUzUWJGNXB3dlloSUM0?=
 =?utf-8?B?bkswQk9KZnZHcFhkcm1JeUFIMFpKMDZLcE1ZTlJSSEpRTDBpelAwWFphYXZ5?=
 =?utf-8?B?eDN5Q3gyNzJuRjBNZFZxaG9QZzZOVHB6cmdIVEpCYVlrdGlWRGw5WTViSEdO?=
 =?utf-8?B?U1VKL1VqalJMNzl1M0RtZVMvOUMrY1IrSGtramlBZHVTZi9zbGxIVXlGMTJn?=
 =?utf-8?B?TnhzTTVpWG5hckkyWnZIdjNUQU5RaTgwZ3d3NEhWZHNMMExCQ08xNHROQnhq?=
 =?utf-8?B?bVR3NXVZcGh5eG01bjF1djNwV0tYU0ExRzJ4RWdZWGE1SDdYOTdGMFlYL1pF?=
 =?utf-8?B?T2U4ZGpJWkFMaHZWQmNlTVN2bkFNR2pZYmhmSTlJamNHNENQOFVGMnRaNTRS?=
 =?utf-8?B?MHZTSUlpVXoyWjlmT05YOG5lVmJCWW5mdGlyb2xWaTV1Mm1udTg5V2pYTU9V?=
 =?utf-8?B?TGYyNW5PKzdQSjJkQlIzQTNqNXlXMjNJdGtMTVBRZXBXWUtEcXVIWGp3VDhV?=
 =?utf-8?B?RnU5dmN5bG1GcDR3OHB0UjNGNWdqY3FJRkZXQjBhd1dGL1BadFVoRkZQUnN1?=
 =?utf-8?B?em9JY2pRRmozcytCVG4wdm5kMy9LcC83cVlSTnBMQnd5WGIvOUZwK2JDU0hM?=
 =?utf-8?B?Q2M3dVNadDZjRkJxZFNMMFJiQzJrbVlvb3ZaUUJGRjc0TE9zZEIyWlN0ai9k?=
 =?utf-8?B?WmtCQngvNXZkYXpyb1k0TmlweklmSTZvekVvTmhIWjZUUjRYdjhwN0UyVEh5?=
 =?utf-8?B?M1l2VzJsc1VqREtuOHhFNHFyQS9jcUQvYTBiVzNESUhZSEo3VjlRbkZQam45?=
 =?utf-8?B?eWI3U282UU5oSmg4V0hPMGlkTTJ1VHNGL1JxVTlqeFJLcFFCR25nRzhHNFBR?=
 =?utf-8?B?cEtjdmJ6WXJuTGY0bEowN1V6UDdhaGNlei9PQTFtVmoyMVZDR2xua3YvYnhC?=
 =?utf-8?B?ZjVLOEdXVlJ6TThFTHAvWmxGM1MvWWJaR1lsZlBYemdHMzhVcWM3NXFmNWh6?=
 =?utf-8?Q?d4tCQk/XsDpb1ERA=3D?=
X-Exchange-RoutingPolicyChecked: Fm8xHHEdMJBOLs2ZhyCtBnFwv6keggZ1PQxU2Q6LCXN/+JEKGkZHeRI0wu8JiBafItRDynijufSyJjCdEgyz3zaAt3clVDq77HFCxgGD8+32KOl3wb+fkHhFcbGNj80XPZkly0qpwAZqjFXXLq/qwjWf5a/SxEK/8FIoMQHYxIRozEE5JHnW9DwGirXSa8ZuUSf34hTk7Lsjo7Lplco1qZlnHTktPDB4+AQbMFUsP8Bxci62K7mU83ZE6LdO7tfNWiaE0LlT2hCoubk236YA7YhEEe5ss6cHSieZ3vwUNzkP6dXMpV6dOe+IIomRIX1tA18HBs2kH6C+l20ZWdM8HQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df47e3b-11c3-4547-f6bc-08df0d90d289
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:06:16.9706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAxaxyE4HB5s6LcvyGCC7npMDOWm4OgEPxeMBdxZdUJQL7uI8JgvrbxpuGtirDppaUsRPMRfYQB4JTsPtJuNO2lX5sxQn7T1qsByeXzOdJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9827
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

Driver-owned GGTT allocations and VF provisioning currently use a single
GGTT pool. Split it into a usable pool for driver-owned allocations and a
shareable pool for VF provisioning.

The pools are separate logical ranges and may overlap, but allocations are
limited to the configured size of their corresponding pool. Allocate from
the bottom of the usable pool and from the top of the shareable pool when a
shareable pool is present.

Add separate insertion APIs for the usable and shareable pools.

v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v3:
 - Introduce the full_size struct field instead of the ggtt_accessible_size
   function.
v4:
 - Set the shareable pool size only for SR-IOV PF,
 - Return -ENOSPC instead of asserting when a large BO no longer fits after
   end is clamped to ggtt->size.
v5:
 - Move range initializer rename and full_size parameter here.
 - Use shareable_size and compute the shareable start on demand.
 - Constrain regular allocations to the usable pool.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 166 +++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_ggtt.h |   4 +
 2 files changed, 143 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index c54a4cf967df9..6a59fc20153bf 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -144,8 +144,19 @@ struct xe_ggtt {
 	unsigned int access_count;
 	/** @wq: Dedicated unordered work queue to process node removals */
 	struct workqueue_struct *wq;
+#ifdef CONFIG_PCI_IOV
+	/** @shareable_size: Size of the GGTT range reserved for sharing with VFs */
+	u64 shareable_size;
+#endif
 };
 
+#ifdef CONFIG_PCI_IOV
+static inline u64 ggtt_shareable_start(struct xe_ggtt *ggtt)
+{
+	return ggtt->full_size - ggtt->shareable_size;
+}
+#endif
+
 static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 {
 	u64 pte = XE_PAGE_PRESENT;
@@ -357,17 +368,30 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
+static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
+			     u64 usable_size, u64 shareable_size)
 {
+	struct xe_gt *gt = ggtt->tile->primary_gt;
+
+	xe_gt_assert(gt, full_size);
+	xe_gt_assert(gt, usable_size);
+	xe_gt_assert(gt, usable_size <= full_size);
+	xe_gt_assert(gt, shareable_size <= full_size);
+
 	ggtt->start = start;
-	ggtt->full_size = size;
-	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, 0, size);
+	ggtt->full_size = full_size;
+	ggtt->size = usable_size;
+
+#ifdef CONFIG_PCI_IOV
+	if (shareable_size)
+		ggtt->shareable_size = shareable_size;
+#endif
+	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size);
+	ggtt_init_ranges(ggtt, start, size, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -442,7 +466,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
+	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
+			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
@@ -636,6 +661,11 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
 }
 
+static inline u64 xe_ggtt_bottom(struct xe_ggtt *ggtt)
+{
+	return xe_wopcm_size(tile_to_xe(ggtt->tile));
+}
+
 /**
  * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
@@ -647,24 +677,63 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
  * This function may be called multiple times during recovery, but if
  * @new_start is unchanged from the current base, it's a noop.
  *
- * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TOP.
+ * @new_start should be a value between the GGTT bottom and #GUC_GGTT_TOP.
  */
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 {
 	guard(mutex)(&ggtt->lock);
 
-	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
+	xe_tile_assert(ggtt->tile, new_start >= xe_ggtt_bottom(ggtt));
 	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
+#ifdef CONFIG_PCI_IOV
+	xe_tile_assert(ggtt->tile, ggtt->shareable_size == 0);
+#endif
 
 	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
 	WRITE_ONCE(ggtt->start, new_start);
 }
 
-static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
-				      u32 size, u32 align, u32 mm_flags)
+static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
+					    u32 align, u64 range_start,
+					    u64 range_size, u32 mm_flags)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+	u64 range_end = range_start + range_size;
+
+	lockdep_assert_held(&ggtt->lock);
+
+	if (!range_size || range_end <= range_start)
+		return -EINVAL;
+
+	if (range_end > ggtt->full_size)
+		return -ERANGE;
+
+	if (size > range_size)
+		return -ENOSPC;
+
+	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
+					  range_start, range_end, mm_flags);
+}
+
+/*
+ * When the shareable range is present, allocations start from the bottom
+ * to leave space at the top; otherwise they start from the top.
+ */
+static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
 {
-	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
-					  mm_flags);
+#ifdef CONFIG_PCI_IOV
+	if (ggtt->shareable_size > 0)
+		return DRM_MM_INSERT_LOW;
+#endif
+	return DRM_MM_INSERT_HIGH;
+}
+
+static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+
+	return ggtt_insert_node_in_range_locked(node, size, align, 0,
+						ggtt->size, ggtt_usable_insert_flags(ggtt));
 }
 
 static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
@@ -681,12 +750,12 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
 }
 
 /**
- * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_insert_node() - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt into which the node should be inserted.
  * @size: size of the node
  * @align: alignment constrain of the node
  *
- * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
+ * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
  */
 struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
 {
@@ -698,8 +767,45 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 		return node;
 
 	guard(mutex)(&ggtt->lock);
-	ret = xe_ggtt_insert_node_locked(node, size, align,
-					 DRM_MM_INSERT_HIGH);
+
+	ret = xe_ggtt_insert_node_locked(node, size, align);
+	if (ret) {
+		ggtt_node_fini(node);
+		return ERR_PTR(ret);
+	}
+
+	return node;
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_ggtt_insert_node_shareable() - Insert a new node in the shareable GGTT range
+ * @ggtt: the &xe_ggtt into which the node should be inserted.
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Allocations always start from the top (DRM_MM_INSERT_HIGH).
+ *
+ * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	if (!ggtt->shareable_size)
+		return ERR_PTR(-ENOSPC);
+
+	node = ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
+
+	guard(mutex)(&ggtt->lock);
+
+	ret = ggtt_insert_node_in_range_locked(node, size, align,
+					       ggtt_shareable_start(ggtt),
+					       ggtt->shareable_size,
+					       DRM_MM_INSERT_HIGH);
 	if (ret) {
 		ggtt_node_fini(node);
 		return ERR_PTR(ret);
@@ -707,6 +813,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 
 	return node;
 }
+#endif
 
 /**
  * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
@@ -790,6 +897,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
  *
  * This function allows inserting a GGTT node with a custom transformation function.
  * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ * Allocates from the usable range only.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  */
@@ -810,7 +918,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 		goto err;
 	}
 
-	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
+	ret = xe_ggtt_insert_node_locked(node, size, align);
 	if (ret)
 		goto err_unlock;
 
@@ -832,6 +940,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end, struct drm_exec *exec)
 {
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	u64 alignment = bo->min_align > 0 ? bo->min_align : XE_PAGE_SIZE;
 	u8 tile_id = ggtt->tile->id;
 	int err;
@@ -849,16 +958,16 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
-	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
+	guard(xe_pm_runtime_noresume)(xe);
 
 	bo->ggtt_node[tile_id] = ggtt_node_init(ggtt);
 	if (IS_ERR(bo->ggtt_node[tile_id])) {
 		err = PTR_ERR(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
-		goto out;
+		return err;
 	}
 
-	mutex_lock(&ggtt->lock);
+	guard(mutex)(&ggtt->lock);
 	/*
 	 * When inheriting the initial framebuffer, the framebuffer is
 	 * physically located at VRAM address 0, and usually at GGTT address 0 too.
@@ -877,28 +986,31 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	else
 		end = 0;
 
-	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
+	end = min(end, ggtt->size);
+
+	if (end < start + xe_bo_size(bo)) {
+		ggtt_node_fini(bo->ggtt_node[tile_id]);
+		bo->ggtt_node[tile_id] = NULL;
+		return -ENOSPC;
+	}
 
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
-					  xe_bo_size(bo), alignment, 0, start, end, 0);
+					  xe_bo_size(bo), alignment, 0, start, end,
+					  ggtt_usable_insert_flags(ggtt));
 	if (err) {
 		ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
 	} else {
 		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
-		u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), cache_mode);
+		u16 pat_index = xe_cache_pat_idx(xe, cache_mode);
 		u64 pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
 
 		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
 	}
-	mutex_unlock(&ggtt->lock);
 
 	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
 		xe_ggtt_invalidate(ggtt);
 
-out:
-	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
-
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a695..59b2f02870195 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -24,6 +24,10 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *
 xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
+#ifdef CONFIG_PCI_IOV
+struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
+#endif
 struct xe_ggtt_node *
 xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      struct xe_bo *bo, u64 pte,
-- 
2.34.1

