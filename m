Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42612109E535
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 00:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49AA10E13C;
	Thu, 26 Mar 2026 00:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n52gDeb8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9370F10E114
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 00:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774486493; x=1806022493;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gefpDQMp6V1LZm5HVdNhThH83rYGJnCXu6xcqW0ZMQo=;
 b=n52gDeb8GS/DRh9ih1BTgBsDTwdkZAhqpYC4SCbuExNcNcDYfla2snNL
 BHdeXiBOTXsEaQMKrcH9XRKg6ytXL0rU9QSJBDPKvj1E7GC/RK3hGVfDi
 P5yolb8Gfu+iBQikP4ef3dy7DLX0FoSMcLQ8hM7YZjAy8Ilv33ENEjM3X
 UrnhfnPyaUiCU9nje4LBdSPUJIy8/E0zGNhpCXL2glhicq2Uq4dXCt5jk
 OpwHVJSbUZwM6yCq1/VpNJZKa9/DkuecrZUab2FrSJ2i2ae48DCGXp4Ie
 +TtIfKj5aTKkbmvuCRegK9CwzBDulojdCJn5QR8Z1L3SixcLcOK789NpZ g==;
X-CSE-ConnectionGUID: mR9W5gBFRCe1dNHaYtlIQg==
X-CSE-MsgGUID: xN//CVfCSTmapLzQXhBtqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75730757"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75730757"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 17:54:52 -0700
X-CSE-ConnectionGUID: LI875P1CQQiHWfj31GlJ7A==
X-CSE-MsgGUID: HwHb4W28TwK2SDO1K+HcLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="248299690"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 17:54:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 17:54:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 17:54:51 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 17:54:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2m7vR4glbYOo6t98aOKuyfVDj/pJj3PRzclqEzdZdivkmKw0FQWCabt7yEYvuEUp/UO77nwoZS22mQVAyMWJuGwzTT4Blc/ye9INDqDaHsSWJoNMue/nOFiTR3OFEyEYhg/sgPI3VTfH/D9Kea1Jb/xqOdXxat545VkyKd76f5FL/G3PfkbfFaMDnZKrwFb9xxTrOFepef/nQ2kpQYgBFyy56ksnw/k4XYLE+Kg/TxkmglEa9TOlCD0btIn32r2OyukCETnVL+6HpeiGsNeQqTrgDAiqO4Y3wu6Qn89Psv1zaYr+Qwwpz9O3XdImPsXcEv1QyqS8zCFRmaWRMPLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUDLWKdE9S823AHyE0TjtDuKz+3jUArU+MHKltW/hfA=;
 b=Psqh4h7PQy0Ur/DMdrtbcv83/DN2OoT0JwDYxEN5rp3a3CWEgabhpCBe83YyzTxE36og8ELa8ZFpvRB2qNa8m3I9nWG/mE77vmhlnOSi54csjQimNUqL8rmI/SL6eTYEx/ykSaFyR7npfNdFewemDuMJW7staEhXSL2gDqbtn7vwrq35MxejNxRXCRoRdHFiiG8TdfRSxIb9E8as+U7d7rGeQhpTxUjqGWSzPFkXik1a3P0gEPwKdyzfdVNI7qPCdUFqkVptraYi0yVuvnlbdy2aWGTSfzspPssi/n+iQXQ4aG6FbNS9uI6z7AUZnV/URP9B31PRaIa+uc3d9qUTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 00:54:47 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 00:54:47 +0000
Date: Wed, 25 Mar 2026 17:54:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yang, 
 Fei" <fei.yang@intel.com>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Message-ID: <acSD1GErHFPoxMui@gsse-cloud1>
