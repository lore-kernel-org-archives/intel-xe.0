Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9704CD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 14:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE7810F337;
	Thu, 21 May 2026 14:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="ZGcdv02E";
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC5810E487
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 14:19:10 +0000 (UTC)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64L0PXGm843724; Thu, 21 May 2026 14:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:sender:subject:to; s=pp1;
 bh=aq2ziAevdOR20ZlrVFB+myc4dHn3YIrNxhMNT4jPeQg=; b=ZGcdv02EcfxQ
 KAKbShpbWj7AgFnSwWmSfI3FTea+CgsaKOQoyarTcGR0XaRKS4BNs3hfQS6ac72Y
 5wqBMc/5mK2ccA/3cvKQUEGN60MisYPWy6QGnjYuIdvrvcEwM0YPGONtxlDOfI7L
 wo1+/ILCLJ25zbLhoFOEM+dE77tR5+JnDhOTIOIHxkHAcxnkgrzeuF2f1CX5m3pd
 bHvIsqYGP09cdYGN1Pk0p+3RqP1arLhBye+v7YjaACmhLGog4CMrmzdcC7zgagUl
 gCiLHQ3x7jiAWbNHoGBZiLXnj3c5BTMg6g2XBuYkQhePrbp+g4NR7fA60o9d+mi3
 0WrCTEdDpQ==
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h9y7fm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2026 14:19:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64LE9JqD017826;
 Thu, 21 May 2026 14:19:06 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e754gmanj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2026 14:19:06 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 64LEJ3nm49545696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 May 2026 14:19:03 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C69B20043;
 Thu, 21 May 2026 14:19:03 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1954E20040;
 Thu, 21 May 2026 14:19:03 +0000 (GMT)
Received: from p1gen4-pw042f0m (unknown [9.52.223.163])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 21 May 2026 14:19:03 +0000 (GMT)
Received: from bblock by p1gen4-pw042f0m with local (Exim 4.99.2)
 (envelope-from <bblock@linux.ibm.com>) id 1wQ4Eo-0000000Dcd9-2nEy;
 Thu, 21 May 2026 16:19:02 +0200
Date: Thu, 21 May 2026 16:19:02 +0200
From: Benjamin Block <bblock@linux.ibm.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
 "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>,
 helgaas@kernel.org, schnelle@linux.ibm.com, linux@roeck-us.net,
 lukas@wunner.de, stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 dtatulea@nvidia.com, mani@kernel.org, kbusch@kernel.org,
 lkml@mageta.org, alifm@linux.ibm.com, julianr@linux.ibm.com,
 ionut_n2001@yahoo.com, sunlightlinux@gmail.com
Subject: Re: [PATCH v14 0/2] PCI/IOV: Fix SR-IOV locking races and AB-BA
 deadlock
Message-ID: <20260521141902.GD206464@p1gen4-pw042f0m>
References: <cover.1776839248.git.ionut.nechita@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1776839248.git.ionut.nechita@windriver.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MiBTYWx0ZWRfX8WW7ICgrgEay
 KWozYAaeNpnS6PreqGOEu9gXfNXYnuuIflenLcdGAD98uC2+q3eV3XSRFBTBT+O8100XOiy+Vkc
 7dRSiu33DTAJFcACrmX6NCnXYGd7LvpEqZPdOSWIBjhb8I5x1Yge/OffSeOc7zEYnQx6wGPHj6B
 /T7YlBkQFTncQ6/eJFu5c6eTEj7qqal9zdCVCypx0SIYIlpVLmCwVcTZI6/vq7REpSB8S5275Nw
 8iBFDjIWf1ss5qGGdhsSW3jL+ZnZyUp+9LFkxlmkNrijY0+SwkUfcqDMSlkXLpEgBYhx6zP8ZnP
 HZv5QjealdfK7/vzN6NkJ9xRjG6V19RszVzAV/PJvsCv6Cn/1EVC+6M5TXZV5Y/GA+vUR7BCuvq
 pu/UyQMchEzLiHP+7Mm4DuKgM1h9IyM7Thvo8+TWP/L2muZBsni3DrpxwbPhMJFCR1utpW5+Ms8
 nK1Tel31xbEiJ5N7aKQ==
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a0f145b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=t7CeM3EgAAAA:8 a=J6SQpo7RyPDJe7EV0JwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KHf9ZanH9jMYZW6Db_6NeGxoWj_KLa6I
X-Proofpoint-GUID: QN3mdofEJ83IA20oSJrx_2TLWc2wNWLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210142
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

Hey Bjorn,

On Wed, Apr 22, 2026 at 09:32:40AM +0300, Ionut Nechita (Wind River) wrote:
> From: Ionut Nechita <ionut.nechita@windriver.com>
> 
> This is v14 of the fix for the SR-IOV race between driver .remove()
> and concurrent hotplug events.
> 
--8<--
> 
> This race has been independently observed by multiple organizations:
>   - IBM (s390 platform-generated hot-unplug events racing with
>     sriov_del_vfs during PF driver unload)
>   - NVIDIA (tested by Dragos Tatulea in earlier versions)
>   - Intel (xe driver hitting lockdep warnings and deadlocks when
>     calling pci_disable_sriov from .remove)
>   - Wind River (original reporter and patch author)
> 
> Test environment:
>   - Tested on s390 by Benjamin Block and Niklas Schnelle (IBM)
>   - Tested on x86_64 with Intel and NVIDIA SR-IOV devices (earlier
>     versions)
> 
> Based on linux-next (next-20260420).
> 
--8<--
> 
> Ionut Nechita (Wind River) (2):
>   PCI/IOV: Make pci_lock_rescan_remove() reentrant and protect
>     sriov_add_vfs/sriov_del_vfs
>   PCI: Fix AB-BA deadlock between device_lock and pci_rescan_remove_lock
>     in remove_store
> 
>  drivers/pci/iov.c       |  9 +++++----
>  drivers/pci/pci-sysfs.c | 30 +++++++++++++++++++++++++++++-
>  drivers/pci/probe.c     | 18 ++++++++++++++++--
>  3 files changed, 50 insertions(+), 7 deletions(-)

do you think this patchset is ready integration? Or what do you think we'd
still need to do to get there?

This race, and especially those I fix in the follow-on patchset
https://lore.kernel.org/linux-pci/cover.1776868550.git.bblock%40linux.ibm.com/
are pretty painful on s390 with PCI hotplug. It forces us to reboot the
system, since there is no other way to get out of the deadlock.

-- 
Best Regards, Benjamin Block        /        Linux on IBM Z Kernel Development
IBM Deutschland Research & Development GmbH    /   https://www.ibm.com/privacy
Vors. Aufs.-R.: Wolfgang Wendt         /        Geschäftsführung: David Faller
Sitz der Ges.: Ehningen     /     Registergericht: AmtsG Stuttgart, HRB 243294
