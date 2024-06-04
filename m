Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F54C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 15:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BDD10E31B;
	Tue,  4 Jun 2024 15:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+yGPWNT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E5410E31B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 15:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717513431; x=1749049431;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xrP0VrQIcrFu/nGDV0csV2xelorFyDAzlMbGGdVM+qI=;
 b=d+yGPWNT+afybOrIsNEhLvUo/TEg7dMVXc/I3kjOEW7+X0eqvFMAtngO
 farFp7m5lRXAy5dEiotO8Zk1Fo22IE2PQQFWUiuG3RB8DX9XMOdk6nwvp
 qZP1f2qoefhLoGPFBTGst4dmh6/5KWL1YKsFkFXdO/tvFapKce9Roso5y
 5f9GAnkGV7ixRc082YPZ6Qfc1Qzdw8ybKsq/FVd6Eod8QE0aG8d8ydMF1
 Fl5uMHqCcJwTP/aVDV3rx0kwDg8jEBfBipMmzCiFkP3GFTwWQx4Nth/zB
 6BsuAGDBQJoIoQ1yiRm+PAVDtiX96n0EO21S3oYt8lc0lvaVGK38xEZeg g==;
X-CSE-ConnectionGUID: LHCcqi9yQfaQShbyM554Bw==
X-CSE-MsgGUID: zlsTtZG/TYuPWkOv5pBd0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="17904655"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="17904655"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:03:30 -0700
X-CSE-ConnectionGUID: T4bdxT0ZTly/Vq9fkPC9Kg==
X-CSE-MsgGUID: aSoSVW2UTpqWB7WM05aBgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="41815042"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 08:03:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 08:03:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 08:03:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 08:03:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8ywc5dVj69wbggYzF6llZgg0dC3dFGQ7fDJWlfN7l6BkhyXTA7+TpGyFbUiC1mMyGsJF65I1ClXi+q2rcOufb+iL6kc0f3AoAo19lwTZeRUGcr/0G3Vk1vTCaxZ/HEG5Ljc4ThFt9vTnYjbaXclX8Ybezx0yWD/O0owyoWOeK0n8kI/h2eKokbhUVlSS7JjMKh1j7qKU4SpsH0JXYgGrgbqztP3hSfHSv09xM7fdKMOPc9urbroU6TCiNam8TcfuLbdRbUpmGStZ9HVp/KjvSxOWH1IsyjLuZzn6fXJLH6oG8WZxaUyn1MuBehKSP77zrvYwu7yMaQtxeyqb9oK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTcLGM6f22wC9MxQiz3tCwoGYQ36Tp0Dbsd+gDeSgt8=;
 b=ly/gc46PZUG/mljePSGVKhChQAPVIHqxglfIlPwQjzx6kg1n+iay9o8L3MnfBfvN8H5qhTFzHrfJGVhU+sf62Ft5cWsAAsgbjiug8mVHejNNfk6HJp7EJxHkyQvfyeN+0RAbejiEP9A/h2+O7BfNniD8zi0/g4qwCDCgSRgbMe6WmIZqviKRS1CGivYMlxBcfBPIcYtBB7FKs0FAcvYwzyVPwrQVgQLFQ5+2ipemMa3ErG88iVacLwBlhzD1TvD/NmIOQMeaR5oWaZZzO6OnQBFd11yHZ9JQCw/CWKG01InWP/4I9QsQGcq4ECG5M0WqOPpoiuwsQItOvzW58VYFNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BY1PR11MB8008.namprd11.prod.outlook.com (2603:10b6:a03:534::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Tue, 4 Jun
 2024 15:03:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Tue, 4 Jun 2024
 15:03:19 +0000
Date: Tue, 4 Jun 2024 11:03:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Anshuman" <anshuman.gupta@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Ensure d3cold is only allowed in DGFX
Message-ID: <Zl8stGEaHUGBUVxh@intel.com>
References: <20240603215218.14278-1-rodrigo.vivi@intel.com>
 <20240603215218.14278-2-rodrigo.vivi@intel.com>
 <4305f424b0eb58a885c803a57b0303d3109178ce.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4305f424b0eb58a885c803a57b0303d3109178ce.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BY1PR11MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b09a203-0d7a-4287-b4ce-08dc84a77883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EL+bo5h/QCtPJE7SoYgJchaICWjvO1gs2PEHqIBo4oN0EaWaues5qMC9nWaf?=
 =?us-ascii?Q?WgL63dTcqMxZmOMIzXMPjIdjZK4v3otGLk5ZU16BLbnCaRed3Vbj4oSnm1I3?=
 =?us-ascii?Q?qkZT9qfTcJWzPfj9evnazHx38p31+Tgka9zDFh7mSZTGG0Wr8gl8L+dFaue9?=
 =?us-ascii?Q?JaZJCKdjX0OVkMmu/TwSbOiMTPKQhbrk1q6o8QgBbbszx8HC1COeK+yzWkFX?=
 =?us-ascii?Q?pJ0Tpu/UmIGUVLyO+T48m/PP0x3MqfFbsG2hupdHl0DafsMmhCr/Ad++cXZT?=
 =?us-ascii?Q?hwhzRe55FTc+7J/PlzCYEdDrDCz1m3D7PXDjyCIDB5kBp8cbqqVHCd+bA0rj?=
 =?us-ascii?Q?rpRNdewQX7n6QP6Whym5eQBjb5em7/12w6bxKSYkKK1wybF/IVmbCQSvJPqh?=
 =?us-ascii?Q?yzMT1DoAAxswQWEIqN4xHUfu/nPNth/Ft96gtBkrLvUAzhlPDUTbIZtc1iB3?=
 =?us-ascii?Q?P+kVG2ipIocA5wGPvDZeBmU3jEhhxEbbPaKhOvRXt7c2oBXyrXQEN4QXqwTr?=
 =?us-ascii?Q?KYY9SWitFhlnsFrMMnzZm9x2Fp6nvRhvmJ8zOhUh+oUFZ1cpkCpr1bPSwKHl?=
 =?us-ascii?Q?G9NFaZkt5IQTcDrI4ptPJMF4J3n0hjBHScW4SGCx3yyn5UFOlXotzaSx+J/4?=
 =?us-ascii?Q?KzOF7hEy07EC13bfTcU3FbO5YA7O9+gDYa8K+gC8n8qDaNuUBsOA9Lw24i1D?=
 =?us-ascii?Q?3u1hdD5leiRno2iGmIZfx3q4ALT6ZX8oIFQ1IboW6BZ6vJfhLsPPUThFLcU1?=
 =?us-ascii?Q?iRKRCMvausxUO1AQaYv+QPbrYHjf0dsiAEmEcxSOPRyfN7HGISCm95soixSI?=
 =?us-ascii?Q?JCD4iBQ3ujBolAbZXukHkmnZlXqoBsCmC6A9xz5egPg3QAIf3N49w4UuX1sV?=
 =?us-ascii?Q?iu01e1yA2yRfh2vsn/pV6L7z1goO2NJHjqJSyqhBxslK7fduia3cq0Kes32A?=
 =?us-ascii?Q?phzoTGRxLt5vCG5EPXtC9ZLzFFbzLO4AfvGcfxf/QTwCuku6EECI6zVCxe72?=
 =?us-ascii?Q?nRzp5QwQ21VTAkMVVYZRHomrpQ32BRK1mRi05hgx16xRyyiweXkKTvQF7MUv?=
 =?us-ascii?Q?MzEXgJyRy53pb9z/qNTYntMjEGnq+jBWPNrdJNBfXvwpuL/oMYqlZkdpSszY?=
 =?us-ascii?Q?K4YGWCMNs9RNbxU8XWXv6YyIbHAYY97cogXtUfCygn/CO4RrZp4Wpt+3Hco5?=
 =?us-ascii?Q?dYPoLXzcQ0zRlltPe2odPZjTt/rC53UAqySa5H0xuiyav6qEbdYSmHLYiYyJ?=
 =?us-ascii?Q?Iwj7yOwAc3laB0Jtf8IOO1uAvwryK1iYcVYdX62gYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pdJg35kkwtiBTdaOgfzAppim9Hnal2zmpTSZEZvAcAxGvhlfNdaOytsFVN1N?=
 =?us-ascii?Q?kkFZpNxYbAJwzq5sYHaLxaiNKc3SMMXEk7O6JTXMmJXms3IKhCw1BuRjgm6D?=
 =?us-ascii?Q?l7hV6FQwa4wWIQ95VphmOpQN5nuBkXGmElgy7ckr78cdvoB1nJVkjk26Askg?=
 =?us-ascii?Q?wcGVCyDoYt7i4rS6hiy8qJE7ek4YFHlhSiWEzItQKlLow+4SPeCPf0gWIj6C?=
 =?us-ascii?Q?gEGojdnor6RXA09Lzlsr1dMNDTQQEWz1oS9B4Jlu5m0+MHj+Pb9J/CIPgqgd?=
 =?us-ascii?Q?SdUvC/eGkM8qHu4nwERf4WAfHbHpQh5ku8MGGxPvh613Tl1jsu9aiXFmCdwD?=
 =?us-ascii?Q?lvIcNyjNIW7oc3669nRQ81BTZsYCOCJhZLkdM9Lz4AgziZCFneHICniHcDzl?=
 =?us-ascii?Q?bqsUGURWvhL8URYH1YZ/0hU3fXrg0edgZjFaJFR+IoROv/tlUeJ2iEmprjrk?=
 =?us-ascii?Q?FZjUfS8Nq2Fmy2LqyzWbMcnALDpCwt76XxAmpGsvK8RIKO2XmXh58sPrGIoE?=
 =?us-ascii?Q?0kQFbve/pCGmm5Nl/CylUXDqV3NDcqgplZIeTAaffE+SVJMVGnOTjkuYJaUD?=
 =?us-ascii?Q?klFnfRwrQi0GxRDVetd0MxFD1NEEXqzwj/1vf1zMpu71MRVRn/7LSTFPKMZv?=
 =?us-ascii?Q?KsrE0kygbVXZ6OzcreznazCcHd+mop5f5yKZHvTOX4wxkWXWVQuyrSDdvuBF?=
 =?us-ascii?Q?G6Qa62qUiDHH+OxRtFODmrqYxQEHWqhadjoz8TRbDW6/tSqp36afnZvO1jcP?=
 =?us-ascii?Q?nwZfnoRDpYeoROLJAmMsm2aNQCl07DUdfl7MBzjMKbT6ixDgHgaKv0CL+bAr?=
 =?us-ascii?Q?MgPt1z5IiYr4A6v5iIT899/BwayE0q4Z4o/ecSQexHkBlQMCsNqKbkWeda0Y?=
 =?us-ascii?Q?EaK/wTfVAfpsV1ZjIXDtA+SXB5RTLK3904JfHC2kHlyisCyQZmeWZHnIZTg6?=
 =?us-ascii?Q?NBM7rnUWja2adzZxi3p4EukbSUuQAf8jFRvblF9ogIMNi4PsqnaT+lX8Pt0X?=
 =?us-ascii?Q?/rlpXhMt8pofno509hs6g0qJIinAeROiXi25h1Thf3TtT6WjL5VMljvLCWwG?=
 =?us-ascii?Q?cAWv6ZGX+oAkJ39r5on5natLwWrwrC9Z5V5gac24dipaKiXkmm4GAMsDTFmz?=
 =?us-ascii?Q?IXd5LV+woVMIrxFySFtAsSaewXuwDp6SfOKOk3xf1mYnyTJGrZd9Ef9SnGzU?=
 =?us-ascii?Q?S4hLE4qYhWfVjRQjuvcRgS1ht1SRmKzqWvmUYafljkAufxxWElVGb+h9kYsZ?=
 =?us-ascii?Q?T988f07eVx+7FJyDH+KSMwGYn2Vvbt2023o1irI2QpljLdaYCYMinZRaslMS?=
 =?us-ascii?Q?4OmJt1Q/Wm4LZjeRvJBFC7M+ILCWxSCRXPaZ8pfC7f6p68cAUQlEswldCnAN?=
 =?us-ascii?Q?Ai7A6Ehk1HVvMdyM6RKN1of5dgS+5i1l34VXAcM4kiOkwebRDfG9FGOUQe0H?=
 =?us-ascii?Q?mlgc6c5qU1HOwJXJrnT/ItX64pGr4cX/Vw58V36Ls887DfEShc5kiC5CGQZe?=
 =?us-ascii?Q?CqFmluFHcMfcNm3bnIdTxZ0sQKQf3QH7PPh4HXN7BdCOmufSVFVF/LXlVXyC?=
 =?us-ascii?Q?IioJmfBXuY7vtdlOL2Lpp00pJHNl12VkMTRdtA6u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b09a203-0d7a-4287-b4ce-08dc84a77883
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 15:03:19.8981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIrLYJYwkQ7ycK2b8qnjaZ28rLeJgbWVHGdtp2WrK1BffycsvI/UuHS6go1Uj0eiVqmgRJUe6WMNx8rL1dq7MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8008
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

On Mon, Jun 03, 2024 at 06:15:46PM -0400, Zanoni, Paulo R wrote:
> On Mon, 2024-06-03 at 17:52 -0400, Rodrigo Vivi wrote:
> > For our integrated parts, the GPU is part of the CPU package,
> > hence removing the power at the root port is likely not possible.
> > 
> > Let's add this extra layer of protection to ensure that we are
> > really not seeing d3cold atempts into integrated devices.
> 
> I don't think this is the case.
> 
> It's been a while since I dealt with this, but as far as I remember you
> can put integrated cards in D3 cold by writing 0x3 to PCI register
> 0xd4.

That is D3.  Please notice that there's no difference on D3hot vs D3cold
on that register.

Bits 0-1: Power State (PS)
00: D0
01: D1
10: D2
11: D3

D3Cold is a special sub-case of D3hot, where the main Vcc power is off.
That doesn't happen at the device level, but only at the root port level,
after all the PCI devices under the same root port are in D3hot.

Although technically possible, I doubt that we have any integrated out
there with true D3Cold support. In general, on igfx, we are the device
0000:00:02.0 that is under the root port pci0000:00 with many other devices
directly bound to CPU. I honestly doubt that the power there can be cut.

Also, I recently noticed that even on most of our integrated parts, not
even D3hot is advertised as supported. The gain of the runtime pm on
the integrated comes more from the package-C state, then from the PCI
device power delivery channels actually.

Well, anyway, the rest of our code on d3cold_allowed are more prepared
to deal with discrete by checking local memory and other things. I don't
want to take the risk of unexpected behavior of something we were not
taking into account.

We can re-evaluate this on a next step if we see parts coming out with
this support in place, so we prepare the flow properly.

> 
> https://cdrdv2.intel.com/v1/dl/getcontent/703047 page 990 (printed as
> 960). On BSpec this is page 49664.

yeap, I believe it just shows the possibility, but that would depend
of other agents and hardware changes that are outside of the graphics
domain.

> 
> > 
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index de3b5df65e48..1facb7dd8b66 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -172,6 +172,9 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
> >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >  	struct pci_dev *root_pdev;
> >  
> > +	if (!IS_DGFX(xe))
> > +		return false;
> > +
> >  	root_pdev = pcie_find_root_port(pdev);
> >  	if (!root_pdev)
> >  		return false;
> 
