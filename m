Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803C6C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 12:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F2910E078;
	Thu,  9 Jul 2026 12:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nr4reAeR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF26210E078
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 12:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783601513; x=1815137513;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x7jLryH8FcOIsdofhMly+t+9BQ7ViAKEF58Pw6d3pZY=;
 b=Nr4reAeRGjSdFxGEzHyMyJnIFqWGt3q0++9hCx+fX1tu/u+MPh5vIo6e
 yWx5w+HVlC6rBCGoXHdkOlFfLIcK+XS9sdb45Vxbasu0SvWc7+A2v20RU
 HLdFfEHr1MCvUgeJgrUK161dY9E3Z0+EElHbTe0C7K31TAxaJ/HUMNRo0
 WpZSO7aRlYlqbUSDuKr9VgjuR+Vt8qCOrJSU80mAk91uicnSjrZIa9u9V
 udcJz+0OC449bLgaCLG2CvPiXr+GyT3YyHVMJzglbbSHuwgRtpqqogS1G
 yhnu0SyKgWH+b+6CNoMHcZyvd6f6ElGe8xp0TffJ8nVR+q9jweUMIgncU Q==;
X-CSE-ConnectionGUID: 53O8QVISQK+Ns9AyUmpdIA==
X-CSE-MsgGUID: 8OJjP2zlSN6jG2H6qKsWDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87965073"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87965073"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 05:51:53 -0700
X-CSE-ConnectionGUID: PIxRT1TDR6SiQyVkDM3pHg==
X-CSE-MsgGUID: tNYdX5GIRMqykOnLezBbLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="252832672"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 05:51:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 05:51:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 05:51:51 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 05:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnGWusWFWGCcOUdTF/n+eHUA376gEDmBT7XfQmJRRKyO4mJwHSKIbwma4KLIMJH32TVxMWouX9v426M1E9qdXql782o7NAFo7Y5QJxyWRtXX9EB5Qhr8pDARiHrLxTkbmFE9iHz2pzwRAbkV5dkro5ZsaFm5mT1+WDYwz6vFJPLSh3t97EVwJeVncax1nKVe3XAGMT+BhzqSA+jDv0ru+2A9nhYLJl9pOeyHCcbABZ21ZIyNcl054Z8TySR7LkfuJht+T4CziN6dubvpTKLVnAh/7nymdje+sWSuLT/+EQsEwYtwARavIn3k607+kjrVjVcCaIU5FvayoYXK433O7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DV/D6ht0sJQgSmckLM/RoM2saw+XV1DL6MlnQrrf2/U=;
 b=MmE9cj/oOgiVyJtjOJfJgIca+izsvJ+rbk8yqXaGiWDsNn7BgA3nvoZJ7vM+5ZwFKPgcZbXIGOBzvaFKdc1rAuiI39cN2flYVKDoqT8i4FGXrndSAF2HikqkDQaFfRdiYGESNlawRCyazgs7PeX8mIBpB9/qsuLTf2E3rajQ/nHM8KFqKBtj9uJl3Ecd0o1aZuXqLaBQUt902vYJnmeloXiRBZnjIc2CovOY0iruUo5DtMMejm3tue1Pod9vgzsJMizUxLGLf6wLTbunbiclONI2/v36nWfOc54tmcgVWElvr6TFeHki+616HTf5m+ryJZhWd0G4m/6iXW3yg/ikIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14)
 by BL1PR11MB6004.namprd11.prod.outlook.com (2603:10b6:208:390::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 12:51:43 +0000
Received: from MN6PR11MB8148.namprd11.prod.outlook.com
 ([fe80::76f9:6cc3:f4f3:6c86]) by MN6PR11MB8148.namprd11.prod.outlook.com
 ([fe80::76f9:6cc3:f4f3:6c86%5]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 12:51:42 +0000
Date: Thu, 9 Jul 2026 14:51:39 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 04/13] drm/xe/guc: Add string KLV encoding helper
Message-ID: <ak-ZQskDUqiamp2x@nostramo>
References: <20260707220816.677-1-michal.wajdeczko@intel.com>
 <20260707220816.677-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707220816.677-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To MN6PR11MB8148.namprd11.prod.outlook.com
 (2603:10b6:208:472::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8148:EE_|BL1PR11MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: b819dc6f-3f98-46df-b288-08deddb8d382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: OZ2p+VM3oj5USqOOXedZUmUNYxJvr+8OkkcKVJDkL3h2Rb+AFBV7o1BWkpRAN7LwBDOoc5zRd5imhaesPiF725mJmkA8FGQ1DFuNNiD0V56mrRRfYZUmIbhluEbJuJ8rG/HVAwv4/evaJodReQDcTIEomhgoHxDEC3LGB0L1IBmOobilW54bFUTuwBUUtzYZadRBjLvEJueS5PpMBvmeFoYGc5De10wdIrlxefpzGCec25WpZbV3SCu2F9otHm5+OAEnNtNGZB/KXn2U/vba5qwFCUi6qqZBaAvHApBSCTqn70vECpm60B9mE99XUJjhS18KU//Anhwg2Erx6n9dxesYMyPVXc31XoEfcB0auNkQat/AlbpONN2NTfz02pO0wbJo6uqbdRcD5NKCbxpcWUWFhl6eq9pmvt/PDiIo7X7FakGGRpYOyrkhHQX7o4IhVNJv6CnhlLTF3Z+ajB+432pbm9e103Xm4FDXTtKkk0AdfHfKXyVQfG8ksmh0ZoOCW//QDE8Qy/sxt3691I5/0C09oYqnR3FPVyJ5lvrRG8ODtuajLIpSFkpXCYe1bvkX5nOSCKpmAFVJnoAH0ltLz+nAWu8B/MczBFtZtnE4XjGnVvciya1unzTsHfuWjOav9z012W1PpykgUKffjcHRBEwECrw3WIDsbwlUYY+UirI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8148.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmJFK20xZHkzd1pGc3NLYjhYbDU3dHUwc2xTbkdlTVg5bGprU0ppY29qdXIr?=
 =?utf-8?B?b2xhN09tc2lFN1pHV0J0RHFVb0VNQjQ5bFFCOC9uRVBvTE16TzZwaG1yc2FX?=
 =?utf-8?B?K1VTTDBHOCtBSVlFMXc5eERzYlVja1YwMHA5UlpzYkJWWVIybDN5ejc0SnF1?=
 =?utf-8?B?RHdCVDVKN0ZVUXFXQTVmajNpQWVoL0gxTDBSeUtNZU9UM2w3Q212anhaNUZL?=
 =?utf-8?B?R2F0UEIrQzNTWERnQVFCVG9QZnZoREp3bVFWNGw4Y2pjd2ZpcFAxS0VMQy9D?=
 =?utf-8?B?aGt3M2FPaUkrVTdLWDY0aHBRdDhnNTd0cHZhdHl4NFNnYnRkUC9VeVBSK3JI?=
 =?utf-8?B?cXZrdldLNHoyWTdYMUFtU09UeUNKbGdzVGFCTExzaDk0U1FwUkJMTUFuVzM2?=
 =?utf-8?B?TzhmZVFsL3U3MktKWmNyMGJIdVBhekxTQnNmWFBaNnEydzlyU1dIZXRJZTh0?=
 =?utf-8?B?dGpYTk5PR1JyUWNsZnptdjJoOXVVcWJXK0NuVEtVZTIxeVZFRk8zTEo0T2w0?=
 =?utf-8?B?RTBqSDJZeUgvWDZNT3M1eVJseTdPelZIYXpqQ1ZwLzltNUl5UDRxZmx5Z3Rr?=
 =?utf-8?B?OFdlLzQ1WnVIb2g3RmR5SVc1RFplcUg5SmlUM0FWNDRueUxlVlZkcVNUN0hW?=
 =?utf-8?B?SHhoMGNNMjNON3R4ZlkzM3o0bWl0TTFsV28xMGx1NEFORlhyUzZtV01CU2Zq?=
 =?utf-8?B?VG45MjZpc0thVUFtOGtHNlZlZkhMY0taajhhbVJsZzV1SWxHd2xXVG9QSUJi?=
 =?utf-8?B?aGRBVUdIdUZkT00wazdUbFFpdytZbGYwZmhyMzZTdDl1WG14dVNMQUd1WTRI?=
 =?utf-8?B?T3dxd0k2bUJubnBJMUJyYUpoczllNW9UbHlNaTNWKzlERHVzclJMMklPNHpp?=
 =?utf-8?B?cEdDVmxrMVJDalBqNk83L0RkZ2V5WHJUWHN3Um03UDJiaHlEU0szYm9aS3RG?=
 =?utf-8?B?cGdEV21RZXR3VlR1aGdkVUtEK1QrbmhDSldxVVJwWFhTMlJrNGE3OUJWZkpX?=
 =?utf-8?B?UC9JN1c3d1kzOFVDdnNiOTdDWkZmQm1CcFlSdWlXd1ZoV282dVZIbW9sMDJH?=
 =?utf-8?B?UkthdEtiVGNhblY5U2xNMDJxTExFUEVyeHQyc2JaN2FUQWloT1h4cWoxNlIr?=
 =?utf-8?B?MVNnbXBDU21zdGozY1ZTK1loNE1SVTVQQ2lPWVdEaHVGNnJ0cktOYUhlSC9n?=
 =?utf-8?B?ckRiUFpEZ0xkdzZhSUtGcnk0dkllN3RHQTVrSUVDd293a3dLd3UyWEpXMHZT?=
 =?utf-8?B?dy9BZUIyMnNRdXJGZE05ODlSK0JXajVaZWtmNE5LZEtkUGo2YnJRZ3d6NFJq?=
 =?utf-8?B?cWRucFRLVDZqaHg3WU00dEU2RkhaMW9xNkdMbmdUdHZHbzFJZzNBd0FEMm4z?=
 =?utf-8?B?ckt4K01SRzFnRGtHZ0VVc08wM1BlNEVrZVZRaGZBL3RadUVSbG50N0ovOXcr?=
 =?utf-8?B?VG4yV01ZdXhIdldGUlJWTlJvcis1UzV1bEJrNlJyaEtQR0FNMDJnZlVORDN0?=
 =?utf-8?B?SW93d29Bd1lET3dnSHF2eXhWY2pZbmljZnBiVFFFNW9NbHpLeXo1WkI5azI2?=
 =?utf-8?B?VlU3eEpSajlMTEJ5cnJQeWlJTzBsZU54NjErU3JjNDRBdHlzdjhDckRHSUh2?=
 =?utf-8?B?RnFRMHVXTnIzVXA4OWdITTJML2FvMzN5YjVPWnNCOUNjbkcyeTdLZENMNytO?=
 =?utf-8?B?cGZhSWw0bnM1czM2TVdXY2wycUE5WUlvZzNkK0RjUUdQRmdDMzY5OU9Cb2E1?=
 =?utf-8?B?aUQvNDN1Y1AyNFJ3VzNPOEptVi9yMy9Nci9WazVZYmQzOFpkYUphaGNJU2o1?=
 =?utf-8?B?OTlCQ0hyMndicHhIS3lWNGJlQWkyR3Frc0lmYmdiL1R4T204WG1xaVhQRjVJ?=
 =?utf-8?B?eDNyUVpBUjJuN3QrTzR6Yk5NcVVKYnJncU1NZjBNUjVnRXhMVEJJRFhLS3dN?=
 =?utf-8?B?bEw3WStPYTNFek92YnkrdUdFOFZ4NmNhYlg4UUJDdHRQcVUvdUFrR3hJOGZh?=
 =?utf-8?B?UTQ2cWtHUmVHK0UvcFN5VU5WMVJyZ2F5SzY5SHBtaUhBVFR2N1V3OHRGOUpq?=
 =?utf-8?B?UXFUVnpLdDMwaUVVWnoyL1lpWjJIaVRKU09DNDVxck9HRm9OQXBPdGd0UU8x?=
 =?utf-8?B?R0UrNG5vdG5rYTI1Q1MyQWVrdCtIbTBEMWdQTzR6T0lDM0RhNy8ra2tjZzUz?=
 =?utf-8?B?dkVIUE9BemV5aTlhUHhndHllb3hmVU9hWGI0UE5SeVZLK0k4RlUyZzBZSXdz?=
 =?utf-8?B?aDg4TUxPemdTYUxjOXc2WmlialpRK0VNUktnVWdYcUkwNWNvMzNmbkk4VnRL?=
 =?utf-8?B?OFVhdzRKVExaaWxIUjdvc3EwQ1pOZkQyc01PVXFRTXJzd0JUeEpCeVdOMmlT?=
 =?utf-8?Q?6a5Yl6WNOEWBRIcM=3D?=
X-Exchange-RoutingPolicyChecked: mgjOVhBcRU8iTmznxJjQHnpQY1444oQTmrg7YAgPLE8eEpx9Yya7dGqbLuJuO/3ZSsazttg8SSMcU4SiI3PXbua0+HIHumuU+8BZKo/WtILDVBggZ8RI2polajb+Bev2z3dq1mCj8sCPG4YLKXjyVDsy6lE1llTigSn9mrAqxRvhzxSYZaOhoeeii2bk4bew0wYPiowgd7N4QEqMIAfaAywUtwdujxdch4fnqsOYkIbmItRhUeYSCyaYTtTdo7dAJpelqSJQOCOSR4POPg0JYWxRlJCjpp/L/BFjt4udvJFk6Osy755XrqkM3LbcT+7nTeSdEO7ytGrFPIovrFNv3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b819dc6f-3f98-46df-b288-08deddb8d382
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8148.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 12:51:42.7889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJ542YvIXjL9c4LwXsYaPezWhfBP/A12FmCvwkDAEx+JgZtL/Lyf6h2xxJ5fq/eM6NvjevD65/CDny7WXmGkTCvE4s7+OhI28130vKNPDKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6004
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

On Wed, Jul 08, 2026 at 12:08:06AM +0200, Michal Wajdeczko wrote:
> We also plan to encode a text data as KLV. Add helper for that too.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
> v2: don't mix units, report too long string (Michal/Sashiko)
> ---
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 35 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  1 +
>  2 files changed, 36 insertions(+)
