Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5524EC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 21:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA0D10E3CD;
	Mon, 29 Apr 2024 21:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yx5udVfM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2069510E3CD
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 21:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714426130; x=1745962130;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CehkGXIMg7a5tjI+KVAOQQozycomFL9Slvcu1HH5PFs=;
 b=Yx5udVfMGLZqBz74jvp3zpyJluzr+bzaTKA/BJ7wr6ZXdkjJIDWQKl7V
 3+pwsrp2lV2GGA6rU82jD+vuzY59GXsci6jctABRwBj4CLqcKkwv/mxJT
 c63pETqg7WjTQbhsmHrJUmv/fvt/wi6eiP1l83R4djFOCylgkaTX6Nakg
 6PRaQ/If0ruBW3abMk87ICT34KKUulobw0jBW+oLp9Ppsl0hypIMz1YCh
 zs8afU9wmpri70Yp+IqZjhfSQojt7XwG8IeI5XtmEq+dd5L1EILsJp4mV
 t9bFyZfTZtql5I6nnbe441aHsfLdzisOn7+z+eJ3N8YfmrmO7OYZqGwoT Q==;
X-CSE-ConnectionGUID: cPDuPKWrT1au25fs5c6OqQ==
X-CSE-MsgGUID: 7785tTlvRZaz2QOZT/YNjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13038371"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="13038371"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 14:28:49 -0700
X-CSE-ConnectionGUID: mbWjg7/JQY2DtdY5P6tStg==
X-CSE-MsgGUID: JPMCQFP4T4WwAMjDtmZ7pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="57437705"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 14:28:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 14:28:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 14:28:48 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 14:28:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fi6TlLI7QGa8fYdsDDgn5qCNbPtoA8NfkeXe+lTrjA5bvsDhMnPpRQj4Lo7V1kTkJ7XtwbA0bJpid9rcPqh4yQdx/5wUujuVjTNYyRIgqhtbPjXLv56rt7AjdJWhAkk2VjIoYM2ojHyhQIpwlI99vbKx7H7kGnRT4vXd/9LrNLZqy3bl49jCp2wmvtG1pPpUgYPalUDPljm3CsieolZ0k0P/iWIMYsMSnaWR59xylFldHw0hNEiCud8bDSTCVW1N1SBSeb+Z285HjCwrstNYzgwaGHr0l7bB/TAHq44RCd863YCSWjJGtVwpv11NatMpgyj5ETpgLg1LjHqleQ2gjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYH3NyjWVN/f/lMYcaPDXsXRguaZPAhGdKDx7i9P7NA=;
 b=ocw8E/kkpBIgPRpKSV3CWfudy495j2gQ1ZbTZHJXC3Uho3BWiVc5iL/cqgV9ZR9DSDYsCp7jIE+NnUlSw/DfwxBp/ZgTGmiZeg9PvPx8Q5sSkhY3AsDtrDT90+MjcAnSl2PtjPm0MzCFbJWkNPzvgR0iHujMwc/dhFGZdxNpwpBUxxjuW45RqwLFn12eehCwgIOcsCFprJwLHBao8V/+gwvTrZX5OuYS40voxoA4n4EZKoYYQDX3BwvbglRTqNAQbHqqB1TEox1xiSbag8R5ZKyECZs1i2wXmSFYn1Cot/Or+RAZv9wuBOGfaFxIkJtQJ7fCdsMIpvkhzZOMBrj1Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7653.namprd11.prod.outlook.com (2603:10b6:806:306::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 21:28:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 21:28:44 +0000
Date: Mon, 29 Apr 2024 16:28:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/8] drm/xe: covert sysfs over to devm
Message-ID: <7ik4xh7hncw6h62zvmv7vr43a3aedn3ft7sxv4xjvnf3glf2g6@h72yiizlvqje>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-10-matthew.auld@intel.com>
 <Zi-gYDEFzI_bXCzP@intel.com>
 <wtqag5pd5plbiubuhypzdr7jitxutcfbft2xtchwx3fbf4zzfm@pmokwtkmlnf4>
 <2b6f8692-79ad-4976-99ae-c2b227b893d9@intel.com>
 <Zi_qxhMrrlUc7hBz@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zi_qxhMrrlUc7hBz@intel.com>