References: <BL3PR11MB636276501728DE765677A4B49A48A@BL3PR11MB6362.namprd11.prod.outlook.com>
 <acL5x1AakzkokUzt@lstrano-desk.jf.intel.com>
 <acL7D7MVf5F32C++@lstrano-desk.jf.intel.com>
 <b253dfa6eb00aaa61f57d7c9694fec3fea68b79f.camel@intel.com>
 <acMf8wr1wfHoRoWE@lstrano-desk.jf.intel.com>
 <702f79d4601bcf9dce128fe47422f24d830ffe6f.camel@intel.com>
 <acRa+iGbsAqAjjYY@gsse-cloud1>
 <e443be46b4f67e7fe5b16ec410428cb88a4b9765.camel@intel.com>
 <acRjzH6641w5deS1@gsse-cloud1>
 <97dd20a9773d9588e2e9d3a32d7fa395cd72c6e0.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97dd20a9773d9588e2e9d3a32d7fa395cd72c6e0.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:303:b9::21) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|IA0PR11MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: caf5a935-df69-4be4-48b9-08de8ad246e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: I9yOhkZu+Q6zPBWWdD/csY8O90xkrKYyecbd3IoUFPJQh70gSEsCLn4hkY57MMG8hFXoXCd9mGh8r39/lvAtM/iGf9U3Jug/2MeKWHWUDGdExZqx7GTs+eFnKZMw03T3Sa8OS+F1f88lrCiHcKfXruwOMNg4CYF1GKbuZW3Fn+NWu7KYaOBUnKAmsfBYl9ISQP/5yDapQR1IAryLh6G296Fc3P+Rsq80aFtZUh98/Nw3Y+c+8gLpWukeReuFQRVMTP4IpMOd2ca/5rdxlx1H96E5zNY0JC3r1dl3P3OarVZPZYDnGePlPvHQ1ZB0JzYTzklV3f1pO1xLU9DgyR/Sl6WvgAyeG4RbudBzghMCOMZ1HgZUAKgGHwZgN8AwoWPlEusEooc2xtLITeDOAuakwfnsZVIX7Sn+kyWfUuWnABLIcbjs6DyvmZtH6A+tLcIjAahX1NIRrm55n9cTirJt4xNxxI2Hgl9bKcjobhATFsBWDp54fQ+KxGPQNjFPFzZW6dQB2rD548IvB/9rKRA5kqUNfkeAgiU0KmSSntCKPVCljoQa2YFSHW6oFwzGPOJ0KjqUcqnkUsLBEbejDfBuswIy6C+voYcqxtS6vvzhg2HuuOkYKVKlJk83d08NK0fACFXhH18oXMPSU90XeStooKGpSCvNHWmnkH4zmnCgDXH74WVMXRUtdMVyqyjkqQS9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHR2MGFNVmdnZjFxQTJyZUtLaWlHei8rYytZb1ZJd3ZBejhCTGE3bGE4U0Y1?=
 =?utf-8?B?dVlXNzdrUEVJbkxCL3pMV3JDNGl6WjNnd3lDYitmUE13R0NmdnlYb0Zyd3R0?=
 =?utf-8?B?VW1sQ0MvdDJYMWxaVjRWNDJHMGdPZkMzdi92dE8rZWw2UFhpd045WGpEenlU?=
 =?utf-8?B?Rmdrb29KcThraUc3MW9YZjZ2M0h5SWlFalNXTk5EbjNnekJIZ1Bsb1NrZE16?=
 =?utf-8?B?MkRkQ3BPYVZXbnRGTEh6Q2JUYjFkcDR3N0lZS29CRVFLMStqY29xL2RadVBW?=
 =?utf-8?B?WWZjcFh1dXhIb1FzS1I4WGdVSkF0OWZsVDR5eWRJN3V6b3RJRGJwN1d3cjNv?=
 =?utf-8?B?WmtFQWo4TEdGdWdJV0tNNXpkU0ZxT2dpZWl6VTYvRjNMTEd6Y1NjTmZobDJE?=
 =?utf-8?B?WlFBZ2h6YmVpUXdQejdZUDdiWWprU0FZcFJ3OC8wZzJuK0RpU2pvdy9BNjlx?=
 =?utf-8?B?cWVvT09aN0NHcUlScDVjUUdWaFQ3OXZrZ1VUMzE5ZHRxSm1RUUpOOS9ybVJN?=
 =?utf-8?B?bnpSRkJyRjR0WHRIcE1QeHVwMThNRW5OOEtGUXBxWFFmS0N4N3Q3dFp0alFO?=
 =?utf-8?B?VUtMY0w2TnMycXpmeEI0WkV4YzE2UkswckJaRG11VmI5cVg2eXZhQkdPUXhX?=
 =?utf-8?B?SGk0TS9RcTBaWk95VkZLTi9SQm5Nc2d0WnVnVEEwbTdXVXFDcktPS052R0Ry?=
 =?utf-8?B?YnB1NUxZZlRBcHAzeGE5b0RSTEl3Sk1jUytNZ0xPMmF2UjM1ZGNzOTFNRnNY?=
 =?utf-8?B?bGdHWUxMUW9TUmZDN0pBelg3L0piR1lJb0xOeU41ZlRBZE5QMU9BYWxLRkl4?=
 =?utf-8?B?a0tsQVVkZitKdGpLRGtMbU01WitEMXh6MGh5Q2xZL2tSR0sxT1ZmMjB1N2JI?=
 =?utf-8?B?aUtjQTJyY2RjNEpDVGgxTitaMmpTZUp1S3lRdi9nZk9nWXZQUDlzOWxhN08y?=
 =?utf-8?B?R2ZTVTRNNHZyU1BPUDlOV2xydTlSTWcvQUtxbzh4NWZPMjVtNWdqc2pDc0ox?=
 =?utf-8?B?dkZqUlFsbDhydkVZNnd0K28zRDJPYVdLOHQzcTBSbnE0eFdUcFJ2K3doNlNP?=
 =?utf-8?B?UFllMENFbmFPMWI1aWRPQzJSTERxTjlyS0N6TjloUm1DeVVyellXNC84eUZo?=
 =?utf-8?B?Zld1Z0tDSGdmQzJESVlMR20zZFJEb3kxdmhFNDAyKzh2VStEa0FXVmcvVmR4?=
 =?utf-8?B?YzhESU5rb2d5SktocnA4bWtIVlZUVWNQQndWLzFMYXdVTWVlMWx3ajJMRHhN?=
 =?utf-8?B?SjhhZGRoZmUvenpUdWthalN5cWhiMjkxNGxuYlZiYVVZSUpoNGx4QVlUeHJH?=
 =?utf-8?B?RTJ0RUM4TmM1cUpyeURpNGtENnlDTHBDMmZlcHdJU2U0eGd5RjBxR09HcUE0?=
 =?utf-8?B?TW1zNDBwSHNrK2JUN09FVTZVQzRVV012c0NEakMveUpwVEJ0d29qOVRJWXBP?=
 =?utf-8?B?MjhpYVlxZC9GdDhtUTB2U2NVRHlBR2JrMlYrdnF2M2Q3dzI5aGI2MFVHODBX?=
 =?utf-8?B?ZEcxNmFWcXNpVU1UK2xWS2ZneDdpbzNUdTZZbytZTW9waEJFeVM1T3hDU1JC?=
 =?utf-8?B?QnVCcjUzTVZqY1pxa1U0MXU2VlpiUEtwbzdueHBNME9OREJ2SGFuZGV3TjQx?=
 =?utf-8?B?VVFhZUhnQW1QWUE1L0dKbGdWVlVtTk53bTNVV3NYLzByOGFOWlNxSmZPUFdQ?=
 =?utf-8?B?UlZkRDJZYkoyMmZZTXlOM0VVaUkvZUlEc21sMWdyRUEyQnNhRlVzK1BlMGFO?=
 =?utf-8?B?L3V3QjUweUZzNFVVZzRYWHYwdENsLytrc2JlNzV4MkpNbUVmL0NrVEpjYmFE?=
 =?utf-8?B?ZTg3eno3WU5iT0UrL0d2SUZNWjJoS3I2eGgyK3dCSFFFTWw2eE4rQ3NCZ2dE?=
 =?utf-8?B?V1VQbG9uWnRDUTRXNmp2Y0tmbE5VQWsxeUMxcjhaUWdGM1Q1c2ovY3dlMnVO?=
 =?utf-8?B?Y09KYnpGNDcwM0p0cWxnbVFOd2drYlY0Ym5wWExiQVd6MFczTUZRMGVkck9u?=
 =?utf-8?B?d0NEN2I4N2JhQUxCQ0ZueFZTR0hPNjVCY1owakdjaFF3Zm5aVDYrSERqVXBO?=
 =?utf-8?B?QnpiS2tMVUFteUV3YzZvdFRIamh4eDU0K2M4STBMVWV3VnBzV0U2ZStLMlBP?=
 =?utf-8?B?OUNCSG5YTFQ1NFd0NmFwMlZCbmdGa3laSGl6WUlpS2p5WTl2MmRqbEJtd1Yx?=
 =?utf-8?B?ZW5rY3RlWThva2ZSMFZxOUFWd0xxdyt1bi9kaU43MUYwalVSdWg0cHhBenpQ?=
 =?utf-8?B?Y2p6OHlMMDV6OGRmZjQrUTlQMlVrdXovM1FnSzBTQzNCODlmSHdxL3AyclE3?=
 =?utf-8?B?V0NiS3hOS2RybDZPWkI4cFhEazlVemJKSTI4bFAyNk0ybzU2VWw4UFBKSzRS?=
 =?utf-8?Q?mL+P9DAmwahOpTCE=3D?=
