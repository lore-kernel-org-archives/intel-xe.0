Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ED6C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 18:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7828510E2AF;
	Wed, 12 Aug 2026 18:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/wSVsfv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E0B10E2AF
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 18:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786557760; x=1818093760;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FtG5Xd2Z7T7+mzSdoXaQivOqFqK7r4qxr0Eo4179Z6s=;
 b=i/wSVsfvjYZ9iBA2fhDEpB4gO+iyKLgWEm8LLO0WwlnVW8btNweyBe/F
 wQbvifitNLMdGJEZCttQ0CS0j3+lYLjarfNT//ZfllejCRy7LWyB33rI4
 2tBi4cEO0YWlTLdYFVNjF1AKP3EByeG3RtltjjFPgUk/G+OmcIRWd5pFY
 q05JBcppzKD/3WHQ+A7nWFrseyYH0Mbv2zL/GhssRmYnfGTQYy1Fo4NME
 xWesZoy4G4LCyhZIMVlN7o5uQaAqHdX3z29f111o4/t8dXxZqDOVrUIqy
 fKbinkYddrrHoUIjt8chZAJlvhfaFmZ6qaU2iI7w8fCwo5Rwnih4qJzi4 g==;
X-CSE-ConnectionGUID: 0+dW/mm2QPSdOtOOi6zTMg==
X-CSE-MsgGUID: todqbp1dSSKrVcFwxCOoHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="112665116"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="112665116"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 11:02:39 -0700
X-CSE-ConnectionGUID: L2erLvX3TeeHDn6pFM9HmQ==
X-CSE-MsgGUID: Oh/vkrLNQwK2sSPsjkaruQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="262400172"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 11:02:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 11:02:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 11:02:38 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 11:02:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrgl1d0rCojHTWt/0lS2JrLlRPi71s49CNxIpxCPyeFsbIZZ7Qk2a6L/3HOwL+Vc8J/NAIKXcJluNSU3zSANPR1ndXKD6bSK4+fhd/BGK4F3QrgYPjbRgWpIInKivrg003L4XxxjNhBGeZjL+rKhVuw+1iXZM/3SisMi9mAInubJnGnNy1RfOu7bc3xjd20d4akVtBjCcPqC/L9VvVmAUbNt2d113aiBLql4ZM2vMuV2bK+pXNfsHdPfnRcZYA3kHgkT4MCLUqBoIDqBA1eIaJ0w8MzN5rnAM28tdg2BBWzxGEZt4lfnyoyvUMuDdsGXxbapVS1HZgikp/an5ECkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roYk40rtQbqKdqrUZbc1vfOlHXkT0fYdPYNk7QWUFHc=;
 b=k38ylZd3K+npxfVwgOq6vBTrsPPL6bvBsMJ/IQnM9aibyF7ZLyQLOBc72ZcEfgrw4Llx6wGkXM0n9GWJsv1Z0SVOSySQ1wfiYa+tI+DwJjwa9+pygbZOYLuzQxc6HWyO0DYFtkkg6/NFPfS5GQyRt28Hagquj+IQOzjWXW02wVmBZK+l5M3b4dIxtcy9Lg6KSdOsjJshE/5uJdaPb7VtBB6DAMj0W4sX7gtfsW5Or83HJBkup7mIdwyDnPdglzIaePR9VPM6ky/n+nFi7WuVfzxvt9I0l6WrQiyf93BJlqrmc1imfduDEamnJcpoeeeYiqExb9ho/vPhQIUJKfFRKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4877.namprd11.prod.outlook.com (2603:10b6:a03:2d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 18:02:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0315.008; Wed, 12 Aug 2026
 18:02:35 +0000
Date: Wed, 12 Aug 2026 11:02:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/pcode: Improve PCODE logging using xe_log
 helper
Message-ID: <any1OAOi9Xriy+lB@soc-5CG1426VCC.clients.intel.com>
References: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
 <20260812123449.239480-7-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260812123449.239480-7-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MW4PR04CA0333.namprd04.prod.outlook.com
 (2603:10b6:303:8a::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4877:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e54b30-8a10-4657-c3ce-08def89be37e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|6133799003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: uZdSkyTstI4i2LLZeka4x51M9IaQAFR5nZzth1SWfc3V8iaKzQCuia31FET0dlT+qmiwHfKvEU2X51gzngsyH9zOMiKy0zomX3yBgj6DdbTAjwfi8jLM4Sa4gNo/yoDwZZcv1EezPp6twCy6WBA/fqSTtrHkkeN0kqTfio9D8HbNSHbF+QKu95QK9TMI6u4lOBl0yr3Tq2JC8EvuXX+5/pXUU9+x6pCWsX6IX/4cMRWdgV4o8mC8lkJHCr87vOHqu7oXwjr2eWt6wTuwmVrfbrNhriVGtw3lpMYfKFCycFFMCQ2vgOQRcOsa0rqNfw6bn84KLCetzk9J3o4GFe4Zkr2z1fv29hnKDalB3CxF0nLo0KDXnDl+Tn3oFzBIfBgyE90tAVYx0Q0gQJTIkh7384GZ/Ss3Xp8jLcsYM30Fab64TRCxw3zSKCZbNSfIT28WnxBpHsk2FgIGJDnCqrQcBTUCzCkGNvFlzX5zucU+cZ1V26tEANck2mvCKNn7ISeXpPZ/pUB9iZKYA06FJw1it+Y+1tkpiMvpupyq/u0Shq/tbYqGm0lV9cviG++BgZh5HEevFAqXb2A6Xw2zBeieMQ1oBdUngiazXsPhBXGFznQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(10067099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWVFRTh0anM5NUhXajkxRjh1WGlwYjkyNEZsK1dTS2FqS2dJSzloZXZyNkp5?=
 =?utf-8?B?TGtNMzlQNkZjSzRnVmoreWFyNUhHZUluQXJVdWp5dllIcEdzZWlMSG5Wcjl0?=
 =?utf-8?B?dlgyVHMxLzgvbGJMc2djODhmNnd6dEc1RHFXM3ZVek9DVDJuUEQyd0M0cHFX?=
 =?utf-8?B?cVd4WXhQbFd3RVBvaUZjRGtiZ1pVTVF4MXlBdWVBOTNxVGZXNDZya083WG1j?=
 =?utf-8?B?WDU2OE9Dc1VzZUM3QWVDNVhiazhOT1hWSW02bDM5SzV4SWRweFJyc2NPVy9W?=
 =?utf-8?B?NDB6c29LSkNodVVlWCtrb1RWY044OWNleVJVZko0WWxmZUJYa0c4MlpndEJ3?=
 =?utf-8?B?OE5KWHZ6M2hkMnpKTzNnM1o5R1ZMSXBOYk9VVm0reStrZXphWHlhNjRyazVt?=
 =?utf-8?B?MkRHSHZkOENENWRJNXZqS0ZjTXZkMVRLdW9FZlNjT0NHWUhQbmRDdXRIdnBZ?=
 =?utf-8?B?MWZCZCt1TTY4R0RyZU9FQWcycExZb3pGY082Qm93ektSR2JUdW1ZSTdBQk85?=
 =?utf-8?B?cnhCczlseElkOFBUVW1LbjEyaDkvdlFBQTNlOVlzV01FTnBSTHJFTlplQmgw?=
 =?utf-8?B?SzdxckZrcDR0V0RPMklVdWRYUEZHb1ZoR1VnQ2hvVXFUbEc4UnVhcGlhWDYz?=
 =?utf-8?B?OVVVTkN0ZTZFS2NmOEZjSytMM0twZituOTlncmdXZUJXcEhHRkR2V2JnN0dV?=
 =?utf-8?B?dVlzRGhzMFdUUEJoZHJtRW51akdBTUFmNENEMlM4ekRXdUNrQk9sTEtHY3Zq?=
 =?utf-8?B?VnkxZHlEbUpaSklOdENMVXNEZjRTY1hLamhKaytsb3FFbUJyREJ4LzJFU3JG?=
 =?utf-8?B?YWR0TWkzZGp2c1BML3oyQ3R2RDVtUUJ2TWozcmtzV3dqSXZyTHI5T3J6VzNH?=
 =?utf-8?B?TWRGcnFJNDR1WUVxTjcxN1NXMTBXcFBMTm8zSGtmYWQ4Tmlib2F5ZStnN0Jj?=
 =?utf-8?B?QkdxN0NRSGZTQzlqeGZRRGlWRlplRU02akU1Yi9NeVU1SUt3VG1wd2JWU05k?=
 =?utf-8?B?T0tQTmhlekxJYUJpdndhYm9zRWJjS1ZpQXJzWXU1QVlDY3diZHJRUVRHMlpx?=
 =?utf-8?B?QVpwb2ZHNkNMcUtmcTZ6ZnEzNVVNVnJTYjE4cUN1R0Y0RkpYSGJsMDVrWWN6?=
 =?utf-8?B?TlhWNnVpbUpGd1J4dEJLS0pmT1dxNmpCZk1XUFkwRWVNV2hjQWY2dXdocVM0?=
 =?utf-8?B?c3AxTC9PYUR1aE8yS0ZTUzVwdXAvTTROSDluUDJ4NnFUM2lzSHZ4QzI3cGli?=
 =?utf-8?B?ZGU1cEg4UTArRGZkUGMyeGFJUkFaRzYwWDFsN2hBVmE1NENDTGFWRkVNbUZi?=
 =?utf-8?B?QWI1bCtnUGhtNmN2R25JUVpGMUtBWENXazZEVUh0OXh0WjE5azRtZFNsQnRD?=
 =?utf-8?B?VkRSRjIyWHF2bDZnTE51aFRwSVE4a0lkdzlMck1HT3R3Z0llN1Y3L1FpYmhC?=
 =?utf-8?B?aVpXYVpoZ2ZxNk1jSEVjUDUyK2k5d0R1ZFZMY1p0SHdrazg3MEljVjVEZEpV?=
 =?utf-8?B?VXY2eHRGNG1sUEorVW0vSHJ3WkhjUmxra2lESlZsdEJGT3k1UXhHUWI4Lzg3?=
 =?utf-8?B?TWlUdkJxdTV0VHdGYWw4Q0ZjTnpoeHlZYWRBdVFXUDVSV3ozRUJWQ2poT003?=
 =?utf-8?B?VEJDQjU1Sjgyazh6dVpvNW9aeU5remFVdEhCWDJodUNHczIxY3IyZHhEdTFy?=
 =?utf-8?B?eUdodnArNEFCeFlya2crWFVxSEJ6VnM1NWpLVDZWYmZreDJiL1VPNkkrbWtS?=
 =?utf-8?B?U1BpTE5Ndm5NSDdURWRZVmV5OVRwS016Q0lyT0RMZFB1dzhpYW5pbWljdjho?=
 =?utf-8?B?dklkMWZ0ajJMMVdxaFMvMXZPVXg4ekZ2ZVZ3czBTYUwyT1NRR1ZWMHl4S1l4?=
 =?utf-8?B?VXJYSlN6dUZTdVNtUHRqdFB6RU9UYkpHY1BXYTFNYnNxQmR5ZXhlRFVweldl?=
 =?utf-8?B?UkVlYmQwZnd1UzdwVG16eUgyWW1lazF2cEM5YUJIOGg2cVdIVEFTWXdIeDZo?=
 =?utf-8?B?cHc1cWtnVEMxTGwxV0Q3MXFMZ2Exdm5TcS9pd0hyRlpUMUN5UnExZzdNR0NT?=
 =?utf-8?B?aVhsYURiNU1DdkdvOHZrVlRmYWtLKzRZekJXM2FYOXFhQWNXQ2hGZFVLbGR1?=
 =?utf-8?B?eERTbXJaUXV4YjhESUYvVzllaDV1TjhPZ2trNEhDZXlPMnJjRVB1YkJPaXZP?=
 =?utf-8?B?b3crUDk5UDhQNGs4Y2lqN2ExeG5qb1VEUjM4bi9mWTZnQU5DNmZ6THo2WHNh?=
 =?utf-8?B?a1VBcXZnYlh6dmF6TlFGN1ROcTEvRXUzVmZrczFTZzU5TlhmekF2bllnQXdi?=
 =?utf-8?B?MzBvOGQ1T3lQVTFHanlZZUl4WHgzWFduVUx2K2VsdTdiVkVBelZRazBoWFcv?=
 =?utf-8?Q?rUi1Mw8wVKixslKySBywwcktv//IVZZG8vt1n?=
X-Exchange-RoutingPolicyChecked: Orj+C5Lg5VAgTDk1PIjuspzM4S3SSu+oNX77ZatzXjyUoKa95A/A5bJ6ZHasEBJcpxplcO+BfbSUauU6Hbj3vz2YpVCInvDlc/BTQOBW57tM4UUgFQOpjVmC6AcRrNxl1rF2OHCVBnJccOQ8qNIJi4gHGB1EjV0iby6MUN1B8iU7pu9bYEj8lXqi2PjRead8ki1idUoupSLNWzxK4HCnOIlG7EdFPsoXqTaAvibHeMHeDiwTK0W0SCmNEab28xp/rx+jf+Onh/mI+8zHX7AAiwThsRjmCZy+uftfEZWep2KG2xEu/p7/s5DxPe2MkWUwCZS5cimGkkXE6zH8oP6dTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e54b30-8a10-4657-c3ce-08def89be37e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 18:02:35.6789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bTmCpzK48wxmqnFlrVqoJo+6v9GcC39VGM8x0QLjGSt53MsWHesjx5YyymS1h5ipLRQ6ZDLl2HIb6xz0bztefqE4N8VUjIsp2oklpOsT40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4877
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

On Wed, Aug 12, 2026 at 06:04:52PM +0530, Mallesh Koujalagi wrote:
>Use xe_log helper for PCODE errors instead of drm_err(). This
>adds PCODE component tag, making issues easier to detect and
>track with automated tools.
>
>Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>---
>v2:
>- s/pcode/PCODE. (Michal)
>- Drop PCODE in xe_log_err.
>---
> drivers/gpu/drm/xe/xe_pcode.c | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>index ccc3bdeed6bb..c69440ea477b 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.c
>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>@@ -14,6 +14,7 @@
> #include "regs/xe_pmt.h"
> #include "xe_assert.h"
> #include "xe_device.h"
>+#include "xe_log.h"
> #include "xe_mmio.h"
> #include "xe_pcode_api.h"
> #include "xe_pm.h"
>@@ -219,8 +220,8 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
> 	 * requests, and for any quirks of the PCODE firmware that delays
> 	 * the request completion.
> 	 */
>-	drm_err(&tile_to_xe(tile)->drm,
>-		"PCODE timeout, retrying with preemption disabled\n");
>+	xe_log_err(tile, PCODE, -ETIMEDOUT,
>+		   "Timeout, retrying with preemption disabled\n");
> 	preempt_disable();
> 	ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
> 				true, 50 * 1000, true);

After this code does a retry, there can still be a failure which the 
current code does not log. I think we should use an xe_log_err after the 
retry fails rather than the above. Here's what I mean:

https://patchwork.freedesktop.org/patch/745830/?series=172039&rev=1

Thanks,
Umesh


>@@ -320,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
> 		mutex_unlock(&tile->pcode.lock);
>
> 	if (ret)
>-		drm_err(&xe->drm,
>-			"PCODE initialization timedout after: 3 min\n");
>+		xe_log_err(xe, PCODE, ret,
>+			   "Initialization timedout after: 3 min\n");
>
> 	return ret;
> }
>-- 
>2.48.1
>