X-ClientProxiedBy: BY5PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc9f0a2-6c6d-42e5-b4e6-08dc68935941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Zjn8zdNXWFen2Jfhm1hCR3YYgM6KEfss3sUsM99dCnWDQEyiwgSlAN+Zc6?=
 =?iso-8859-1?Q?J2tXhCc7YVm7hz70PQuMDQFX/U2rNhDJUPVp97+MDBTbN3F4w0LMVejsCr?=
 =?iso-8859-1?Q?q4NWkBl65Q0AkyVaczSmQRhvGerZ3/4008iXBdHHNqfERX3DXdF78fnn4R?=
 =?iso-8859-1?Q?lhTKpmSCdR5gPBuzRcVmvbZOS+4wmAl3gF1C8lf+Rb0KMCoNYEFJUbIopB?=
 =?iso-8859-1?Q?m1AG7bq4DTfbz6aBI0Zo2cYZZnLSepuLlY9cbeFNX2Z9xBsFxImQSkhbGe?=
 =?iso-8859-1?Q?eYBfzYy2vmkq5GqAOOq8tFW01nu+7F69UoiLLcsV24Q3jtnJOgWLMSG7sC?=
 =?iso-8859-1?Q?9FbKN3A+6Xv1Mno+E17wQuPc+wOvHbDUN8Nf+KVxTUUx3A1qbW5cCzRxwG?=
 =?iso-8859-1?Q?fM+NziUldsN5qB4G4XEdEb6Q6gOprS9YtlT+ZMziOBMpsDfSDRG36jaLR6?=
 =?iso-8859-1?Q?SfeRU6tORXsa2yPHajamkXuMWIhZ/Andv/WiDdpm7h8ddW+/IhtufUZ+No?=
 =?iso-8859-1?Q?uSe2wIJjy8lfBUiCEUpoDxF0psmPXxrbDptO9+tnXSCHMy2gd5872fFQwo?=
 =?iso-8859-1?Q?TkbhAYiLt6NRywhlEzvRIk+VUFhfzsYYyV6brrVflv2AhoUWvhRHheP0hJ?=
 =?iso-8859-1?Q?9AkYLuk7Pa9Ix+7tKX/5R6AigEi5QFF3XTPAJjer3A21M1kR8934s03pwn?=
 =?iso-8859-1?Q?6cA7aUC/o8PmAt+SzGPB5BkncTfHZYcjq9jZZ5/5ZqvRApLK4eSAGRibsT?=
 =?iso-8859-1?Q?lPWJOOM8/yJ1DP7vJhoGTsjgSK6HHBZafVedwdrMvXQsPRa/YkWHbLuQgA?=
 =?iso-8859-1?Q?4i0rhdMKPMhTvJlOc7tSpxxn1B1yc5tex9PKvhVGgcWzOrKkd5zUzimUgQ?=
 =?iso-8859-1?Q?jmzg4N8NCI4aLOjbSvk4/OBcFdfowsHlsGKs2VVvGbv/rlLFRtNJDSIc3W?=
 =?iso-8859-1?Q?1pE8mVMwd5jSxL9Ey+vpWKC76oqwZjAmsD0GEySbPkeOjLng7zW7gETsf1?=
 =?iso-8859-1?Q?bsPXB+DbeDi30amYPp5g48Vn4np9syNgk88/i/4p1mka/xZppHpnt3RU0U?=
 =?iso-8859-1?Q?S07TaulPTihs2k+zCNgpQ06O6wMg0TmEgo0IxEVbpX3zztPjbOpeAKOJVO?=
 =?iso-8859-1?Q?48KjfEy9/BwTlhUQ0PVXU3XdYtDy29L+llHIqOxW3U/IbqHa3S739kiN89?=
 =?iso-8859-1?Q?tjjuzmBARjnu1x7HzpEGNTqEkCgv2F+aEx1/K9l14BkQEPNahEAORy/6sR?=
 =?iso-8859-1?Q?lOpII2Db8NzWKoNhTYEujeGbJlaDeaCINMtJLtB5k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LTgTGfEA3i60JKOHV1PuYcBTEMx14IVSwOCOj/ppYf7P0obnVIyachdKcT?=
 =?iso-8859-1?Q?f1ezqzEArh4/bqL5ywo20rXzzj0iemBNOf0eYZ1AHfBWl7Rc5Y43ynKcNQ?=
 =?iso-8859-1?Q?oeuFSW7VYdHpdsPd2YqfRQUb3DdeUmMj2f9mDBqKJ1mF9mtP0X2HQ1HTeG?=
 =?iso-8859-1?Q?nwIJz8IZl7pBwJgHRFsV5nkulz4zot89+QbS5WIm+z2PDCNlWVfRYS3WVs?=
 =?iso-8859-1?Q?uUGuD0fWTbvl98qAnCS9bgVCoDN52CO1kWlfzLepgF7uB9yr1X0cIJtkMh?=
 =?iso-8859-1?Q?KNJoVOxVywWYkwk+aLUfR6qqGk/n7wX1EM1+e4dan7AZcY4Tx2qakhW9tp?=
 =?iso-8859-1?Q?ymkqC7A73Ij3jvZbFpU51QSp8gd/jLG+fHrJ43tP2XcW/1AKNLJlHUwqWd?=
 =?iso-8859-1?Q?sQu5AYwT7W+ItBNotxUL9jmQEvwmn9wUSEBicV0cVa08GZZbGRTUAE1GbK?=
 =?iso-8859-1?Q?d7E9pUufBZ8WYEqfbmRk8q8WU5hRDiYLUoPKyM+wX4so6XFXBkuv95T7t8?=
 =?iso-8859-1?Q?d7jZrDlQwhbfLbwEX+0AgGW9M6L5zJtoSd74WMd7xyIrcVRG9BVXjxaGMr?=
 =?iso-8859-1?Q?xTB1gz/Bl2p0RDU5DIDDjEdBUsabmbBhTyzFcXv6GxJRLovu1j0o4ZYdsG?=
 =?iso-8859-1?Q?4tuRuXIBCU2Tc8O89IKNOkJ50nYZDqOfXufR1KvyY9JSb2CcrW64zfCm2G?=
 =?iso-8859-1?Q?jrRKt3SmmGVxkWj2W/eQPoi5EtI4DyjS+Pqy8Ljr8vqaM+eSnUZ3WGADnb?=
 =?iso-8859-1?Q?nRi6tOQl+N3WM/PQjTLJLQqax8ApVIhcY3RA+v/GS3ZeZQaxwP9S6ne5kh?=
 =?iso-8859-1?Q?7cx0absXoKMJ4yGsaqAyFXGkO/Q0Opnr57TjAqE3liI8fVs9tT+l49Ac8Q?=
 =?iso-8859-1?Q?CaSJPp7XHMa6QfEVv7ij5ZjnPp9tBlQXVTQoYGk/dU376yDl+bKPazaHG+?=
 =?iso-8859-1?Q?aRYsJ6RRrUCX5sEnGUlKTOEMQ7x+WbhE5yQF0M3Pa3v/Wv+E+B9NhYDp+A?=
 =?iso-8859-1?Q?ph1arMzeBTXJh67nak4VgG82ywkndfSDeVc1oH6ncw1aGxPPRsBEUglWDW?=
 =?iso-8859-1?Q?CG2FMTxVFNJGWrzW7HsNJJ9OcAB7l7DzHkP4WCcWoQTe3nC7B+ZkhSBPOq?=
 =?iso-8859-1?Q?jSEXdBIrjF+F55ysSdtkfrSwD3HAiUGJTzWNDAAhJA1gAayEfOsNJgmiv/?=
 =?iso-8859-1?Q?T8HgvYk8HpcgCYsT9f6v6uP6qYwvciHTpT6btTHgj1HbF8GminYRGFrucW?=
 =?iso-8859-1?Q?ayyJExhHmPEZHMSVWmcR336BX9mNaKyQcW4yTeiEX+2imHfshi+NWydwYx?=
 =?iso-8859-1?Q?0bHWGfy0VVx+PIavaAiigQZTSRQb9B+y2aBL8cupIz3ukkKGPM79Xy+B5f?=
 =?iso-8859-1?Q?WT6yyreB8sTOpqxgco47lgNZ50+VvSxfUjpw4CjAGEt1dM/OnRcCRpVVu4?=
 =?iso-8859-1?Q?knuMSHpb6p7sz18F0i45aw0E0ywHJ52989u8YuAxF/4aI5MGG28nPXkqK1?=
 =?iso-8859-1?Q?F/6TDNgSNpx5ZUWoQkHrx/+pqn/o0ZfLR0HgFFUjnz49LCglDDGy6j19l1?=
 =?iso-8859-1?Q?gHzbXivXgRpRNItyoSamGHF+SBe5mxx9POoK2ZsS2CaT595udASM0jxx0r?=
 =?iso-8859-1?Q?K2QJdBGCfLPDgCHy1EhannyKNYlrCy+k1ctXV6/DnbHl57kdyNT7kOOQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc9f0a2-6c6d-42e5-b4e6-08dc68935941
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 21:28:44.8095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7Mw7D4Qqw4a3+TFifPwFgFTr/bz7DadInKOFcY46zxpNdgJ8PCyIbmr4xLv6hru5NkhvK7KJK+odbVYKoCSOvUsTSYX8BNhiD8+E1pN0cE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7653
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