X-Exchange-RoutingPolicyChecked: kRy4KnyDNbKPOKH4DlqqsYEHGCfJ/Zh6jL5zVmwQUEOKGes9leDGxMaArPdS3zkFmm59W/fF1yEv/tDyPfIG6/B9ih2N0fBlv+qfrtBxvJmKtOx5KQSYhz2SMF406gKBWbUKjXW7sq1/8wN6GODgTz5Y3hA2HbReOBJB9o7KKr3J6pDY1OTOQ7VK6LSpX7Gdp2hQR9luVYfk/4QceUd5XKORnDtTRq2Y4mpoAvgXCX/Hwx8Qh63gQXS8m4qxZDgs8gmYXC0vxjcm7kqK6ATznNlRy9UiBnG/uCAYiFqBI4UNutqTkBSvn8sysLbBBzVRRajXaLSERD8IZwobcO2NpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: caf5a935-df69-4be4-48b9-08de8ad246e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 00:54:47.2105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrbEFWZjgTZNTF/imEb53vs5IwggGOti3lytpuFICYEfecGKuzvrOrNLnGdJVWkok7jgEvrkyxHTWYMifMIeEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

On Wed, Mar 25, 2026 at 04:43:33PM -0600, Summers, Stuart wrote:
> On Wed, 2026-03-25 at 15:38 -0700, Matthew Brost wrote:
> > On Wed, Mar 25, 2026 at 04:25:22PM -0600, Summers, Stuart wrote:
> > > On Wed, 2026-03-25 at 15:00 -0700, Matthew Brost wrote:
> > > > On Wed, Mar 25, 2026 at 12:37:18PM -0600, Summers, Stuart wrote:
> > > > > On Tue, 2026-03-24 at 16:36 -0700, Matthew Brost wrote:
> > > > > > On Tue, Mar 24, 2026 at 03:10:41PM -0600, Summers, Stuart
> > > > > > wrote:
> > > > > > > On Tue, 2026-03-24 at 13:58 -0700, Matthew Brost wrote:
> > > > > > > > On Tue, Mar 24, 2026 at 01:53:27PM -0700, Matthew Brost
> > > > > > > > wrote:
> > > > > > > > > On Tue, Mar 24, 2026 at 02:39:54PM -0600, Yang, Fei
> > > > > > > > > wrote:
> > > > > > > > > > > On Tue, Mar 17, 2026 at 05:28:14PM -0600, Summers,
> > > > > > > > > > > Stuart
> > > > > > > > > > > wrote:
> > > > > > > > > > > > On Tue, 2026-03-17 at 16:21 -0700,
> > > > > > > > > > > > fei.yang@intel.com wrote:
> > > > > > > > > > > > > From: Fei Yang <fei.yang@intel.com>
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Hardware requires the software to poll the
> > > > > > > > > > > > > valid
> > > > > > > > > > > > > bit
> > > > > > > > > > > > > and
> > > > > > > > > > > > > make sure
> > > > > > > > > > > > > it's cleared before issuing a new TLB
> > > > > > > > > > > > > invalidation
> > > > > > > > > > > > > request.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > > > > > > > > > > > > ---
> > > > > > > > > > > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 15
> > > > > > > > > > > > > +++++++++++++++
> > > > > > > > > > > > >  1 file changed, 15 insertions(+)
> > > > > > > > > > > > > 
> > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > > > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > > > > > index ced58f46f846..4c2f87db3167 100644
> > > > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > > > > > @@ -63,6 +63,7 @@ static int
> > > > > > > > > > > > > send_tlb_inval_ggtt(struct
> > > > > > > > > > > > > xe_tlb_inval
> > > > > > > > > > > > > *tlb_inval, u32 seqno)
> > > > > > > > > > > > >         struct xe_guc *guc = tlb_inval-
> > > > > > > > > > > > > >private;
> > > > > > > > > > > > >         struct xe_gt *gt = guc_to_gt(guc);
> > > > > > > > > > > > >         struct xe_device *xe = guc_to_xe(guc);
> > > > > > > > > > > > > +       int ret;
> > > > > > > > > > > > > 
> > > > > > > > > > > > >         /*
> > > > > > > > > > > > >          * Returning -ECANCELED in this
> > > > > > > > > > > > > function is
> > > > > > > > > > > > > squashed at the
> > > > > > > > > > > > > caller and @@ -85,11 +86,25 @@ static int
> > > > > > > > > > > > > send_tlb_inval_ggtt(struct
> > > > > > > > > > > > > xe_tlb_inval *tlb_inval, u32 seqno)
> > > > > > > > > > > > > 
> > > > > > > > > > > > >                 CLASS(xe_force_wake,
> > > > > > > > > > > > > fw_ref)(gt_to_fw(gt),
> > > > > > > > > > > > > XE_FW_GT);
> > > > > > > > > > > > >                 if (xe->info.platform == XE_PVC
> > > > > > > > > > > > > ||
> > > > > > > > > > > > > GRAPHICS_VER(xe)
> > > > > > > > > > > > > > = 20) {
> > > > > > > > > > > > > +                       /* Wait 1-second for
> > > > > > > > > > > > > the
> > > > > > > > > > > > > valid
> > > > > > > > > > > > > bit
> > > > > > > > > > > > > to be
> > > > > > > > > > > > > cleared */
> > > > > > > > > > > > > +                       ret =
> > > > > > > > > > > > > xe_mmio_wait32(mmio,
> > > > > > > > > > > > > PVC_GUC_TLB_INV_DESC0,
> > > > > > > > > > > > > PVC_GUC_TLB_INV_DESC0_VALID,
> > > > > > > > > > > > > +                                            0,
> > > > > > > > > > > > > 1000 *
> > > > > > > > > > > > > +USEC_PER_MSEC,
> > > > > > > > > > > > > NULL, false);
> > > > > > > > > > > > > +                       if (ret) {
> > > > > > > > > > > > > +                               pr_info("TLB
> > > > > > > > > > > > > INVAL
> > > > > > > > > > > > > cancelled due to
> > > > > > > > > > > > > uncleared valid bit\n");
> > > > > > > > > > > > > +                               return -
> > > > > > > > > > > > > ECANCELED;
> > > > > > > > > > > > > +                       }
> > > > > > > > > > > > 
> > > > > > > > > > > > Is there a reason we aren't waiting after the
> > > > > > > > > > > > write
> > > > > > > > > > > > to
> > > > > > > > > > > > make
> > > > > > > > > > > > sure the
> > > > > > > > > > > > invalidation completed? It seems like we should
> > > > > > > > > > > > be
> > > > > > > > > > > > serializing these
> > > > > > > > > > > > and at least making sure hardware completes the
> > > > > > > > > > > > request
> > > > > > > > > > > > rather than
> > > > > > > > > > > > just sending and hoping for the best.
> > > > > > > > > > > 
> > > > > > > > > > > Yes, this is correct—we should after wait issue
> > > > > > > > > > > *if*
> > > > > > > > > > > this
> > > > > > > > > > > code
> > > > > > > > > > > is actually needed.
> > > > > > > > > > 
> > > > > > > > > > No, the issue is that software cannot issue another
> > > > > > > > > > TLB
> > > > > > > > > > invalidation request while the ongoing
> > > > > > > > > > one has not been completed yet. Otherwise the
> > > > > > > > > > hardware
> > > > > > > > > > could
> > > > > > > > > > potentially lockup.
> > > > > > > > > > So we need to make sure the valid bit is cleared
> > > > > > > > > > before
> > > > > > > > > > issuing
> > > > > > > > > > another TLB invalidation request.
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Yes, but we signal the TLB invalidation fence as
> > > > > > > > > complete
> > > > > > > > > without
> > > > > > > > > waiting for the hardware to actually finish. The
> > > > > > > > > locking
> > > > > > > > > here
> > > > > > > > > is
> > > > > > > > > also
> > > > > > > > > incorrect for MMIO-based invalidations, now that I
> > > > > > > > > think
> > > > > > > > > about
> > > > > > > > > it.
> > > > > > > > > What
> > > > > > > > > really needs to happen is:
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Ah, this actually another weird corner where we take down
> > > > > > > > the
> > > > > > > > CTs
> > > > > > > > but
> > > > > > > > GuC is still using the GAM port...
> > > > > > > > 
> > > > > > > > > - In send_tlb_inval_ggtt(), if the MMIO path is taken,
> > > > > > > > > acquire
> > > > > > > > > a
> > > > > > > > > per-GT
> > > > > > > > >   MMIO TLB invalidation lock after obtaining the FW
> > > > > > > > 
> > > > > > > > So maybe 'Wait for the valid bit to clear' here too but
> > > > > > > > this
> > > > > > > > still
> > > > > > > > isn't
> > > > > > > > fully hardend as the GuC could immediately use the GAM
> > > > > > > > port
> > > > > > > > again...
> > > > > > > > 
> > > > > > > > Or perhaps we go straight to my suggestion below - when
> > > > > > > > reloading
> > > > > > > > the
> > > > > > > > GuC issue MMIO GT invalidation...
> > > > > > > 
> > > > > > > I feel like we really should be avoiding these MMIO based
> > > > > > > invalidations
> > > > > > > wherever possible. It creates a lot of race conditions like
> > > > > > > what
> > > > > > > you
> > > > > > > suggested or even parallel invalidation between the GuC and
> > > > > > > KMD
> > > > > > > while
> > > > > > > we're tearing down (KMD lock might not be able to guarantee
> > > > > > > the
> > > > > > > GuC
> > > > > > > isn't still invalidating).
> > > > > > > 
> > > > > > 
> > > > > > My guess is the issue calling xe_managed_bo_reinit_in_vram on
> > > > > > some
> > > > > > BOs -
> > > > > > the GGTT don't get invalidated GuC side and it reloads with
> > > > > > stale
> > > > > > GGTTs.
> > > > > > 
> > > > > > > Can we instead rely more heavily on the GT reset to flush
> > > > > > > the
> > > > > > > TLBs
> > > > > > > for
> > > > > > 
> > > > > > We likely need a MMIO invalidate whenever doing PM resume
> > > > > > events
> > > > > > too
> > > > > > as memory can move without PM refs (CTs go down when PM ref
> > > > > > == 0)
> > > > > > if
> > > > > > I'm
> > > > > > not mistaken...
> > > > > 
> > > > > But we already do a GT reset in that case right? So this should
> > > > > be
> > > > > covered?
> > > > > 
> > > > 
> > > > D3hot doesn't perform a GT reset or enter D3cold. However,
> > > > looking at
> > > > xe_ggtt.c, GGTT invalidations always hold a PM reference, so the
> > > > CT
> > > > should remain live unless a GT reset is in progress.
> > > > 
> > > > Therefore, the only two cases where we might need MMIO
> > > > invalidations
> > > > are:
> > > > 
> > > > - During initial driver load, after we call
> > > > xe_managed_bo_reinit_in_vram
> > > >   on some buffers used during the hwconfig GuC load phase, and
> > > > then
> > > > move
> > > >   the memory while retaining the same GGTT addresses.
> > > > 
> > > > - During a GT reset, where memory is allowed to move around.
> > > > Likely
> > > > do
> > > >   this step before reloading the GuC.
> > > 
> > > But for both of these cases, we should be able to do:
> > > for_each_gt_on_tile()
> > >     xe_tlb_inval_fence_init()
> > >     xe_tlb_inval_all()
> > > for_each_gt_on_tile()
> > >     xe_tlb_inval_all()
> > > 
> > > Right before GuC communication goes down right? Then we wouldn't
> > > need
> > > any MMIO communication since the TLBs are flushed at that point.
> > 
> > CTs are live during hwconfig GuC load phase but not so much in the GT
> > reset case.
> > 
> > What is probably easiest /safest is any place xe_uc_load_hw is
> > called,
> > do a MMIO invalidation of GuC TLB immediately before (but skip this
> > step
> > on a VF).
> 
> We need a way to quiesce GuC and HW if we're going to do this. We could
> issue the reset and disable CT communication, but GuC still is in the
> middle of performing a TLB invalidation, thus conflicting with ours.
> 

Yes, through the layers we always call xe_guc_reset before
xe_uc_load_hw. Based on Fei’s observations, a GDRST doesn’t wipe out
the TLBs, so the best place for an MMIO TLB invalidate of the GuC TLBs
may actually be in xe_guc_reset after the GDRST completes.

> For the GT reset case are you worried about a situation where the
> hardware is busted and we reset after the fact to recover? Or a more

No — we wedge the device if GDRST fails, and then (WIP) an FLR can be
issued to recover. I assume an FLR will wipe the TLBs.

> explicit invalidation in a TDR scenario? In the former, I wouldn't
> think any invalidation would matter there. In the latter, it still
> seems like we could invalidate TLBs explicitly through GuC before
> disabling CT communication and writing GDRST.
> 

I think placing it after the GDRST is correct, as that ensures the GuC
is no longer using the GAM port. We likely still need the “wait for
valid to clear before + after” semantics in case a GDRST races with the
GuC programming the GAM port.

> And on that note, the GT reset I would think should clear the TLBs for

It doesn’t, based on Fei’s observations, as we do a GDRST before
reloading the GuC after the hwconfig phase. This actually makes sense,
since the GAM and TLBs are separate hardware components from the GuC IP.

> us. Do we really care about any explicit invalidation from the KMD in
> that case? It seems like the main interesting case here is the time
> between the hwconfig GuC load and the main GuC load where we overwrite
> the same memory and thus need to flush.
> 

So, the TL;DR of what needs to be done:

- Update xe_guc_tlb_inval.c to blindly send CT-based GGTT invalidations
  (like PPGTT invalidations). If the CT is down, the error gets squashed
  and the upper layers move on. In other words, drop the MMIO
  invalidations.

- Add a xe_gam_port component that has a lock around MMIO (to
  future-proof this) and a single function,
  xe_gam_port_tlb_inval_ggtt(), which, under the lock, polls for the valid 
  bit to clear, issues the GGTT invalidation, and then polls again for the
  valid bit to clear.

- In xe_guc_reset(), the last thing it does is call
  xe_gam_port_tlb_inval_ggtt().

Matt

> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > > > 
> > > > > > I'd also like the GAM port interaction broken out in
> > > > > > component
> > > > > > like
> > > > > > xe_gam_port.c (with a dedicated lock) in this seires [1]
> > > > > > albiet
> > > > > > way
> > > > > > simplier as we only need GGTT invalidates at this time.
> > > > > 
> > > > > I'd still like to push we find a way to completely remove the
> > > > > MMIO
> > > > > invalidation from the driver and rely on either the resets or
> > > > > GuC
> > > > > based
> > > > > invalidation prior to teardowns if at all possible.
> > > > > 
> > > > 
> > > > I agree MMIO TLB invalidations have no place xe_guc_tlb_inval.c.
> > > > 
> > > > Matt
> > > > 
> > > > > I hadn't seen your other patch yet though. I'll take a look as
> > > > > soon
> > > > > as
> > > > > I have time.
> > > > > 
> > > > > Thanks,
> > > > > Stuart
> > > > > 
> > > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > [1]
> > > > > > https://patchwork.freedesktop.org/patch/707237/?series=162171&rev=1
> > > > > > 
> > > > > > > us? And for the GuC memory specifically, maybe we do a full
> > > > > > > invalidation after quiescing the GuC during hwconfig load
> > > > > > > (the
> > > > > > > first
> > > > > > > time we load the GuC during driver load) and before any
> > > > > > > kind of
> > > > > > > reload/reset?
> > > > > > > 
> > > > > > > We'd still need to cover the case where hardware is fully
> > > > > > > hung
> > > > > > > up
> > > > > > > and
> > > > > > > GuC isn't responding, but then I don't know that we really
> > > > > > > care
> > > > > > > about
> > > > > > > MMIO based invalidations since we'll want to fully reset
> > > > > > > the GT
> > > > > > > there
> > > > > > > too.
> > > > > > > 
> > > > > > > Thanks,
> > > > > > > Stuart
> > > > > > > 
> > > > > > > > 
> > > > > > > > Matt
> > > > > > > > 
> > > > > > > > > - Issue the TLB invalidation
> > > > > > > > > - Wait for the valid bit to clear
> > > > > > > > > - Release the GT MMIO TLB invalidation lock
> > > > > > > > > 
> > > > > > > > > Without this lock, two threads could both observe the
> > > > > > > > > valid
> > > > > > > > > bit
> > > > > > > > > clearing
> > > > > > > > > and then both attempt to issue invalidations,
> > > > > > > > > clobbering
> > > > > > > > > each
> > > > > > > > > other.
> > > > > > > > > 
> > > > > > > > > > > This is early Xe code from me, and it’s
> > > > > > > > > > > questionable
> > > > > > > > > > > whether
> > > > > > > > > > > it’s even required.
> > > > > > > > > > 
> > > > > > > > > > This seems to be required, otherwise modprobe would
> > > > > > > > > > fail
> > > > > > > > > > at
> > > > > > > > > > golden context submission,
> > > > > > > > > > [  480.237382] xe 0000:01:00.0: [drm] *ERROR* Tile0:
> > > > > > > > > > GT0:
> > > > > > > > > > hwe
> > > > > > > > > > ccs0: nop emit_nop_job failed (-ETIME) guc_id=4
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > I’m somewhat surprised by this. A better solution might
> > > > > > > > > be
> > > > > > > > > to
> > > > > > > > > drop
> > > > > > > > > the
> > > > > > > > > MMIO GT invalidation code in xe_guc_tlb_inval.c and
> > > > > > > > > instead
> > > > > > > > > issue
> > > > > > > > > an
> > > > > > > > > MMIO GGTT invalidation whenever we reload the GuC.
> > > > > > > > > 
> > > > > > > > > We can defer trying this until later, as it is a
> > > > > > > > > riskier
> > > > > > > > > change.
> > > > > > > > > 
> > > > > > > > > Matt
> > > > > > > > > 
> > > > > > > > > > > Typically, if the CTs are not live, the GuC isn’t
> > > > > > > > > > > doing
> > > > > > > > > > > anything meaningful in terms of
> > > > > > > > > > > referencing memory that the KMD is moving around
> > > > > > > > > > > (which
> > > > > > > > > > > would
> > > > > > > > > > > require an invalidation).
> > > > > > > > > > > So this entire flow of issuing a GAM port TLB
> > > > > > > > > > > invalidation
> > > > > > > > > > > is,
> > > > > > > > > > > again, questionable.
> > > > > > > > > > > 
> > > > > > > > > > > So I'd suggest move the wait after issue, plus
> > > > > > > > > > > throw
> > > > > > > > > > > in:
> > > > > > > > > > > 
> > > > > > > > > > > “XXX: Why do we need to invalidate GGTT memory when
> > > > > > > > > > > the
> > > > > > > > > > > CTs
> > > > > > > > > > > are
> > > > > > > > > > > not live? This suggests
> > > > > > > > > > > the GuC is still in the load phase. Investigate and
> > > > > > > > > > > remove
> > > > > > > > > > > this
> > > > > > > > > > > code once confirmed.'
> > > > > > > > > > 
> > > > > > > > > > The issue is a consequence of an earlier failure
> > > > > > > > > > which
> > > > > > > > > > caused
> > > > > > > > > > the
> > > > > > > > > > CT to be disabled. And the KMD
> > > > > > > > > > sees a bunch of TLB invalidation timeouts.
> > > > > > > > > > At this time I would expect a GT reset, but that is
> > > > > > > > > > not
> > > > > > > > > > how
> > > > > > > > > > Xe
> > > > > > > > > > behaves (the ole i915 driver triggers
> > > > > > > > > > a GT reset on TLB invalidation timeout if I remember
> > > > > > > > > > correctly)
> > > > > > > > > > 
> > > > > > > > > > -Fei
> > > > > > > > > > 
> > > > > > > > > > > Matt
> > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > Thanks,
> > > > > > > > > > > > Stuart
> > > > > > > > > > > > 
> > > > > > > > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > > > > > > > PVC_GUC_TLB_INV_DESC1,
> > > > > > > > > > > > > 
> > > > > > > > > > > > > PVC_GUC_TLB_INV_DESC1_INVALID ATE);
> > > > > > > > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > > > > > > > PVC_GUC_TLB_INV_DESC0,
> > > > > > > > > > > > > 
> > > > > > > > > > > > > PVC_GUC_TLB_INV_DESC0_VALID);
> > > > > > > > > > > > >                 } else {
> > > > > > > > > > > > > +                       /* Wait 1-second for
> > > > > > > > > > > > > the
> > > > > > > > > > > > > valid
> > > > > > > > > > > > > bit
> > > > > > > > > > > > > to be
> > > > > > > > > > > > > cleared */
> > > > > > > > > > > > > +                       ret =
> > > > > > > > > > > > > xe_mmio_wait32(mmio,
> > > > > > > > > > > > > GUC_TLB_INV_CR,
> > > > > > > > > > > > > GUC_TLB_INV_CR_INVALIDATE,
> > > > > > > > > > > > > +                                            0,
> > > > > > > > > > > > > 1000 *
> > > > > > > > > > > > > +USEC_PER_MSEC,
> > > > > > > > > > > > > NULL, false);
> > > > > > > > > > > > > +                       if (ret) {
> > > > > > > > > > > > > +                               pr_info("TLB
> > > > > > > > > > > > > INVAL
> > > > > > > > > > > > > cancelled due to
> > > > > > > > > > > > > uncleared valid bit\n");
> > > > > > > > > > > > > +                               return -
> > > > > > > > > > > > > ECANCELED;
> > > > > > > > > > > > > +                       }
> > > > > > > > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > > > > > > > GUC_TLB_INV_CR,
> > > > > > > > > > > > >                                        
> > > > > > > > > > > > > GUC_TLB_INV_CR_INVALIDATE);
> > > > > > > > > > > > >                 }
> > > > > > > > > > > > 
> > > > > > > 
> > > > > 
> > > 
> 
