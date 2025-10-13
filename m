Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2BECCD18D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 14:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE41510E143;
	Mon, 13 Oct 2025 14:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H93AU1Gx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4332110E143
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760367465; x=1791903465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7D6zX8WNoJE9usHVvDN6N0FDy+1fj7TzzsaSoz65E5s=;
 b=H93AU1Gx7HQ1Gik1cr/QzPuvQ6tRotv9A91h3tHMa2I1fji4h43VtTK7
 tumaq+oPwoewF6PFdKM/b04ZX0dqCPP6PbYVu3Zpjze22cjdkt2kga2T5
 cF59yEcejaKSg8trZa9oYJguZLDQHRzyZ3BtoT62auDaW8CRfKff4N8HI
 FUSBEPKOLtuzXgDc5xm49lVv7fKLsLgy7BGVLVEv6hjU+wzpzq9Jcxa9a
 Mt1zlSdIsMx+GzA1lOpExNhpj3g2DcK7RlL0M0Wg0aSiSnhJg4GVot6Dz
 T5Nw++qfXwjhQvqpWe3Q2HerU2vW30mfK3ynUACv5J9pCgdjPUY9NAw7G g==;
X-CSE-ConnectionGUID: 5CPVtAzlT3GomhpGeLS8uA==
X-CSE-MsgGUID: hHQL+6CRSHGNZFYrMeCHkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73612716"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73612716"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:57:42 -0700
X-CSE-ConnectionGUID: R6IJUJAmSMeRnQhhYcA2zQ==
X-CSE-MsgGUID: gZeN8qIHTc6LrmQa08bUpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="181565662"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:57:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: rodrigo.vivi@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com, heikki.krogerus@linux.intel.com,
 andi.shyti@linux.intel.com
Subject: Re: [PATCH v3 0/2] Wire up reset/postinstall for I2C IRQ
Date: Mon, 13 Oct 2025 07:57:06 -0700
Message-ID: <176036737835.1701571.11729682859198230623.b4-ty@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011123509.3233213-1-raag.jadav@intel.com>
References: <20251011123509.3233213-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 11 Oct 2025 18:05:07 +0530, Raag Jadav wrote:
> This series wires up reset/postinstall handles for I2C IRQ so that it
> can be routed to SGunit or PUnit when needed.
> 
> v2: Integrate DISABLE_MSI_CAP changes (Heikki)
> v3: Drop DISABLE_MSI_CAP changes as they are not required for the usecase
> 
> Raag Jadav (2):
>   drm/xe/i2c: Introduce xe_i2c_irq_present()
>   drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
> 
> [...]

Merged to drm-xe-next, thanks!

[1/2] drm/xe/i2c: Introduce xe_i2c_irq_present()
      commit: 3df5aacb9d45fdc2ffaa2ecbddd43ac8fb17b351
[2/2] drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
      commit: 0bb78ce099265fba3808c05de1c75c649664a6cb

--
Lucas De Marchi