On Mon, Apr 29, 2024 at 02:45:26PM GMT, Rodrigo Vivi wrote:
>On Mon, Apr 29, 2024 at 04:17:54PM +0100, Matthew Auld wrote:
>> On 29/04/2024 14:52, Lucas De Marchi wrote:
>> > On Mon, Apr 29, 2024 at 09:28:00AM GMT, Rodrigo Vivi wrote:
>> > > On Mon, Apr 29, 2024 at 01:14:38PM +0100, Matthew Auld wrote:
>> > > > Hotunplugging the device seems to result in stuff like:
>> > > >
>> > > > kobject_add_internal failed for tile0 with -EEXIST, don't try to
>> > > > register things with the same name in the same directory.
>> > > >
>> > > > We only remove the sysfs as part of drmm, however that is tied to the
>> > > > lifetime of the driver instance and not the device underneath. Attempt
>> > > > to fix by using devm for all of the remaining sysfs stuff related to the
>> > > > device.
>> > >
>> > > hmmm... so basically we should use the drmm only for the global module
>> > > stuff and the devm for things that are per device?
>> >
>> > that doesn't make much sense. drmm is supposed to run when the driver
>> > unbinds from the device... basically when all refcounts are gone with
>> > drm_dev_put().  Are we keeping a ref we shouldn't?
>>
>> It's run when all refcounts are dropped for that particular drm_device, but
>> that is separate from the physical device underneath (struct device). For
>> example if something has an open driver fd the drmm release action is not
>> going to be called until after that is also closed. But in the meantime we
>> might have already removed the pci device and re-attached it to a newly
>> allocated drm_device/xe_driver instance, like with hotunplug.
>>
>> For example, currently we don't even call basic stuff like guc_fini() etc.
>> when removing the pci device, but rather when the drm_device is released,
>> which sounds quite broken.
>>
>> So roughly drmm is for drm_device software level stuff and devm is for stuff
>> that needs to happen when removing the device. See also the doc for drmm:
>> https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/gpu/drm/drm_managed.c#L23
>>
>> Also: https://docs.kernel.org/gpu/drm-uapi.html#device-hot-unplug

yeah... I think you convinced me

>
>Cc: Aravind and Michal since this likely relates to the FLR discussion...
>
>but it looks to me that we should move more towards the devm_ and limit
>the usage of drmm_ to some very specific cases...

agreed,

Lucas De Marchi

>
>>
>> >
>> > Lucas De Marchi
